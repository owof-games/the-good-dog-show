using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Value List of type `CharacterName`. Inherits from `AtomValueList&lt;CharacterName, CharacterNameEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-piglet")]
    [CreateAssetMenu(menuName = "Unity Atoms/Value Lists/CharacterName", fileName = "CharacterNameValueList")]
    public sealed class CharacterNameValueList : AtomValueList<CharacterName, CharacterNameEvent> { }
}
