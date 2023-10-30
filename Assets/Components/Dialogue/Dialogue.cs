using LemuRivolta.InkAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class Dialogue : MonoBehaviour
{
    [SerializeField] private GameObject leftBalloonRoot;
    [SerializeField] private GameObject rightBalloonRoot;
    [SerializeField] private GameObject choicesRoot;
    [SerializeField] private GameObject otherRoot;

    private void Awake()
    {
        Assert.IsNotNull(leftBalloonRoot);
        Assert.IsNotNull(rightBalloonRoot);
        Assert.IsNotNull(choicesRoot);
        Assert.IsNotNull(otherRoot);
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
            leftBalloonRoot.SetActive(true);
            rightBalloonRoot.SetActive(false);
        }
        else
        {
            leftBalloonRoot.SetActive(false);
            rightBalloonRoot.SetActive(true);
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
}
