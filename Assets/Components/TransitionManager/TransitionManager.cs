using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net.WebSockets;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

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
        OnMoveToGameArea(currentGameArea.Value);
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
    public void OnMoveToGameArea(GameArea gameArea)
    {
        if (currentGameArea.Value == gameArea)
        {
            TurnOn(gameArea); // just for startup
            return;
        }
        StartCoroutine(PlayTransition(gameArea));
    }

    private IEnumerator PlayTransition(GameArea gameArea)
    {
        transitioning.Value = true;
        yield return transitionVideo.StartVideoAndWaitForCover();
        TurnOn(gameArea);
        yield return transitionVideo.WaitForStoppedVideoPlayer();
        currentGameArea.Value = gameArea;
        transitioning.Value = false;
    }

    /// <summary>
    /// Turn on the given game area and off all the others.
    /// </summary>
    /// <param name="gameArea">The game area to turn on or off.</param>
    private void TurnOn(GameArea gameArea)
    {
        foreach (var g in areasMapping.Keys)
        {
            GetGameAreaComponent(g)
                .gameObject
                .SetActive(gameArea == g);
        }
    }
}
