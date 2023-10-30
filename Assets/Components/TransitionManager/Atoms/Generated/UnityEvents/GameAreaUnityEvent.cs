using System;
using UnityEngine.Events;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// None generic Unity Event of type `GameArea`. Inherits from `UnityEvent&lt;GameArea&gt;`.
    /// </summary>
    [Serializable]
    public sealed class GameAreaUnityEvent : UnityEvent<GameArea> { }
}
