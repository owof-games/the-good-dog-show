using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Character : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    [SerializeField] private Image mainImage;
    [SerializeField] private Image shadow;

    private void Start()
    {
        Assert.IsNotNull(shadow);
        shadow.sprite = mainImage.sprite;
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        shadow.gameObject.SetActive(true);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        shadow.gameObject.SetActive(false);
    }
}
