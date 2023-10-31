#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `ControlType`. Inherits from `AtomDrawer&lt;ControlTypeVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(ControlTypeVariable))]
    public class ControlTypeVariableDrawer : VariableDrawer<ControlTypeVariable> { }
}
#endif
