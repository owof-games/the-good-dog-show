using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `ControlTypePair`. Inherits from `AtomEvent&lt;ControlTypePair&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/ControlTypePair", fileName = "ControlTypePairEvent")]
    public sealed class ControlTypePairEvent : AtomEvent<ControlTypePair>
    {
    }
}
