using LemuRivolta.InkAtoms;

using TMPro;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class ChoiceButton : MonoBehaviour
{
    [SerializeField] private int choiceNumber;
    [SerializeField] private Button button;
    [SerializeField] private TextMeshProUGUI textMeshPro;
    [SerializeField] private ChosenChoiceEvent choiceEvent;

    [SerializeField] private StoryStepVariable storyStep;
    [SerializeField] private BoolVariable isTextRunning;

    private void Awake()
    {
        Assert.IsTrue(choiceNumber > 0);
        Assert.IsNotNull(button);
        Assert.IsNotNull(textMeshPro);
        Assert.IsNotNull(choiceEvent);
        Assert.IsNotNull(storyStep);
        Assert.IsNotNull(isTextRunning);
    }

    private void OnEnable()
    {
        storyStep.Changed.Register(OnStoryStepChanged);
        isTextRunning.Changed.Register(OnIsTextRunningChanged);
    }

    private void Start()
    {
        UpdateElements();
    }

    private void OnDisable()
    {
        storyStep.Changed.Unregister(OnStoryStepChanged);
        isTextRunning.Changed.Unregister(OnIsTextRunningChanged);
    }

    private void OnIsTextRunningChanged(bool _) => UpdateElements();

    public void OnStoryStepChanged(StoryStep _) => UpdateElements();

    private void UpdateElements()
    {
        if (storyStep.Value.Choices.Length < choiceNumber || isTextRunning.Value)
        {
            button.interactable = false;
        }
        else
        {
            var choice = storyStep.Value.Choices[choiceNumber - 1];
            button.interactable = true;
            var text = choice.Text.Split(':')[^1].Trim();
            textMeshPro.text = text;
        }
    }

    public void OnClick()
    {
        choiceEvent.Raise(new()
        {
            ChoiceIndex = choiceNumber - 1,
            FlowName = null
        });
    }

    public void SimulateClick()
    {
        ExecuteEvents.Execute(gameObject,
            new BaseEventData(EventSystem.current),
            ExecuteEvents.submitHandler);
    }

}
