using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `ControlType`. Inherits from `AtomEvent&lt;ControlType&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/ControlType", fileName = "ControlTypeEvent")]
    public sealed class ControlTypeEvent : AtomEvent<ControlType>
    {
    }
}
