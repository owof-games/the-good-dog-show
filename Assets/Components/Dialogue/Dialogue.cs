using System.Collections;
using System.Linq;
using DG.Tweening;
using DG.Tweening.Core;
using DG.Tweening.Plugins.Options;
using LemuRivolta.InkAtoms;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;

public class Dialogue : TransitionTarget
{
    [SerializeField] private Balloon leftBalloon;
    [SerializeField] private Balloon rightBalloon;
    [SerializeField] private GameObject choicesRoot;
    [SerializeField] private GameObject otherRoot;

    [SerializeField] private StoryStepVariable storyStep;
    [SerializeField] private BoolVariable isWritingText;

    [SerializeField] private StringEvent continueEvent;

    [SerializeField] private SerializableInkListItemValueList abilities;

    [SerializeField] private RectTransform youRectTransform;
    [SerializeField] private RectTransform otherRectTransform;
    [SerializeField] private RectTransform youStart;
    [SerializeField] private RectTransform otherStart;
    [SerializeField] private float animationDuration = 0.3f;

    [SerializeField] private Ease easingIn;
    [SerializeField] private Ease easingOut;

    private bool otherCharacterHasLeft = true;
    [SerializeField] private OtherCharacterLeavesCommand otherCharacterLeavesCommand;

    private Vector2? youInitialPosition;
    private Vector2? otherInitialPosition;

    private void Awake()
    {
        Assert.IsNotNull(leftBalloon);
        Assert.IsNotNull(rightBalloon);
        Assert.IsNotNull(choicesRoot);
        // Assert.IsNotNull(otherRoot); // otherRoot can be null (e.g.: ending)
        Assert.IsNotNull(storyStep);
        Assert.IsNotNull(isWritingText);
        Assert.IsNotNull(continueEvent);
        Assert.IsNotNull(youRectTransform);
        Assert.IsNotNull(otherRectTransform);
        Assert.IsNotNull(youStart);
        Assert.IsNotNull(otherStart);
        Assert.IsNotNull(abilities);

        if (otherCharacterLeavesCommand != null)
        {
            otherCharacterLeavesCommand.Dialogue = this;
        }
    }

    private void Start()
    {
        UpdateElements();
    }

    private void Update()
    {
        // always have at least one selected object
        SelectRelevantObject();
    }

    private void OnEnable()
    {
        // prepare for transition
        youRectTransform.DOComplete();
        otherRectTransform.DOComplete();
    }

    public override IEnumerator OnTurnOn()
    {
        youRectTransform.gameObject.SetActive(true);
        otherRectTransform.gameObject.SetActive(true);

        if (!youInitialPosition.HasValue)
        {
            youInitialPosition = youRectTransform.anchoredPosition;
            otherInitialPosition = otherRectTransform.anchoredPosition;
        }

        youRectTransform.anchoredPosition = youStart.anchoredPosition;
        var tweenYou = youRectTransform.DOAnchorPos(youInitialPosition.Value, animationDuration)
            .SetEase(easingIn);
        otherRectTransform.anchoredPosition = otherStart.anchoredPosition;
        var tweenOther = otherRectTransform.DOAnchorPos(otherInitialPosition.Value, animationDuration)
            .SetEase(easingIn);

        yield return tweenYou.WaitForCompletion();
        yield return tweenOther.WaitForCompletion();
        otherCharacterHasLeft = false;
        // while (tweenYou.active || tweenOther.active)
        // {
        //     yield return null;
        // }

        storyStep.Changed.Register(OnStoryStepChanged);
        isWritingText.Changed.Register(OnIsWritingTextChanged);
    }

    /// <summary>
    /// Called by an ink event if the other character must leave earlier (see: letter)
    /// </summary>
    public IEnumerator OnOtherCharacterLeaves()
    {
        var tweenOther = ExitOther();
        yield return tweenOther.WaitForCompletion();
        otherCharacterHasLeft = true;
    }

