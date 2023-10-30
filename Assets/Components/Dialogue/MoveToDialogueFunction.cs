using System.Collections;

using Ink.Runtime;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Move To Dialogue External Function")]
public class MoveToDialogueFunction : CoroutineExternalFunction
{
    [SerializeField] private GameAreaEvent moveToGameAreaEvent;
    [SerializeField] private GameAreaVariable currentGameArea;
    [SerializeField] private CharacterNameVariable currentDialogueCharacter;

    public MoveToDialogueFunction() : base("moveToDialogue") { }

    private void OnEnable()
    {
        Assert.IsNotNull(moveToGameAreaEvent);
        Assert.IsNotNull(currentGameArea);
        Assert.IsNotNull(currentDialogueCharacter);
    }

    public override IEnumerator Call(ExternalFunctionContextWithResult context)
    {
        if(context.Arguments.Length != 1)
        {
            throw new System.ArgumentException("moveToDialogue needs a single argument");
        }

        var arg = context.Arguments[0];
        if(arg is not InkList characterList)
        {
            throw new System.ArgumentException("moveToDialogue needs a list argument");
        }

        var characterStringName = characterList.ToString();
        if(!System.Enum.TryParse<CharacterName>(characterStringName, out var characterName))
        {
            throw new System.ArgumentException($"Cannot find character name '{characterStringName}'");
        }

        moveToGameAreaEvent.Raise(GameArea.Dialogue);
        currentDialogueCharacter.Value = characterName;
        yield return currentGameArea.Await(gameArea => gameArea == GameArea.Dialogue);
    }
}
