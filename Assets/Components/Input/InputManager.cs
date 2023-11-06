using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.InputSystem;

using static UnityEngine.InputSystem.InputAction;

public class InputManager : MonoBehaviour
{
    [SerializeField] private GameAreaVariable currentGameArea;
    [SerializeField] private PlayerInput playerInput;
    [SerializeField] private ControlTypeVariable controlType;
    [SerializeField] private VoidEvent choice1Performed;
    [SerializeField] private VoidEvent choice2Performed;
    [SerializeField] private VoidEvent choice3Performed;

    private void Awake()
    {
        Assert.IsNotNull(currentGameArea);
        Assert.IsNotNull(playerInput);
        Assert.IsNotNull(controlType);
        Assert.IsNotNull(choice1Performed);
        Assert.IsNotNull(choice2Performed);
        Assert.IsNotNull(choice3Performed);
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

    private static UnityAtoms.Void @void = new();

    public void PerformChoice1(CallbackContext cc) => PerformChoice(cc, choice1Performed);
    public void PerformChoice2(CallbackContext cc) => PerformChoice(cc, choice2Performed);
    public void PerformChoice3(CallbackContext cc) => PerformChoice(cc, choice3Performed);

    private void PerformChoice(CallbackContext cc, VoidEvent choicePerformed)
    {
        if (cc.phase == InputActionPhase.Performed)
        {
            Debug.Log(choicePerformed.name);
            choicePerformed.Raise(@void);
        }
    }
}
