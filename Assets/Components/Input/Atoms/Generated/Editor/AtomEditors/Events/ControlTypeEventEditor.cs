#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `ControlType`. Inherits from `AtomEventEditor&lt;ControlType, ControlTypeEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(ControlTypeEvent))]
    public sealed class ControlTypeEventEditor : AtomEventEditor<ControlType, ControlTypeEvent> { }
}
#endif
