using System;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Reference of type `ControlType`. Inherits from `AtomEventReference&lt;ControlType, ControlTypeVariable, ControlTypeEvent, ControlTypeVariableInstancer, ControlTypeEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class ControlTypeEventReference : AtomEventReference<
        ControlType,
        ControlTypeVariable,
        ControlTypeEvent,
        ControlTypeVariableInstancer,
        ControlTypeEventInstancer>, IGetEvent 
    { }
}
