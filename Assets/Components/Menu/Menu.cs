using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class Menu : MonoBehaviour
{
    [SerializeField] private GameAreaEvent moveToGameAreaEvent;

    private void Start()
    {
        Assert.IsNotNull(moveToGameAreaEvent);
    }

    public void MoveToLounge() => moveToGameAreaEvent.Raise(GameArea.Lounge);
}
