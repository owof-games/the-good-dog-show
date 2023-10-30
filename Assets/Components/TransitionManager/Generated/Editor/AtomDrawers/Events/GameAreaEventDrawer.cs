#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `GameArea`. Inherits from `AtomDrawer&lt;GameAreaEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(GameAreaEvent))]
    public class GameAreaEventDrawer : AtomDrawer<GameAreaEvent> { }
}
#endif
