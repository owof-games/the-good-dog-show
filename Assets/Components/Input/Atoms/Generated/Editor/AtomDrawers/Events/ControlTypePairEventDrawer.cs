#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `ControlTypePair`. Inherits from `AtomDrawer&lt;ControlTypePairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(ControlTypePairEvent))]
    public class ControlTypePairEventDrawer : AtomDrawer<ControlTypePairEvent> { }
}
#endif
