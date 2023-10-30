using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `CharacterName`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(CharacterNameVariable))]
    public sealed class CharacterNameVariableEditor : AtomVariableEditor<CharacterName, CharacterNamePair> { }
}