    public override IEnumerator OnTurnOff()
    {
        storyStep.Changed.Unregister(OnStoryStepChanged);
        isWritingText.Changed.Unregister(OnIsWritingTextChanged);

        leftBalloon.Hide();
        rightBalloon.Hide();
        choicesRoot.SetActive(false);

        youRectTransform.DOComplete();
        otherRectTransform.DOComplete();

        youRectTransform.anchoredPosition = youInitialPosition.Value;
        var tweenYou = youRectTransform.DOAnchorPos(youStart.anchoredPosition, animationDuration)
            .SetEase(easingOut);
        var tweenOther = otherCharacterHasLeft ? null : ExitOther();

        yield return tweenYou.WaitForCompletion();
        yield return tweenOther?.WaitForCompletion();
        // while (tweenYou.active || tweenOther.active)
        // {
        //     yield return null;
        // }

        youRectTransform.gameObject.SetActive(false);
        otherRectTransform.gameObject.SetActive(false);
    }

    private TweenerCore<Vector2, Vector2, VectorOptions> ExitOther()
    {
        otherRectTransform.anchoredPosition = otherInitialPosition.Value;
        var tweenOther = otherRectTransform.DOAnchorPos(otherStart.anchoredPosition, animationDuration)
            .SetEase(easingOut);
        return tweenOther;
    }

    private void OnIsWritingTextChanged(bool _)
    {
        UpdateElements();
    }

    public void OnStoryStepChanged(StoryStep _)
    {
        UpdateElements();
    }

    private void UpdateElements()
    {
        // show the dialogue balloons
        var (characterName, characterLine) = GetCharacterLine(storyStep.Value.Text);
        if (characterName == null)
        {
            Debug.Log($"Dialogue got line '{characterLine}', cannot parse an actor");
            return;
        }

        if (characterName == "YOU")
        {
            leftBalloon.Text = characterLine;
            rightBalloon.Hide();
        }
        else
        {
            leftBalloon.Hide();
            rightBalloon.Text = characterLine;
        }

        // show the choices
        MainThreadQueue.EnqueueLater(() =>
                choicesRoot.SetActive(storyStep.Value.Choices.Length > 0 && !isWritingText.Value),
            "showing or hiding dialogue choices");

        // try to select a relevant UI element if possible
        MainThreadQueue.EnqueueLater(() => SelectRelevantObject(true), "forcing selection of dialogue UI item");
    }

    private void SelectRelevantObject(bool force = false)
    {
        if (!force && EventSystem.current.currentSelectedGameObject != null)
        {
            return;
        }

        if (choicesRoot.activeSelf)
        {
            EventSystem.current.SetSelectedGameObject(choicesRoot.transform.GetChild(0).gameObject);
        }
        else if (leftBalloon.gameObject.activeSelf)
        {
            leftBalloon.SelectButton();
        }
        else if (rightBalloon.gameObject.activeSelf)
        {
            rightBalloon.SelectButton();
        }
    }

    private (string, string) GetCharacterLine(string text)
    {
        var canSeeIngredients = abilities.Any(ability => ability.itemName == "EvidenziaIngredienti");
        if (!canSeeIngredients)
        {
            text = text.Replace("<b>", "").Replace("</b>", "");
        }

        return GetCharacterAndText(text);
    }

    public static (string, string) GetCharacterAndText(string text)
    {
        text = text.Trim();

        var parts = text.Split(':', 2);
        if (parts.Length == 2)
        {
            return (parts[0].Trim(), parts[1].Trim());
        }
        else
        {
            return (null, text);
        }
    }

    public void OnCurrentDialogueCharacterChanged(CharacterName characterName)
    {
        if (otherRoot == null)
        {
            return;
        }

        foreach (var character in otherRoot.GetComponentsInChildren<Character>(true))
        {
            character.gameObject.SetActive(character.CharacterName == characterName);
        }
    }

    public void OnBalloonClick()
    {
        continueEvent.Raise(null);
    }
}