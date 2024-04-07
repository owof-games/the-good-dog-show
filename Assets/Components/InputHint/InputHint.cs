using UnityEngine;
using UnityEngine.Assertions;

/// <summary>
/// An icon showing an input hint that changes according to the current control scheme.
/// </summary>
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

    [SerializeField] private GameObject bImage;
    [SerializeField] private GameObject aImage;
    [SerializeField] private GameObject xImage;
    [SerializeField] private GameObject yImage;
    [SerializeField] private GameObject nImage;
    [SerializeField] private GameObject sImage;
    [SerializeField] private GameObject eImage;
    [SerializeField] private GameObject wImage;
    [SerializeField] private GameObject oneImage;
    [SerializeField] private GameObject twoImage;
    [SerializeField] private GameObject threeImage;
    [SerializeField] private GameObject returnImage;

    private void Awake()
    {
        Assert.AreNotEqual(MouseAndKeyboardIcon, Icon.None);
        Assert.AreNotEqual(XboxIcon, Icon.None);
        Assert.AreNotEqual(GamepadIcon, Icon.None);
        Assert.IsNotNull(aImage);
        Assert.IsNotNull(bImage);
        Assert.IsNotNull(xImage);
        Assert.IsNotNull(yImage);
        Assert.IsNotNull(nImage);
        Assert.IsNotNull(sImage);
        Assert.IsNotNull(wImage);
        Assert.IsNotNull(eImage);
        Assert.IsNotNull(oneImage);
        Assert.IsNotNull(twoImage);
        Assert.IsNotNull(threeImage);
        Assert.IsNotNull(returnImage);
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
        bImage.SetActive(icon == Icon.B);
        aImage.SetActive(icon == Icon.A);
        xImage.SetActive(icon == Icon.X);
        yImage.SetActive(icon == Icon.Y);
        nImage.SetActive(icon == Icon.North);
        sImage.SetActive(icon == Icon.South);
        eImage.SetActive(icon == Icon.East);
        wImage.SetActive(icon == Icon.West);
        oneImage.SetActive(icon == Icon.One);
        twoImage.SetActive(icon == Icon.Two);
        threeImage.SetActive(icon == Icon.Three);
        returnImage.SetActive(icon == Icon.Return);
    }
}
