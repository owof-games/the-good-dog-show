#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `CharacterNamePair`. Inherits from `AtomDrawer&lt;CharacterNamePairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(CharacterNamePairEvent))]
    public class CharacterNamePairEventDrawer : AtomDrawer<CharacterNamePairEvent> { }
}
#endif
