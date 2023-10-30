using UnityEngine;
using System;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Variable of type `CharacterName`. Inherits from `AtomVariable&lt;CharacterName, CharacterNamePair, CharacterNameEvent, CharacterNamePairEvent, CharacterNameCharacterNameFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/CharacterName", fileName = "CharacterNameVariable")]
    public sealed class CharacterNameVariable : AtomVariable<CharacterName, CharacterNamePair, CharacterNameEvent, CharacterNamePairEvent, CharacterNameCharacterNameFunction>
    {
        protected override bool ValueEquals(CharacterName other)
        {
            return Value == other;
        }
    }
}
