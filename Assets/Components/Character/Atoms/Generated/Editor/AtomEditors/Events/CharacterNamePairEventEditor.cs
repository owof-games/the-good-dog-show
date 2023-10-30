#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `CharacterNamePair`. Inherits from `AtomEventEditor&lt;CharacterNamePair, CharacterNamePairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(CharacterNamePairEvent))]
    public sealed class CharacterNamePairEventEditor : AtomEventEditor<CharacterNamePair, CharacterNamePairEvent> { }
}
#endif
