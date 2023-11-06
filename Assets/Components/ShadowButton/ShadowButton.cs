using LemuRivolta.InkAtoms;

using UnityEngine;
using UnityEngine.Assertions;
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
    private SelectionState previousSelectionState = SelectionState.Normal;

    private ShadowButtonCompanion companion;

    private ShadowButtonCompanion GetCompanion()
    {
        if(companion == null)
        {
            companion = GetComponent<ShadowButtonCompanion>();
            Assert.IsNotNull(companion);
        }
        return companion;
    }

    protected override void DoStateTransition(SelectionState state, bool instant)
    {
        base.DoStateTransition(state, instant);

        if (previousSelectionState == state)
        {
            return;
        }

        var prev = previousSelectionState;
        previousSelectionState = state;

        // show the shadow if we're selected
        GetCompanion().ShowShadow(state == SelectionState.Selected);

        // if we get highlighted and previously we weren't (not even selected), then select the button
        if (prev != SelectionState.Selected && state == SelectionState.Highlighted)
        {
            EventSystem.current.SetSelectedGameObject(gameObject);
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