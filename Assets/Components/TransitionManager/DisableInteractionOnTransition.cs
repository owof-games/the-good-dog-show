using UnityEngine;

public class DisableInteractionOnTransition : MonoBehaviour
{
    [SerializeField] private CanvasGroup canvasGroup;

    public void OnTransitioningChangedEvent(bool isTransitioning) =>
        canvasGroup.interactable = !isTransitioning;
}
