#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `GameArea`. Inherits from `AtomDrawer&lt;GameAreaVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(GameAreaVariable))]
    public class GameAreaVariableDrawer : VariableDrawer<GameAreaVariable> { }
}
#endif
