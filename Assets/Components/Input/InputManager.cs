using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class InputManager : MonoBehaviour
{
    [SerializeField] private GameAreaVariable currentGameArea;

    private Controls controls;

    private void Awake()
    {
        Assert.IsNotNull(currentGameArea);
        controls = new();
    }

    private void OnEnable()
    {
        currentGameArea.Changed.Register(OnCurrentGameAreaChanged);
    }

    private void Start()
    {
        UpdateActionMap();
    }

    private void OnDisable()
    {
        currentGameArea.Changed.Unregister(OnCurrentGameAreaChanged);
    }

    public void OnCurrentGameAreaChanged(GameArea _) => UpdateActionMap();

    private void UpdateActionMap()
    {
        if (currentGameArea.Value == GameArea.Dialogue)
        {
            controls.Dialogue.Enable();
        }
        else
        {
            controls.Dialogue.Disable();
        }
    }
}
