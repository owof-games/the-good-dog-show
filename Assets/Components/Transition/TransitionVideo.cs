using System.Collections;
using System.ComponentModel;

using DG.Tweening;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Video;

public class TransitionVideo : MonoBehaviour
{
    [SerializeField] private VideoPlayer videoPlayer;
    [SerializeField] private RectTransform targetImageTransform;
    [SerializeField] private FloatReference transitionDuration;
    [SerializeField, InspectorName("WebGL URL")] private string webGlURL;
#if UNITY_EDITOR
    [SerializeField] private BoolReference debugMode;
#endif

#if UNITY_WEBGL
    private void Awake()
    {
        videoPlayer.url = webGlURL;
        videoPlayer.clip = null;
    }
#endif

    /// <summary>
    /// A coroutine that starts playing the video, and waits for the video to completely cover the
    /// background.
    /// </summary>
    /// <returns></returns>
    public IEnumerator StartVideoAndWaitForCover()
    {
        videoPlayer.Stop();
        videoPlayer.Play();

        DOTween.Kill(targetImageTransform);
        yield return GetSlideYieldInstruction(true);

        StartCoroutine(SlideOutWhenComplete());
    }

    private IEnumerator SlideOutWhenComplete()
    {
        yield return WaitForStoppedVideoPlayer();
        DOTween.Kill(targetImageTransform);
        yield return GetSlideYieldInstruction(false);
    }

    private YieldInstruction GetSlideYieldInstruction(bool slideIn) => DOTween
        .Sequence()
        .Insert(0, targetImageTransform
                    .DOAnchorMin(new Vector2(slideIn ? 0 : -1, 0), transitionDuration)
                    .From(new Vector2(slideIn ? -1 : 0, 0)))
        .Insert(0, targetImageTransform
                    .DOAnchorMax(new Vector2(slideIn ? 1 : 0, 1), transitionDuration)
                    .From(new Vector2(slideIn ? 0 : 1, 1)))
        .WaitForCompletion();

    private class WaitForVideoPlayerCompleteYieldInstruction : CustomYieldInstruction
    {
        private readonly VideoPlayer videoPlayer;

        public WaitForVideoPlayerCompleteYieldInstruction(VideoPlayer videoPlayer)
        {
            this.videoPlayer = videoPlayer;
        }

        public override bool keepWaiting => videoPlayer.isPlaying;
    }

    public CustomYieldInstruction WaitForStoppedVideoPlayer() =>
#if UNITY_EDITOR
        debugMode ? null :
#endif
        new WaitForVideoPlayerCompleteYieldInstruction(videoPlayer);
}
