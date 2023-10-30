using System;
using UnityEngine;
namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// IPair of type `&lt;CharacterName&gt;`. Inherits from `IPair&lt;CharacterName&gt;`.
    /// </summary>
    [Serializable]
    public struct CharacterNamePair : IPair<CharacterName>
    {
        public CharacterName Item1 { get => _item1; set => _item1 = value; }
        public CharacterName Item2 { get => _item2; set => _item2 = value; }

        [SerializeField]
        private CharacterName _item1;
        [SerializeField]
        private CharacterName _item2;

        public void Deconstruct(out CharacterName item1, out CharacterName item2) { item1 = Item1; item2 = Item2; }
    }
}