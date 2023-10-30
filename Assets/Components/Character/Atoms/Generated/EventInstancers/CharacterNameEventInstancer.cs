using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Instancer of type `CharacterName`. Inherits from `AtomEventInstancer&lt;CharacterName, CharacterNameEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-sign-blue")]
    [AddComponentMenu("Unity Atoms/Event Instancers/CharacterName Event Instancer")]
    public class CharacterNameEventInstancer : AtomEventInstancer<CharacterName, CharacterNameEvent> { }
}
