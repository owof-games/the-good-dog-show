using DG.Tweening;
using LemuRivolta.InkAtoms;
using TMPro;
using UnityAtoms.BaseAtoms;
using UnityEngine;

public class Credits : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI textMeshPro;
    [SerializeField] private float transitionDuration;
    [SerializeField] private float stayDuration;
    [SerializeField] private float lastStayDuration;
    [SerializeField] private StringEvent continueEvent;
    [SerializeField] private GameAreaEvent moveToGameAreaEvent;

    private const string creditsPrefix = "_ ";

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        var text = storyStep.Text;
        if (text.IndexOf(creditsPrefix) != 0)
        {
            // not a credit line
            return;
        }

        textMeshPro.text = text[creditsPrefix.Length..].Replace(" _ ", "\n");
        var textTransform = textMeshPro.rectTransform;
        var y = textTransform.anchorMin.y;
        var usedStayDuration = storyStep.CanContinue ? stayDuration : lastStayDuration;
        var sequence = DOTween.Sequence()
            .Insert(0, textTransform
                .DOAnchorMin(new Vector2(0, y), transitionDuration)
                .From(new Vector2(-1, y)))
            .Insert(0, textTransform
                .DOAnchorMax(new Vector2(1, y), transitionDuration)
                .From(new Vector2(0, y)))
            .Insert(transitionDuration + usedStayDuration, textTransform
                .DOAnchorMin(new Vector2(1, y), transitionDuration)
                .From(new Vector2(0, y)))
            .Insert(transitionDuration + usedStayDuration, textTransform
                .DOAnchorMax(new Vector2(2, y), transitionDuration)
                .From(new Vector2(1, y)));
        sequence.OnComplete(() =>
        {
            // force the starting position back to avoid glitches
            textTransform.anchorMin = new Vector2(-1, y);
            textTransform.anchorMax = new Vector2(0, y);
            if (storyStep.CanContinue)
            {
                continueEvent.Raise(null);
            }
            else
            {
                moveToGameAreaEvent.Raise(GameArea.Menu);
            }
        });
    }
}