#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `GameArea`. Inherits from `AtomEventEditor&lt;GameArea, GameAreaEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(GameAreaEvent))]
    public sealed class GameAreaEventEditor : AtomEventEditor<GameArea, GameAreaEvent> { }
}
#endif
