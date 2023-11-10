using System.Collections;
using System.Collections.Generic;
using System.Linq;

using DG.Tweening;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

/// <summary>
/// Manager object that handles the transitions between different areas.
/// </summary>
public class TransitionManager : MonoBehaviour
{
    [Tooltip("The variable containing the current game area.")]
    [SerializeField] private GameAreaVariable currentGameArea;

    [SerializeField] private IntReference currentDay;

    [SerializeField] private BoolVariable transitioning;

    [SerializeField] private TransitionVideo transitionVideo;
    [SerializeField] private GameAreaComponent[] areas;

    private Dictionary<GameArea, GameAreaComponent> areasMapping;
    private Dictionary<GameArea, RectTransform> areasRectTransform;

    private void Awake()
    {
        Assert.IsNotNull(transitionVideo);

        areasMapping = areas.ToDictionary(c => c.GameArea);
        areasRectTransform = areas.ToDictionary(c => c.GameArea, c => c.GetComponent<RectTransform>());
    }

    private void Start()
    {
        OnMoveToGameArea(currentGameArea.Value, true);
    }

    /// <summary>
    /// Get the component corresponding to given game area.
    /// </summary>
    /// <param name="gameArea">The game area.</param>
    /// <returns>The game area component.</returns>
    /// <exception cref="System.ArgumentException">If the game area is unknown.</exception>
    private GameAreaComponent GetGameAreaComponent(GameArea gameArea)
    {
        if (areasMapping.TryGetValue(gameArea, out var result))
        {
            return result;
        }
        else
        {
            throw new System.ArgumentException($"unknown game area {gameArea}");
        }
    }

    /// <summary>
    /// Callback method for when it's requested to change the game area.
    /// </summary>
    /// <param name="gameArea">The new game area.</param>
    public void OnMoveToGameArea(GameArea gameArea) => OnMoveToGameArea(gameArea, false);

    public void OnMoveToGameArea(GameArea gameArea, bool startup)
    {
        if (startup)
        {
            Show(gameArea);
            var enumerator = TurnOn(gameArea); // just for startup
            if (enumerator != null)
            {
                StartCoroutine(enumerator);
            }
        }
        else
        {
            StartCoroutine(PlayTransition(gameArea));
        }
    }

    private int lastDay = -1;

    private IEnumerator PlayTransition(GameArea gameArea)
    {
        transitioning.Value = true;

        // skip transition if we're moving to the same area
        if (currentGameArea.Value == gameArea)
        {
            transitioning.Value = false;
            yield break;
        }

        var isNewDay = lastDay != currentDay.Value;
        if (isNewDay)
        {
            // moving to a new day (or first transition): full video transition
            // slide the video in
            yield return transitionVideo.StartVideoAndWaitForCover();
            // turn off the current game area
            var enumerator = TurnOff(currentGameArea.Value);
            if (enumerator != null)
            {
                yield return enumerator;
            }
            Hide(currentGameArea.Value);
            // turn on the new one
            Show(gameArea);
            enumerator = TurnOn(gameArea);
            if (enumerator != null)
            {
                yield return enumerator;
            }
            // wait for the video to have completed
            yield return transitionVideo.WaitForStoppedVideoPlayer();
        }
        else
        {
            // shorter video transition: slide components.
            // turn off the current game area
            var enumerator = TurnOff(currentGameArea.Value);
            if (enumerator != null)
            {
                yield return enumerator;
            }
            // slide the new area in
            var currentRectTransform = areasRectTransform[currentGameArea.Value];
            var newRectTransform = areasRectTransform[gameArea];
            const float transitionDuration = 0.3f;
            var sequence = DOTween.Sequence()
                .Insert(0, newRectTransform
                    .DOAnchorMin(new Vector2(0, 0), transitionDuration)
                    .From(new Vector2(-1, 0)))
                .Insert(0, newRectTransform
                    .DOAnchorMax(new Vector2(1, 1), transitionDuration)
                    .From(new Vector2(0, 1)))
                .Insert(0, currentRectTransform
                    .DOAnchorMin(new Vector2(1, 0), transitionDuration))
                .Insert(0, currentRectTransform
                    .DOAnchorMax(new Vector2(2, 1), transitionDuration));
            yield return null;
            Show(gameArea);
            yield return sequence.WaitForCompletion();
            // turn on the new one
            enumerator = TurnOn(gameArea);
            if (enumerator != null)
            {
                yield return enumerator;
            }
        }
        currentGameArea.Value = gameArea;
        transitioning.Value = false;
        lastDay = currentDay.Value;
    }

    /// <summary>
    /// Turn on the given game area.
    /// </summary>
    /// <param name="gameArea">The game area to turn on.</param>
    private void Show(GameArea gameArea)
    {
        // turn on the new area, possibly executing its OnTurnOn
        GameObject go = GetGameAreaComponent(gameArea).gameObject;
        go.SetActive(true);
    }

    private IEnumerator TurnOn(GameArea gameArea)
    {
        IEnumerator enumerator;
        GameObject go = GetGameAreaComponent(gameArea).gameObject;
        if (go.TryGetComponent<TransitionTarget>(out var transitionTarget) &&
            (enumerator = transitionTarget.OnTurnOn()) != null)
        {
            while (enumerator.MoveNext())
            {
                yield return enumerator.Current;
            }
        }
    }

    /// <summary>
    /// Turn off everything but the current area.
    /// </summary>
    /// <param name="gameArea">The game area to keep on.</param>
    private void Hide(GameArea gameArea)
    {
        // turn on the new area, possibly executing its OnTurnOn
        GameObject go = GetGameAreaComponent(gameArea).gameObject;
        go.SetActive(false);
    }

    private IEnumerator TurnOff(GameArea gameArea)
    {
        IEnumerator enumerator;

        GameObject go = GetGameAreaComponent(gameArea).gameObject;
        if (go.TryGetComponent<TransitionTarget>(out var transitionTarget) &&
            (enumerator = transitionTarget.OnTurnOff()) != null)
        {
            while (enumerator.MoveNext())
            {
                yield return enumerator.Current;
            }
        }
    }
}
