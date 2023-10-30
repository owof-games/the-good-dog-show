using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `GameArea`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(GameAreaVariable))]
    public sealed class GameAreaVariableEditor : AtomVariableEditor<GameArea, GameAreaPair> { }
}
