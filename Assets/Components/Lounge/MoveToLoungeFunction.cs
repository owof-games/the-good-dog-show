using System.Collections;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Move To Lounge External Function")]
public class MoveToLoungeFunction : CoroutineExternalFunction
{
    [SerializeField] private GameAreaEvent moveToGameAreaEvent;
    [SerializeField] private GameAreaVariable currentGameArea;

    public MoveToLoungeFunction() : base("moveToLounge") { }

    private void OnEnable()
    {
        Assert.IsNotNull(moveToGameAreaEvent);
        Assert.IsNotNull(currentGameArea);
    }

    public override IEnumerator Call(ExternalFunctionContextWithResult context)
    {
        moveToGameAreaEvent.Raise(GameArea.Lounge);
        yield return currentGameArea.Await(gameArea => gameArea == GameArea.Lounge);
    }
}
