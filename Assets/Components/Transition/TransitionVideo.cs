using System.Collections;

using DG.Tweening;

using UnityEngine;
using UnityEngine.Video;

public class TransitionVideo : MonoBehaviour
{
    [SerializeField] private VideoPlayer videoPlayer;
    [SerializeField] private RectTransform targetImageTransform;
    [SerializeField] private float slideTime = 0.3f;

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
        yield return GetSlideYieldInstruction(false);
    }

    private YieldInstruction GetSlideYieldInstruction(bool slideIn) => DOTween
        .Sequence()
        .Insert(0, targetImageTransform
                    .DOAnchorMin(new Vector2(slideIn ? 0 : -1, 0), slideTime)
                    .From(new Vector2(slideIn ? -1 : 0, 0)))
        .Insert(0, targetImageTransform
                    .DOAnchorMax(new Vector2(slideIn ? 1 : 0, 1), slideTime)
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
        new WaitForVideoPlayerCompleteYieldInstruction(videoPlayer);
}
