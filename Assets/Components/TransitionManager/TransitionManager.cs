using System.Collections;
using System.Collections.Generic;
using System.Linq;

using LemuRivolta.InkAtoms;

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

    [SerializeField] private BoolVariable transitioning;

    [SerializeField] private TransitionVideo transitionVideo;
    [SerializeField] private GameAreaComponent[] areas;

    private Dictionary<GameArea, GameAreaComponent> areasMapping;

    private void Awake()
    {
        Assert.IsNotNull(transitionVideo);

        areasMapping = areas.ToDictionary(c => c.GameArea);
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

    private IEnumerator PlayTransition(GameArea gameArea)
    {
        transitioning.Value = true;
        if (currentGameArea.Value == gameArea)
        {
            transitioning.Value = false;
            yield break;
        }

        var enumerator = TurnOff(gameArea);
        if (enumerator != null)
        {
            yield return enumerator;
        }
        yield return transitionVideo.StartVideoAndWaitForCover();
        enumerator = TurnOn(gameArea);
        if (enumerator != null)
        {
            yield return enumerator;
        }
        yield return transitionVideo.WaitForStoppedVideoPlayer();
        currentGameArea.Value = gameArea;
        transitioning.Value = false;
    }

    /// <summary>
    /// Turn on the given game area.
    /// </summary>
    /// <param name="gameArea">The game area to turn on.</param>
    private IEnumerator TurnOn(GameArea gameArea)
    {
        IEnumerator enumerator;

        // turn on the new area, possibly executing its OnTurnOn
        foreach (var g in areasMapping.Keys)
        {
            var active = gameArea == g;
            if (!active)
            {
                continue;
            }
            GameObject go = GetGameAreaComponent(g).gameObject;
            go.SetActive(true);
            if (go.TryGetComponent<TransitionTarget>(out var transitionTarget) &&
                (enumerator = transitionTarget.OnTurnOn()) != null)
            {
                while (enumerator.MoveNext())
                {
                    yield return enumerator.Current;
                }
            }
        }
    }

    /// <summary>
    /// Turn off everything but the current area.
    /// </summary>
    /// <param name="gameArea">The game area to keep on.</param>
    private IEnumerator TurnOff(GameArea gameArea)
    {
        IEnumerator enumerator;

        // turn off the area that is on, possibly executing its OnTurnOff
        foreach (var g in areasMapping.Keys)
        {
            if (g == gameArea)
            {
                continue;
            }
            var go = GetGameAreaComponent(g).gameObject;
            if (!go.activeSelf)
            {
                continue;
            }
            if (go.TryGetComponent<TransitionTarget>(out var transitionTarget) &&
                (enumerator = transitionTarget.OnTurnOff()) != null)
            {
                while (enumerator.MoveNext())
                {
                    yield return enumerator.Current;
                }
            }
            go.SetActive(false);
        }
    }
}
