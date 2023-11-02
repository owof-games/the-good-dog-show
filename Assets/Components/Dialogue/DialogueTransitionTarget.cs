using System;
using System.Collections;

using DG.Tweening;

using UnityEngine;
using UnityEngine.Assertions;

public class DialogueTransitionTarget : TransitionTarget
{
    [SerializeField] private RectTransform youRectTransform;
    [SerializeField] private RectTransform otherRectTransform;
    [SerializeField] private RectTransform youStart;
    [SerializeField] private RectTransform otherStart;
    [SerializeField] private float duration = 0.3f;

    private void Awake()
    {
        Assert.IsNotNull(youRectTransform);
        Assert.IsNotNull(otherRectTransform);
    }

    public override IEnumerator OnTurnOn()
    {
        youRectTransform.DOComplete();
        otherRectTransform.DOComplete();

        const float easeOvershootOrAmplitude = 0.2f;

        var tweenYou = youRectTransform.DOAnchorPos(youStart.anchoredPosition, duration)
            .From()
            .SetEase(Ease.OutBounce);
        tweenYou.easeOvershootOrAmplitude = easeOvershootOrAmplitude;
        var tweenOther = otherRectTransform.DOAnchorPos(otherStart.anchoredPosition, duration)
            .From()
            .SetEase(Ease.OutBounce);
        tweenOther.easeOvershootOrAmplitude = easeOvershootOrAmplitude;
        while (tweenYou.active || tweenOther.active)
        {
            yield return null;
        }
    }
}
