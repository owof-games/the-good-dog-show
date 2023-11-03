using System.Collections;
using System.Collections.Generic;
using System.Linq;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Move To Lounge Command")]
public class MoveToLoungeCommand : CommandLineParser
{
    [SerializeField] private GameAreaEvent moveToGameAreaEvent;
    [SerializeField] private GameAreaVariable currentGameArea;
    [SerializeField] private CharacterNameEvent talkWithCharacterEvent;
    [SerializeField] private CharacterNameValueList charactersInLounge;

    public MoveToLoungeCommand() : base("moveToLounge") { }

    private void OnEnable()
    {
        Assert.IsNotNull(moveToGameAreaEvent);
        Assert.IsNotNull(currentGameArea);
        Assert.IsNotNull(talkWithCharacterEvent);
        Assert.IsNotNull(charactersInLounge);
    }

    public override IEnumerator Invoke(
        IDictionary<string, Parameter> parameters,
        StoryChoice[] choices,
        CommandLineParserAction commandLineParserAction)
    {
        if (choices.Length == 0)
        {
            // the fallback choice has been activated, do nothing
            yield break;
        }
        // move to the lounge
        moveToGameAreaEvent.Raise(GameArea.Lounge);
        yield return currentGameArea.Await(gameArea => gameArea == GameArea.Lounge);
        // update the characters list
        charactersInLounge.Clear();
        foreach (var choice in choices)
        {
            charactersInLounge.Add(System.Enum.Parse<CharacterName>(choice.Text));
        }
        // wait for any interaction with a character
        CharacterName characterName = CharacterName.BeBe; // just to initialize it
        yield return talkWithCharacterEvent.Await(onEvent: (cn) => { characterName = cn; });
        // take the choice corresponding to the character
        var selectedChoice = choices.First(choice => choice.Text == characterName.ToString());
        commandLineParserAction.TakeChoice(selectedChoice.Index);
    }
}
