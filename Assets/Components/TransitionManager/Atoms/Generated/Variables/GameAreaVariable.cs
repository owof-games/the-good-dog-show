using UnityEngine;
using System;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Variable of type `GameArea`. Inherits from `AtomVariable&lt;GameArea, GameAreaPair, GameAreaEvent, GameAreaPairEvent, GameAreaGameAreaFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/GameArea", fileName = "GameAreaVariable")]
    public sealed class GameAreaVariable : AtomVariable<GameArea, GameAreaPair, GameAreaEvent, GameAreaPairEvent, GameAreaGameAreaFunction>
    {
        protected override bool ValueEquals(GameArea other)
        {
            return Value == other;
        }
    }
}
