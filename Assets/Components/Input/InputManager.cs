using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.InputSystem;

public class InputManager : MonoBehaviour
{
    [SerializeField] private GameAreaVariable currentGameArea;
    [SerializeField] private PlayerInput playerInput;
    [SerializeField] private ControlTypeVariable controlType;

    private void Awake()
    {
        Assert.IsNotNull(currentGameArea);
        Assert.IsNotNull(playerInput);
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
            playerInput.enabled = true;
            playerInput.SwitchCurrentActionMap("Dialogue");
        }
        else
        {
            playerInput.enabled = false;
        }
    }

    public void OnControlsChanged(PlayerInput _)
    {
        controlType.Value = playerInput.currentControlScheme switch
        {
            "MouseAndKeyboard" => ControlType.MouseAndKeyboard,
            "Xbox" => ControlType.Xbox,
            "Gamepad" => ControlType.Gamepad,
            _ => throw new System.Exception($"Unknown control scheme {playerInput.currentControlScheme}")
        };
    }
}
