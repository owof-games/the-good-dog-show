using System;
using UnityEngine;
namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// IPair of type `&lt;GameArea&gt;`. Inherits from `IPair&lt;GameArea&gt;`.
    /// </summary>
    [Serializable]
    public struct GameAreaPair : IPair<GameArea>
    {
        public GameArea Item1 { get => _item1; set => _item1 = value; }
        public GameArea Item2 { get => _item2; set => _item2 = value; }

        [SerializeField]
        private GameArea _item1;
        [SerializeField]
        private GameArea _item2;

        public void Deconstruct(out GameArea item1, out GameArea item2) { item1 = Item1; item2 = Item2; }
    }
}