using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

public class ShadowButtonCompanion : MonoBehaviour
{
    [SerializeField] private Image shadowImage;
    [SerializeField] private Image baseImage;
    [SerializeField] private ShadowButton shadowButton;

    private void Awake()
    {
        Assert.IsNotNull(shadowImage);
        Assert.IsNotNull(baseImage);
        Assert.IsNotNull(shadowButton);
    }

    private void Start()
    {
        shadowImage.sprite = baseImage.sprite;
    }

    public void ShowShadow(bool show)
    {
        shadowImage.enabled = show;
    }
}
