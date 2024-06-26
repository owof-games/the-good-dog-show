using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.LowLevel;
using UnityEngine.InputSystem.Users;

using static UnityEngine.InputSystem.InputAction;

public class InputManager : MonoBehaviour
{
    [SerializeField] private GameAreaVariable currentGameArea;
    [SerializeField] private PlayerInput playerInput;
    [SerializeField] private ControlTypeVariable controlType;
    [SerializeField] private VoidEvent choice1Performed;
    [SerializeField] private VoidEvent choice2Performed;
    [SerializeField] private VoidEvent choice3Performed;
    [SerializeField] private VoidEvent toggleMenuPerformed;

    private Mouse virtualMouse;

    private void Awake()
    {
        Assert.IsNotNull(currentGameArea);
        Assert.IsNotNull(playerInput);
        Assert.IsNotNull(controlType);
        Assert.IsNotNull(choice1Performed);
        Assert.IsNotNull(choice2Performed);
        Assert.IsNotNull(choice3Performed);
        Assert.IsNotNull(toggleMenuPerformed);
    }

    private void OnEnable()
    {
        currentGameArea.Changed.Register(OnCurrentGameAreaChanged);

        OnEnableCursor();
    }

    private void Start()
    {
        UpdateActionMap();
    }

    private void OnDisable()
    {
        if (virtualMouse != null)
        {
            InputSystem.RemoveDevice(virtualMouse);
        }
        currentGameArea.Changed.Unregister(OnCurrentGameAreaChanged);
        InputSystem.onAfterUpdate -= UpdateMotion;
    }

    public void OnCurrentGameAreaChanged(GameArea _) => UpdateActionMap();

    private void UpdateActionMap()
    {
        switch (currentGameArea.Value)
        {
            case GameArea.Dialogue:
            case GameArea.DogronTalk:
                playerInput.enabled = true;
                playerInput.SwitchCurrentActionMap("Dialogue");
                break;
            default:
                playerInput.SwitchCurrentActionMap("EmptyActionMap");
                break;
        }
    }

    private bool firstTime = true;

    public void OnControlsChanged(PlayerInput _)
    {
        Debug.Log("Controls changed: " + playerInput.currentControlScheme);
        var previousValue = controlType.Value;
        controlType.Value = playerInput.currentControlScheme switch
        {
            "MouseAndKeyboard" => ControlType.MouseAndKeyboard,
            "Xbox" => ControlType.Xbox,
            "Gamepad" => ControlType.Gamepad,
            _ => throw new System.Exception($"Unknown control scheme {playerInput.currentControlScheme}")
        };

        var wasMouseAndKeyboard = previousValue == ControlType.MouseAndKeyboard;
        var isMouseAndKeyboard = controlType.Value == ControlType.MouseAndKeyboard;

        if (firstTime || wasMouseAndKeyboard != isMouseAndKeyboard)
        {
            firstTime = false;
            SwitchMouse(isMouseAndKeyboard);
        }
    }

    private static readonly UnityAtoms.Void @void = new();

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

    public void ToggleMenuPerformed(CallbackContext cc)
    {
        if (cc.phase == InputActionPhase.Performed)
        {
            toggleMenuPerformed.Raise(@void);
        }
    }

    #region virtual mouse

    [SerializeField] private float cursorSpeed = 700;

    [SerializeField] private RectTransform cursorTransform;
    [SerializeField] private RectTransform canvasTransform;
    [SerializeField] private Canvas canvas;

    private void OnEnableCursor()
    {
        virtualMouse ??= InputSystem.AddDevice<Mouse>("VirtualMouse");
        if (!virtualMouse.added)
        {
            InputSystem.AddDevice(virtualMouse);
        }

        InputUser.PerformPairingWithDevice(virtualMouse, playerInput.user);

        if (cursorTransform != null)
        {
            var position = cursorTransform.anchoredPosition;
            InputState.Change(virtualMouse.position, position);
        }

        InputSystem.onAfterUpdate += UpdateMotion;

        Cursor.visible = false;
    }

    private void UpdateMotion()
    {
        if (controlType.Value == ControlType.MouseAndKeyboard)
        {
            AnchorCursor(Mouse.current.position.ReadValue());
        }
        else
        {
            if (virtualMouse == null || Gamepad.current == null)
            {
                return;
            }

            var deltaValue = Gamepad.current.leftStick.ReadValue();
            deltaValue *= cursorSpeed * Time.deltaTime;

            var currentPosition = virtualMouse.position.ReadValue();
            var newPosition = currentPosition + deltaValue;

            newPosition.x = Mathf.Clamp(newPosition.x, 0, Screen.width);
            newPosition.y = Mathf.Clamp(newPosition.y, 0, Screen.height);

            InputState.Change(virtualMouse.position, newPosition);
            InputState.Change(virtualMouse.delta, deltaValue);

            AnchorCursor(newPosition);
        }
    }

    private void AnchorCursor(Vector2 newPosition)
    {
        RectTransformUtility.ScreenPointToLocalPointInRectangle(canvasTransform, newPosition,
            canvas.renderMode == RenderMode.ScreenSpaceOverlay ? null : Camera.main,
            out var anchoredPosition);
        cursorTransform.anchoredPosition = anchoredPosition;
    }

    private void SwitchMouse(bool isMouseAndKeyboard)
    {
        Mouse physicalMouse = Mouse.current;
        if (physicalMouse == null || virtualMouse == null)
        {
            Debug.Log("mice not ready");
            return;
        }

        if (!isMouseAndKeyboard)
        {
            InputState.Change(virtualMouse.position, physicalMouse.position.ReadValue());
            InputState.Change(virtualMouse.delta, physicalMouse.delta.ReadValue());
        }
        else
        {
            Vector2 virtualPosition = virtualMouse.position.ReadValue();
            InputState.Change(physicalMouse.position, virtualPosition);
            InputState.Change(physicalMouse.delta, virtualMouse.delta.ReadValue());
            physicalMouse.WarpCursorPosition(virtualPosition);

        }
    }

    #endregion
}
