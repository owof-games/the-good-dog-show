using System.Collections;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Move To Lounge External Function")]
public class MoveToLoungeFunction : CoroutineExternalFunction
{
    [SerializeField] private GameAreaEvent moveToGameAreaEvent;
    [SerializeField] private GameAreaVariable currentGameArea;

    public MoveToLoungeFunction() : base("moveToLounge") { }

    public override IEnumerator Call(ExternalFunctionContextWithResult context)
    {
        moveToGameAreaEvent.Raise(GameArea.Lounge);
        yield return currentGameArea.Await(gameArea => gameArea == GameArea.Lounge);
    }
}
