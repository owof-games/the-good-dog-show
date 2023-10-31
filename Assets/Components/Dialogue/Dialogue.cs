using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;

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

    private GameObject lastSelected;
    private void Update()
    {
        var newSelected = EventSystem.current.currentSelectedGameObject;
        if (lastSelected != newSelected)
        {
            var name = newSelected == null ? "<nothing>" : newSelected.name;
            //Debug.Log($"selection changed to {name}", newSelected);
            lastSelected = newSelected;
        }
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

        // try to select a relevant UI element if possible
        MainThreadQueue.EnqueueLater(() =>
        {
            if (EventSystem.current.currentSelectedGameObject != null)
            {
                return;
            }

            if (choicesRoot.activeSelf)
            {
                EventSystem.current.SetSelectedGameObject(choicesRoot.transform.GetChild(0).gameObject);
            }
            else if (leftBalloon.gameObject.activeSelf)
            {
                EventSystem.current.SetSelectedGameObject(leftBalloon.gameObject);
            }
            else if (rightBalloon.gameObject.activeSelf)
            {
                EventSystem.current.SetSelectedGameObject(rightBalloon.gameObject);
            }
        });
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
