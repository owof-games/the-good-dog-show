using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Instancer of type `GameArea`. Inherits from `AtomEventInstancer&lt;GameArea, GameAreaEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-sign-blue")]
    [AddComponentMenu("Unity Atoms/Event Instancers/GameArea Event Instancer")]
    public class GameAreaEventInstancer : AtomEventInstancer<GameArea, GameAreaEvent> { }
}
