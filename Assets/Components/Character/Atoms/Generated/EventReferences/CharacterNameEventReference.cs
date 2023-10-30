using System;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Reference of type `CharacterName`. Inherits from `AtomEventReference&lt;CharacterName, CharacterNameVariable, CharacterNameEvent, CharacterNameVariableInstancer, CharacterNameEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class CharacterNameEventReference : AtomEventReference<
        CharacterName,
        CharacterNameVariable,
        CharacterNameEvent,
        CharacterNameVariableInstancer,
        CharacterNameEventInstancer>, IGetEvent 
    { }
}
