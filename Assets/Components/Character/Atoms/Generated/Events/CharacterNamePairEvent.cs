using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `CharacterNamePair`. Inherits from `AtomEvent&lt;CharacterNamePair&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/CharacterNamePair", fileName = "CharacterNamePairEvent")]
    public sealed class CharacterNamePairEvent : AtomEvent<CharacterNamePair>
    {
    }
}
