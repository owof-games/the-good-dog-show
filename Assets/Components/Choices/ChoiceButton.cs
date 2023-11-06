using System;

using LemuRivolta.InkAtoms;

using TMPro;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

public class ChoiceButton : MonoBehaviour
{
    [SerializeField] private int choiceNumber;
    [SerializeField] private Button button;
    [SerializeField] private TextMeshProUGUI textMeshPro;
    [SerializeField] private Image forwardArrow;
    [SerializeField] private Image backArrow;
    [SerializeField] private InputHint inputHint;

    [Header("Atoms")]
    [SerializeField] private ChosenChoiceEvent choiceEvent;
    [SerializeField] private IntReference currentChoicePage;
    [SerializeField] private StoryStepVariable storyStep;
    [SerializeField] private BoolVariable isTextRunning;

    private void Awake()
    {
        Assert.IsTrue(choiceNumber >= 0);
        Assert.IsNotNull(button);
        Assert.IsNotNull(textMeshPro);
        Assert.IsNotNull(choiceEvent);
        Assert.IsNotNull(storyStep);
        Assert.IsNotNull(isTextRunning);
        Assert.IsNotNull(forwardArrow);
        Assert.IsNotNull(backArrow);
        Assert.IsNotNull(inputHint);
    }

    private void OnEnable()
    {
        storyStep.Changed.Register(OnStoryStepChanged);
        isTextRunning.Changed.Register(OnIsTextRunningChanged);
        currentChoicePage.GetEvent<IntEvent>().Register(OnCurrentChoicePageChanged);
    }

    private void Start()
    {
        UpdateElements();
    }

    private void OnDisable()
    {
        storyStep.Changed.Unregister(OnStoryStepChanged);
        isTextRunning.Changed.Unregister(OnIsTextRunningChanged);
        currentChoicePage.GetEvent<IntEvent>().Unregister(OnCurrentChoicePageChanged);
    }

    private void OnIsTextRunningChanged(bool _) => UpdateElements();

    public void OnStoryStepChanged(StoryStep _) => UpdateElements();

    private void OnCurrentChoicePageChanged(int _)
    {
        // when the current page change, reselect the first choice
        if (choiceNumber == 0)
        {
            button.Select();
        }

        UpdateElements();
    }

    private void UpdateElements()
    {
        // if there are no choices, just reset the choices page for the next time and return
        if (storyStep.Value.Choices.Length == 0)
        {
            currentChoicePage.Value = 0;
            return;
        }

        int myIndex = GetMyIndex();

        if (myIndex < 0)
        {
            // showing special forward/back button
            textMeshPro.enabled = false;
            forwardArrow.enabled = myIndex == -1;
            backArrow.enabled = myIndex == -2;
            button.interactable = true;
        }
        else if (isTextRunning.Value || myIndex >= storyStep.Value.Choices.Length)
        {
            // choice out of bound
            textMeshPro.enabled = false;
            forwardArrow.enabled = false;
            backArrow.enabled = false;
            button.interactable = false;
        }
        else
        {
            // actual choice
            var choice = storyStep.Value.Choices[myIndex];
            var text = choice.Text.Split(':')[^1].Trim();
            textMeshPro.text = text;

            textMeshPro.enabled = true;
            forwardArrow.enabled = false;
            backArrow.enabled = false;
            button.interactable = true;
        }
        inputHint.gameObject.SetActive(button.interactable);
    }

    public void OnClick()
    {
        var myIndex = GetMyIndex();

        if (myIndex >= 0)
        {
            choiceEvent.Raise(new()
            {
                ChoiceIndex = myIndex,
                FlowName = null
            });
        }
        else if (myIndex == -1)
        {
            currentChoicePage.Value++;
        }
        else if (myIndex == -2)
        {
            currentChoicePage.Value = 0;
        }
        else
        {
            throw new InvalidOperationException($"Choice with index < -2 ({myIndex}).");
        }
    }

    public void OnPerformChoice(int choiceNumber)
    {
        if (choiceNumber == this.choiceNumber)
        {
            OnClick();
        }
    }

    /// <summary>
    /// Get the index of this choice.
    /// </summary>
    /// <returns>The index of this choice, or <c>-1</c> for the forward button, or <c>-2</c> for the back button.</returns>
    private int GetMyIndex()
    {
        var numPages = storyStep.Value.Choices.Length <= 3 ? 1 : (int)Mathf.Ceil(storyStep.Value.Choices.Length / 2.0f);
        var myIndex = numPages == 1 ?
            // if there's just one page of choices, then the index of this choice is the same as its position
            choiceNumber :
            // if there's more than one page, then the first two choice numbers take account of the current page
            choiceNumber < 2 ?
            currentChoicePage.Value * 2 + choiceNumber :
            // if there's more, the last choice is used to go to the next page (-1) or wrap around (-2)
            currentChoicePage.Value == numPages - 1 ? -2 : -1;
        return myIndex;
    }
}
