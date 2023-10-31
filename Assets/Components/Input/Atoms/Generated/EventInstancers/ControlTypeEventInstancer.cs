using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Instancer of type `ControlType`. Inherits from `AtomEventInstancer&lt;ControlType, ControlTypeEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-sign-blue")]
    [AddComponentMenu("Unity Atoms/Event Instancers/ControlType Event Instancer")]
    public class ControlTypeEventInstancer : AtomEventInstancer<ControlType, ControlTypeEvent> { }
}
