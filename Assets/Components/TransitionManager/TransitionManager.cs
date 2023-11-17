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
    [SerializeField] private FloatReference transitionDuration;
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

    private IEnumerator PlayTransition(GameArea newGameArea)
    {
        transitioning.Value = true;

        // skip transition if we're moving to the same area
        if (currentGameArea.Value == newGameArea)
        {
            transitioning.Value = false;
            yield break;
        }

        // we use a long transition if the day changed, or whenever we come from / go to the menu
        var isNewDay = lastDay != currentDay.Value;
        var isMenuInvolved = newGameArea == GameArea.Menu || currentGameArea.Value == GameArea.Menu;
        if (isNewDay || isMenuInvolved)
        {
            // full video transition
            // turn off the current game area
            var enumerator = TurnOff(currentGameArea.Value);
            if (enumerator != null)
            {
                yield return enumerator;
            }
            // slide the video in
            yield return transitionVideo.StartVideoAndWaitForCover();
            // hide the old area
            Hide(currentGameArea.Value);
            // show the new area (it will be under the video, so it will be hidden from sight anyway)
            Show(newGameArea);
            // turn on the new area
            enumerator = TurnOn(newGameArea);
            if (enumerator != null)
            {
                yield return enumerator;
            }
            // wait for the video to complete (it will still slide out when we resume)
            yield return transitionVideo.WaitForStoppedVideoPlayer();
        }
        else
        {
            // shorter video transition: slide components sideways.
            // turn off the current game area
            var enumerator = TurnOff(currentGameArea.Value);
            if (enumerator != null)
            {
                yield return enumerator;
            }
            // slide the new area in from the left as the old area slides out to the right
            var currentRectTransform = areasRectTransform[currentGameArea.Value];
            var newRectTransform = areasRectTransform[newGameArea];
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
            yield return null; // just to be sure that the .From are executed
            // also show the new area (both are shown right now)
            Show(newGameArea);
            // wait for the animation to complete
            yield return sequence.WaitForCompletion();
            // hide the old one and reset its position
            Hide(currentGameArea.Value);
            currentRectTransform.anchorMin = new Vector2(0, 0);
            currentRectTransform.anchorMax = new Vector2(1, 1);
            // turn on the new one
            enumerator = TurnOn(newGameArea);
            if (enumerator != null)
            {
                yield return enumerator;
            }
        }
        currentGameArea.Value = newGameArea;
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
