using LemuRivolta.InkAtoms;

using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

/// <summary>
/// <para>
/// A button that displays a shadow under it when it's selected or highlighted.
/// </para>
/// <para>
/// See also: <seealso cref="ShadowButtonCompanion"/>.
/// </para>
/// </summary>
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
            //Debug.Log($"Setting shadow state of {gameObject.name} to {lastShowShadowState}");
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

    #region FindSelectableOn* overrides to skip inactive objects

    public override Selectable FindSelectableOnRight()
    {
        Selectable s = base.FindSelectableOnRight();
        return s == null || s.gameObject.activeSelf ? s : s.FindSelectableOnRight();
    }

    public override Selectable FindSelectableOnLeft()
    {
        Selectable s = base.FindSelectableOnLeft();
        return s == null || s.gameObject.activeSelf ? s : s.FindSelectableOnLeft();
    }

    public override Selectable FindSelectableOnUp()
    {
        Selectable s = base.FindSelectableOnUp();
        return s == null || s.gameObject.activeSelf ? s : s.FindSelectableOnUp();
    }

    public override Selectable FindSelectableOnDown()
    {
        Selectable s = base.FindSelectableOnDown();
        return s == null || s.gameObject.activeSelf ? s : s.FindSelectableOnDown();
    }

    #endregion
}