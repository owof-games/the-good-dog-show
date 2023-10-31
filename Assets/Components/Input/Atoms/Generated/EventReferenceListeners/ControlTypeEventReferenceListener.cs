using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Reference Listener of type `ControlType`. Inherits from `AtomEventReferenceListener&lt;ControlType, ControlTypeEvent, ControlTypeEventReference, ControlTypeUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/ControlType Event Reference Listener")]
    public sealed class ControlTypeEventReferenceListener : AtomEventReferenceListener<
        ControlType,
        ControlTypeEvent,
        ControlTypeEventReference,
        ControlTypeUnityEvent>
    { }
}
