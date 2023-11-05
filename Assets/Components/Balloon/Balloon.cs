using System.Collections;
using System.Collections.Generic;

using LemuRivolta.InkAtoms;

using TMPro;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Balloon : MonoBehaviour
{
    [SerializeField] private float charactersPerSecond;
    [SerializeField] private UnityEvent advance;

    [Header("Atoms")]
    [SerializeField] private BoolVariable isWritingText;
    [SerializeField] private StoryStepVariable storyStep;
    [SerializeField] private GameAreaEventReference moveToGameAreaEvent;

    [Header("Internal References")]
    [SerializeField] private TextMeshProUGUI textContents;
    [SerializeField] private GameObject hideButtonAdvance;
    [SerializeField] private Button buttonAdvance;
    [SerializeField] private GameObject inputHint;

    private void Awake()
    {
        Assert.IsNotNull(textContents);
        Assert.IsNotNull(advance);
        Assert.IsNotNull(hideButtonAdvance);
        Assert.IsNotNull(buttonAdvance);
        Assert.IsTrue(charactersPerSecond > 0);
        Assert.IsNotNull(isWritingText);
        Assert.IsNotNull(inputHint);
        Assert.IsNotNull(moveToGameAreaEvent.Event);
    }

    private void OnEnable()
    {
        storyStep.Changed.Register(OnStoryStepChanged);
    }

    private void Start()
    {
        UpdateButton();
    }

    private void OnDisable()
    {
        storyStep.Changed.Unregister(OnStoryStepChanged);
    }

    private string text;

    public string Text
    {
        get => text;
        set
        {
            if (text == value) return;
            text = value;
            SetText(text);
        }
    }

    private void SetText(string text)
    {
        // the SetActive of SetTextInternal will cause the listeners to activate, and rely on replay callbacks
        // but since could be called inside an event, and the replay callbacks aren't saved until _after_
        // if we do it right now, we'll end up _not_ having the replay callbacks
        MainThreadQueue.EnqueueLater(() =>
        {
            // because of the optimizations of MainThreadQueue, we have to force a yield return null
            // if we want the execution to actually start on the next frame
            gameObject.SetActive(true);
            StopAllCoroutines();
            StartCoroutine(SetTextCoroutine(text));
            EventSystem.current.SetSelectedGameObject(buttonAdvance.gameObject);
        }, "setting balloon text");
    }

    private bool forceTextToEnd = false;

    private IEnumerator SetTextCoroutine(string text)
    {
        isWritingText.Value = true;
        forceTextToEnd = false;
        UpdateButton();
        try
        {
            // produce the mesh with the text contents
            textContents.text = text;
            textContents.ForceMeshUpdate();

            var textInfo = textContents.textInfo;

            // gather all character infos
            List<TMP_CharacterInfo> characterInfos = new();
            for (var i = 0; i < textInfo.characterCount; i++)
            {
                TMP_CharacterInfo ci = textInfo.characterInfo[i];
                if (ci.isVisible)
                {
                    characterInfos.Add(ci);
                }
            }

            // make all characters transparent
            foreach (var characterInfo in characterInfos)
            {
                SetCharAlpha(textInfo, characterInfo, 0);
            }

            // turn them on one at a time
            foreach (var characterInfo in characterInfos)
            {
                SetCharAlpha(textInfo, characterInfo, 255);
                // wait between characters, unless the user has clicked on the text to ask for it to get to the end
                if (!forceTextToEnd)
                {
                    yield return new WaitForSeconds(1f / charactersPerSecond);
                }
            }
        }
        finally
        {
            isWritingText.Value = false;
            UpdateButton();
        }
    }

    private void SetCharAlpha(TMP_TextInfo textInfo, TMP_CharacterInfo characterInfo, byte a)
    {
        int materialReferenceIndex = characterInfo.materialReferenceIndex;
        TMP_MeshInfo meshInfo = textInfo.meshInfo[materialReferenceIndex];
        var vertexColors = meshInfo.colors32;
        int vertexIndex = characterInfo.vertexIndex;
        for (var i = 0; i < 4; i++)
        {
            vertexColors[vertexIndex + i].a = a;
        }
        textInfo.textComponent.UpdateVertexData();
    }

    public void Hide()
    {
        gameObject.SetActive(false);
        text = "";
    }

    public void SelectButton() => EventSystem.current.SetSelectedGameObject(buttonAdvance.gameObject);

    public void OnAdvanceButtonClick()
    {
        // clicking while the text is running will just cause it to go to the end
        if (isWritingText.Value)
        {
            forceTextToEnd = true;
        }
        // otherwise, actually advance (if we can)
        else if (storyStep.Value.CanContinue)
        {
            advance.Invoke();
        }
        // if we reached the end of the story, straight jump to the main menu
        // TODO: this could change if we have a credits scene
        else if (!storyStep.Value.CanContinue && storyStep.Value.Choices.Length == 0)
        {
            moveToGameAreaEvent.Event.Raise(GameArea.Menu);
        }
    }

    public void OnStoryStepChanged(StoryStep _)
    {
        UpdateButton();
    }

    private void UpdateButton()
    {
        buttonAdvance.interactable = isWritingText.Value || storyStep.Value.Choices.Length == 0;
        hideButtonAdvance.SetActive(!buttonAdvance.interactable || isWritingText.Value);
        inputHint.SetActive(buttonAdvance.interactable);
    }
}
