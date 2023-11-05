using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using LemuRivolta.InkAtoms;
using UnityAtoms.BaseAtoms;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Move To <something> Command")]
public class MoveToCommand : CommandLineParser
{
    [SerializeField] private GameArea gameArea;
    [SerializeField] private string commandName;
    [SerializeField] private GameAreaEvent moveToGameAreaEvent;
    [SerializeField] private GameAreaVariable currentGameArea;

    public override string CommandName => commandName;

    private void OnEnable()
    {
        Assert.IsNotNull(moveToGameAreaEvent);
        Assert.IsNotNull(currentGameArea);
        Assert.IsFalse(string.IsNullOrWhiteSpace(commandName));
    }

    public override IEnumerator Invoke(IDictionary<string, Parameter> parameters, StoryChoice[] choices, CommandLineParserAction commandLineParserAction)
    {
        moveToGameAreaEvent.Raise(gameArea);
        yield return currentGameArea.Await(ga => ga == gameArea);
    }
}
