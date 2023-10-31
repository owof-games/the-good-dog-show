using UnityEngine;
using System;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Variable of type `ControlType`. Inherits from `AtomVariable&lt;ControlType, ControlTypePair, ControlTypeEvent, ControlTypePairEvent, ControlTypeControlTypeFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/ControlType", fileName = "ControlTypeVariable")]
    public sealed class ControlTypeVariable : AtomVariable<ControlType, ControlTypePair, ControlTypeEvent, ControlTypePairEvent, ControlTypeControlTypeFunction>
    {
        protected override bool ValueEquals(ControlType other)
        {
            return Value == other;
        }
    }
}
