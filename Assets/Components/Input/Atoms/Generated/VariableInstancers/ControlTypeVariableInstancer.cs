using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Variable Instancer of type `ControlType`. Inherits from `AtomVariableInstancer&lt;ControlTypeVariable, ControlTypePair, ControlType, ControlTypeEvent, ControlTypePairEvent, ControlTypeControlTypeFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/ControlType Variable Instancer")]
    public class ControlTypeVariableInstancer : AtomVariableInstancer<
        ControlTypeVariable,
        ControlTypePair,
        ControlType,
        ControlTypeEvent,
        ControlTypePairEvent,
        ControlTypeControlTypeFunction>
    { }
}
