using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `ControlType`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(ControlTypeVariable))]
    public sealed class ControlTypeVariableEditor : AtomVariableEditor<ControlType, ControlTypePair> { }
}
