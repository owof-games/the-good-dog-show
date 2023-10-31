using System;
using UnityEngine.Events;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// None generic Unity Event of type `ControlType`. Inherits from `UnityEvent&lt;ControlType&gt;`.
    /// </summary>
    [Serializable]
    public sealed class ControlTypeUnityEvent : UnityEvent<ControlType> { }
}
