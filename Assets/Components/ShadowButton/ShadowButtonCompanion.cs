using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

/// <summary>
/// Companion component to <see cref="ShadowButton"/>. The functionality is split into two components
/// because ShadowButton derives from Button and as such also inherits its property drawer, making it
/// not trivial to add new properties.
/// </summary>
public class ShadowButtonCompanion : MonoBehaviour
{
    [SerializeField] private Image shadowImage;
    [SerializeField] private Image foregroundImage;
    [SerializeField] private Image baseImage;
    [SerializeField] private ShadowButton shadowButton;

    private void Awake()
    {
        Assert.IsNotNull(shadowImage);
        Assert.IsNotNull(foregroundImage);
        Assert.IsNotNull(baseImage);
        Assert.IsNotNull(shadowButton);
    }

    private void Start()
    {
        shadowImage.sprite = baseImage.sprite;
        foregroundImage.sprite = baseImage.sprite;
        foregroundImage.enabled = true;
        baseImage.enabled = false;
    }

    public void ShowShadow(bool show)
    {
        shadowImage.enabled = show;
    }
}
