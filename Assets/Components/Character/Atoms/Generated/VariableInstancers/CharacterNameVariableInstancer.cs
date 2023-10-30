using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Variable Instancer of type `CharacterName`. Inherits from `AtomVariableInstancer&lt;CharacterNameVariable, CharacterNamePair, CharacterName, CharacterNameEvent, CharacterNamePairEvent, CharacterNameCharacterNameFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/CharacterName Variable Instancer")]
    public class CharacterNameVariableInstancer : AtomVariableInstancer<
        CharacterNameVariable,
        CharacterNamePair,
        CharacterName,
        CharacterNameEvent,
        CharacterNamePairEvent,
        CharacterNameCharacterNameFunction>
    { }
}
