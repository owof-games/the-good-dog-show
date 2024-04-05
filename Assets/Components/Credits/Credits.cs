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
        var sequence = DOTween.Sequence()
                .Insert(0, textTransform
                    .DOAnchorMin(new Vector2(0, 0.85f), transitionDuration)
                    .From(new Vector2(-1, 0.85f)))
                .Insert(0, textTransform
                    .DOAnchorMax(new Vector2(1, 0.85f), transitionDuration)
                    .From(new Vector2(0, 0.85f)))
                .Insert(transitionDuration + stayDuration, textTransform
                    .DOAnchorMin(new Vector2(1, 0.85f), transitionDuration)
                    .From(new Vector2(0, 0.85f)))
                .Insert(transitionDuration + stayDuration, textTransform
                    .DOAnchorMax(new Vector2(2, 0.85f), transitionDuration)
                    .From(new Vector2(1, 0.85f)));
        sequence.OnComplete(() =>
        {
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
