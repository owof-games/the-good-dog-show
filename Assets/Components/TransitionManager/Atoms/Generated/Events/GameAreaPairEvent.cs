using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `GameAreaPair`. Inherits from `AtomEvent&lt;GameAreaPair&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/GameAreaPair", fileName = "GameAreaPairEvent")]
    public sealed class GameAreaPairEvent : AtomEvent<GameAreaPair>
    {
    }
}
