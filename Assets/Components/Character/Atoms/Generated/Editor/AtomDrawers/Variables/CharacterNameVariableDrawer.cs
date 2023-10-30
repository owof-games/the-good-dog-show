#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `CharacterName`. Inherits from `AtomDrawer&lt;CharacterNameVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(CharacterNameVariable))]
    public class CharacterNameVariableDrawer : VariableDrawer<CharacterNameVariable> { }
}
#endif
