using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;

public class Character : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    [SerializeField] private GameObject shadowObject;

    private void Start()
    {
        Assert.IsNotNull(shadowObject);
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        shadowObject.SetActive(true);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        shadowObject.SetActive(false);
    }
}
