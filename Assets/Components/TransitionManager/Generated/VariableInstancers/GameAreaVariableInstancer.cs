using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Variable Instancer of type `GameArea`. Inherits from `AtomVariableInstancer&lt;GameAreaVariable, GameAreaPair, GameArea, GameAreaEvent, GameAreaPairEvent, GameAreaGameAreaFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/GameArea Variable Instancer")]
    public class GameAreaVariableInstancer : AtomVariableInstancer<
        GameAreaVariable,
        GameAreaPair,
        GameArea,
        GameAreaEvent,
        GameAreaPairEvent,
        GameAreaGameAreaFunction>
    { }
}
