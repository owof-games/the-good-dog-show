#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `CharacterName`. Inherits from `AtomDrawer&lt;CharacterNameEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(CharacterNameEvent))]
    public class CharacterNameEventDrawer : AtomDrawer<CharacterNameEvent> { }
}
#endif
