#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `GameAreaPair`. Inherits from `AtomDrawer&lt;GameAreaPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(GameAreaPairEvent))]
    public class GameAreaPairEventDrawer : AtomDrawer<GameAreaPairEvent> { }
}
#endif
