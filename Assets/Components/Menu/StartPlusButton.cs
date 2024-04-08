using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;

public class StartPlusButton : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    [SerializeField] private GameObject tipObject;

    private void Start()
    {
        Assert.IsNotNull(tipObject);
        tipObject.SetActive(false);
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        tipObject.SetActive(true);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        tipObject.SetActive(false);
    }
}
