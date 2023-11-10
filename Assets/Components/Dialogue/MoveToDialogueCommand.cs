using System.Collections;
using System.Collections.Generic;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Move To Dialogue Command")]
public class MoveToDialogueCommand : CommandLineParser
{
    [SerializeField] private GameAreaEvent moveToGameAreaEvent;
    [SerializeField] private GameAreaVariable currentGameArea;
    [SerializeField] private CharacterNameVariable currentDialogueCharacter;

    public MoveToDialogueCommand() : base("moveToDialogue") { }

    private void OnEnable()
    {
        Assert.IsNotNull(moveToGameAreaEvent);
        Assert.IsNotNull(currentGameArea);
        Assert.IsNotNull(currentDialogueCharacter);
    }

    public override IEnumerator Invoke(IDictionary<string, Parameter> parameters, StoryChoice[] choices, CommandLineParserAction commandLineParserAction)
    {
        // get character name from parameters
        var characterStringName = GetParameter(parameters, "character");

        // convert to a CharacterName enum
        if (!System.Enum.TryParse<CharacterName>(characterStringName, out var characterName))
        {
            throw new System.ArgumentException($"Cannot find character name '{characterStringName}'");
        }

        // move to the specified dialogue
        currentDialogueCharacter.Value = characterName;
        moveToGameAreaEvent.Raise(GameArea.Dialogue);
        yield return currentGameArea.Await(gameArea => gameArea == GameArea.Dialogue);
    }

}
