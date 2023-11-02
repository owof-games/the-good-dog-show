using System.Collections;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Move To <something> External Function")]
public class MoveToExternalFunction : CoroutineExternalFunction
{
    [SerializeField] private GameArea gameArea;
    [SerializeField] private string functionName;
    [SerializeField] private GameAreaEvent moveToGameAreaEvent;
    [SerializeField] private GameAreaVariable currentGameArea;

    public override string Name => functionName;

    private void OnEnable()
    {
        Assert.IsNotNull(moveToGameAreaEvent);
        Assert.IsNotNull(currentGameArea);
        Assert.IsFalse(string.IsNullOrWhiteSpace(functionName));
    }

    public override IEnumerator Call(ExternalFunctionContextWithResult context)
    {
        moveToGameAreaEvent.Raise(gameArea);
        yield return currentGameArea.Await(ga => ga == gameArea);
    }
}
