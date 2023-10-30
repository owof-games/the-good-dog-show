#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `CharacterName`. Inherits from `AtomEventEditor&lt;CharacterName, CharacterNameEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(CharacterNameEvent))]
    public sealed class CharacterNameEventEditor : AtomEventEditor<CharacterName, CharacterNameEvent> { }
}
#endif
