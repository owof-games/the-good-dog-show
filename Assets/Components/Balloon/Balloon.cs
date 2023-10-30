using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

using Ink.Parsed;

using LemuRivolta.InkAtoms;

using TMPro;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.Events;
using UnityEngine.UI;

public class Balloon : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI textContents;
    [SerializeField] private UnityEvent advance;
    [SerializeField] private GameObject hideButtonAdvance;
    [SerializeField] private Button buttonAdvance;
    [SerializeField] private float charactersPerSecond;

    private void Awake()
    {
        Assert.IsNotNull(textContents);
        Assert.IsNotNull(advance);
        Assert.IsNotNull(hideButtonAdvance);
        Assert.IsNotNull(buttonAdvance);
        Assert.IsTrue(charactersPerSecond > 0);
    }

    public void SetText(string text)
    {
        // the SetActive of SetTextInternal will cause the listeners to activate, and rely on replay callbacks
        // but since we've been called inside an event, and the replay callbacks aren't saved until _after_
        // if we do it right now, we'll end up _not_ having the replay callbacks
        IEnumerator SetTextInternal()
        {
            // because of the optimizations of MainThreadQueue, we have to force a yield return null
            // if we want the execution to actually start on the next frame
            yield return null;
            gameObject.SetActive(true);
            StopAllCoroutines();
            StartCoroutine(SetTextCoroutine(text));
        }
        MainThreadQueue.Enqueue(SetTextInternal);
    }

    private bool setTextCoroutineRunning = false;
    private bool forceTextToEnd = false;

    private IEnumerator SetTextCoroutine(string text)
    {
        setTextCoroutineRunning = true;
        forceTextToEnd = false;
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
            setTextCoroutineRunning = false;
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
    }

    private bool canContinue;

    public void OnAdvanceButtonClick()
    {
        // clicking while the text is running will just cause it to go to the end
        if (setTextCoroutineRunning)
        {
            forceTextToEnd = true;
        }
        // otherwise, actually advance (if we can)
        else if (canContinue)
        {
            advance.Invoke();
        }
    }

    public void OnStoryStepChanged(StoryStep step)
    {
        hideButtonAdvance.SetActive(!step.CanContinue);
        canContinue = step.CanContinue;
    }
}
