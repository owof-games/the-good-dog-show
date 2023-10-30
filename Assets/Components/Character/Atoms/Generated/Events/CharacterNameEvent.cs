using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `CharacterName`. Inherits from `AtomEvent&lt;CharacterName&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/CharacterName", fileName = "CharacterNameEvent")]
    public sealed class CharacterNameEvent : AtomEvent<CharacterName>
    {
    }
}
