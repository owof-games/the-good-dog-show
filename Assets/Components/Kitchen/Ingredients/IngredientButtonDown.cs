using System.Collections;
using System.Collections.Generic;

using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class IngredientButtonDown : MonoBehaviour, IPointerDownHandler
{
    [SerializeField] UnityEvent<PointerEventData> pointerDown;

    public void OnPointerDown(PointerEventData eventData)
    {
        pointerDown.Invoke(eventData);
    }

}
