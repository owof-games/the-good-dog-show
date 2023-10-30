using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Reference Listener of type `GameArea`. Inherits from `AtomEventReferenceListener&lt;GameArea, GameAreaEvent, GameAreaEventReference, GameAreaUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/GameArea Event Reference Listener")]
    public sealed class GameAreaEventReferenceListener : AtomEventReferenceListener<
        GameArea,
        GameAreaEvent,
        GameAreaEventReference,
        GameAreaUnityEvent>
    { }
}
