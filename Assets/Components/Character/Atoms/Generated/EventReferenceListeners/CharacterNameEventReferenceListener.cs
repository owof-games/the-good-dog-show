using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Reference Listener of type `CharacterName`. Inherits from `AtomEventReferenceListener&lt;CharacterName, CharacterNameEvent, CharacterNameEventReference, CharacterNameUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/CharacterName Event Reference Listener")]
    public sealed class CharacterNameEventReferenceListener : AtomEventReferenceListener<
        CharacterName,
        CharacterNameEvent,
        CharacterNameEventReference,
        CharacterNameUnityEvent>
    { }
}
