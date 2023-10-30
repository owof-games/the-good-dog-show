using System;
using UnityEngine.Events;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// None generic Unity Event of type `CharacterName`. Inherits from `UnityEvent&lt;CharacterName&gt;`.
    /// </summary>
    [Serializable]
    public sealed class CharacterNameUnityEvent : UnityEvent<CharacterName> { }
}
