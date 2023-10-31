using LemuRivolta.InkAtoms;

using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class ShadowButton : Button
{
    private bool lastShowShadowState;

    protected override void DoStateTransition(SelectionState state, bool instant)
    {
        base.DoStateTransition(state, instant);
        //Debug.Log($"Transitioning {gameObject.name} to {state}");

        // show the shadow if we're selected
        lastShowShadowState = state == SelectionState.Selected;
        if (TryGetComponent<ShadowButtonCompanion>(out var shadowButtonCompanion))
        {
            Debug.Log($"Setting shadow state of {gameObject.name} to {lastShowShadowState}");
            shadowButtonCompanion.ShowShadow(lastShowShadowState);
        }
        else
        {
            Debug.Log($"Ups, no shadow companion for {gameObject.name}");
        }

        // if we're highlighted, then select the button
        if (state == SelectionState.Highlighted)
        {
            MainThreadQueue.EnqueueLater(() =>
                EventSystem.current.SetSelectedGameObject(gameObject));
        }
    }
}
