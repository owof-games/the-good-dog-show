using LemuRivolta.InkAtoms;

using TMPro;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class KitchenTextBlock : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI tmp;
    [SerializeField] private StringEvent continueEvent;
    [SerializeField] private Behaviour[] toEnable;

    private void Awake()
    {
        Assert.IsNotNull(tmp);
        Assert.IsNotNull(continueEvent);
        foreach (Behaviour behaviour in toEnable)
        {
            Assert.IsNotNull(behaviour);
        }
    }

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        EnableUIElements(true);
        tmp.text = storyStep.Text;
        continueEvent.Raise(null);
    }

    public void OnHide() => EnableUIElements(false);

    private void EnableUIElements(bool enabled)
    {
        foreach (var element in toEnable)
        {
            element.enabled = enabled;
        }
    }
}
