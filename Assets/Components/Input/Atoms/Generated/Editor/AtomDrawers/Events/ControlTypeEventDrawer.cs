#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `ControlType`. Inherits from `AtomDrawer&lt;ControlTypeEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(ControlTypeEvent))]
    public class ControlTypeEventDrawer : AtomDrawer<ControlTypeEvent> { }
}
#endif
