#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `GameAreaPair`. Inherits from `AtomEventEditor&lt;GameAreaPair, GameAreaPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(GameAreaPairEvent))]
    public sealed class GameAreaPairEventEditor : AtomEventEditor<GameAreaPair, GameAreaPairEvent> { }
}
#endif
