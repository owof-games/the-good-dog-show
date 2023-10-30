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

    [SerializeField] private StringEvent continueEvent;

    private void Awake()
    {
        Assert.IsNotNull(leftBalloon);
        Assert.IsNotNull(rightBalloon);
        Assert.IsNotNull(choicesRoot);
        Assert.IsNotNull(otherRoot);
        Assert.IsNotNull(continueEvent);
    }

    public void OnStoryStepChanged(StoryStep step)
    {
        var (characterName, characterLine) = GetCharacterLine(step.Text);
        if (characterName == null)
        {
            Debug.Log($"Dialogue got line '{characterLine}', cannot parse an actor");
            return;
        }

        if (characterName == "YOU")
        {
            leftBalloon.SetText(characterLine);
            rightBalloon.Hide();
        }
        else
        {
            leftBalloon.Hide();
            rightBalloon.SetText(characterLine);
        }
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
