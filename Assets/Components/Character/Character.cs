using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Character : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    [SerializeField] private Image mainImage;
    [SerializeField] private Image shadow;
    [SerializeField] private Button button;
    [SerializeField] private CharacterName characterName;

    private void Awake()
    {
        Assert.IsNotNull(shadow);
        Assert.IsNotNull(mainImage);
        Assert.IsNotNull(button);
    }

    private void Start()
    {
        shadow.sprite = mainImage.sprite;
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        if (button.IsInteractable())
        {
            shadow.gameObject.SetActive(true);
        }
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        shadow.gameObject.SetActive(false);
    }
}
