using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class Dialogue : MonoBehaviour
{
    [SerializeField] private Balloon leftBalloon;
    [SerializeField] private Balloon rightBalloon;
    [SerializeField] private GameObject choicesRoot;
    [SerializeField] private GameObject otherRoot;

    [SerializeField] private StoryStepVariable storyStep;
    [SerializeField] private BoolVariable isWritingText;

    [SerializeField] private StringEvent continueEvent;

    private void Awake()
    {
        Assert.IsNotNull(leftBalloon);
        Assert.IsNotNull(rightBalloon);
        Assert.IsNotNull(choicesRoot);
        Assert.IsNotNull(otherRoot);
        Assert.IsNotNull(storyStep);
        Assert.IsNotNull(isWritingText);
        Assert.IsNotNull(continueEvent);
    }

    private void OnEnable()
    {
        storyStep.Changed.Register(OnStoryStepChanged);
        isWritingText.Changed.Register(OnIsWritingTextChanged);
    }

    private void Start()
    {
        UpdateElements();
    }

    private void OnDisable()
    {
        storyStep.Changed.Unregister(OnStoryStepChanged);
        isWritingText.Changed.Unregister(OnIsWritingTextChanged);
    }

    private void OnIsWritingTextChanged(bool _)
    {
        UpdateElements();
    }

    public void OnStoryStepChanged(StoryStep _)
    {
        UpdateElements();
    }

    private void UpdateElements()
    {
        // show the dialogue balloons
        var (characterName, characterLine) = GetCharacterLine(storyStep.Value.Text);
        if (characterName == null)
        {
            Debug.Log($"Dialogue got line '{characterLine}', cannot parse an actor");
            return;
        }

        if (characterName == "YOU")
        {
            leftBalloon.Text = characterLine;
            rightBalloon.Hide();
        }
        else
        {
            leftBalloon.Hide();
            rightBalloon.Text = characterLine;
        }

        // show the choices
        MainThreadQueue.EnqueueLater(() =>
            choicesRoot.SetActive(storyStep.Value.Choices.Length > 0 && !isWritingText.Value));
    }

    private (string, string) GetCharacterLine(string text)
    {
        text = text.Trim();
        var parts = text.Split(':', 2);
        if (parts.Length == 2)
        {
            return (parts[0].Trim(), parts[1].Trim());
        }
        else
        {
            return (null, text);
        }
    }

    public void OnCurrentDialogueCharacterChanged(CharacterName characterName)
    {
        foreach (var character in otherRoot.GetComponentsInChildren<Character>(true))
        {
            character.gameObject.SetActive(character.CharacterName == characterName);
        }
    }

    public void OnBalloonClick()
    {
        continueEvent.Raise(null);
    }
}
