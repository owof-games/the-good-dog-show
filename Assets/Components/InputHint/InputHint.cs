using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

public class InputHint : MonoBehaviour
{
    public enum Icon
    {
        None,
        A,
        B,
        X,
        Y,
        North,
        East,
        West,
        South,
        One,
        Two,
        Three,
        Return
    }

    [SerializeField] private Icon MouseAndKeyboardIcon;
    [SerializeField] private Icon XboxIcon;
    [SerializeField] private Icon GamepadIcon;

    [SerializeField] private Image image;
    [SerializeField] private Sprite aSprite;
    [SerializeField] private Sprite bSprite;
    [SerializeField] private Sprite xSprite;
    [SerializeField] private Sprite ySprite;
    [SerializeField] private Sprite nSprite;
    [SerializeField] private Sprite sSprite;
    [SerializeField] private Sprite eSprite;
    [SerializeField] private Sprite wSprite;
    [SerializeField] private Sprite oneSprite;
    [SerializeField] private Sprite twoSprite;
    [SerializeField] private Sprite threeSprite;
    [SerializeField] private Sprite returnSprite;

    private void Awake()
    {
        Assert.AreNotEqual(MouseAndKeyboardIcon, Icon.None);
        Assert.AreNotEqual(XboxIcon, Icon.None);
        Assert.AreNotEqual(GamepadIcon, Icon.None);
        Assert.IsNotNull(image);
        Assert.IsNotNull(aSprite);
        Assert.IsNotNull(bSprite);
        Assert.IsNotNull(xSprite);
        Assert.IsNotNull(ySprite);
        Assert.IsNotNull(nSprite);
        Assert.IsNotNull(sSprite);
        Assert.IsNotNull(wSprite);
        Assert.IsNotNull(eSprite);
        Assert.IsNotNull(oneSprite);
        Assert.IsNotNull(twoSprite);
        Assert.IsNotNull(threeSprite);
        Assert.IsNotNull(returnSprite);
    }

    public void OnControlTypeChanged(ControlType controlType)
    {
        var icon = controlType switch
        {
            ControlType.Gamepad => GamepadIcon,
            ControlType.MouseAndKeyboard => MouseAndKeyboardIcon,
            ControlType.Xbox => XboxIcon,
            _ => throw new System.Exception("unknown control type")
        };
        var sprite = icon switch
        {
            Icon.None => null,
            Icon.A => aSprite,
            Icon.B => bSprite,
            Icon.X => xSprite,
            Icon.Y => ySprite,
            Icon.South => sSprite,
            Icon.West => wSprite,
            Icon.East => eSprite,
            Icon.North => nSprite,
            Icon.One => oneSprite,
            Icon.Two => twoSprite,
            Icon.Three => threeSprite,
            Icon.Return => returnSprite,
            _ => throw new System.Exception("unknown icon")
        };
        image.sprite = sprite;
    }
}
