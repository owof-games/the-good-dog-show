using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `GameArea`. Inherits from `AtomEvent&lt;GameArea&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/GameArea", fileName = "GameAreaEvent")]
    public sealed class GameAreaEvent : AtomEvent<GameArea>
    {
    }
}
