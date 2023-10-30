using System;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Reference of type `GameArea`. Inherits from `AtomEventReference&lt;GameArea, GameAreaVariable, GameAreaEvent, GameAreaVariableInstancer, GameAreaEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class GameAreaEventReference : AtomEventReference<
        GameArea,
        GameAreaVariable,
        GameAreaEvent,
        GameAreaVariableInstancer,
        GameAreaEventInstancer>, IGetEvent 
    { }
}
