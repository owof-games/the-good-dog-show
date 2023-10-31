#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `ControlTypePair`. Inherits from `AtomEventEditor&lt;ControlTypePair, ControlTypePairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(ControlTypePairEvent))]
    public sealed class ControlTypePairEventEditor : AtomEventEditor<ControlTypePair, ControlTypePairEvent> { }
}
#endif
