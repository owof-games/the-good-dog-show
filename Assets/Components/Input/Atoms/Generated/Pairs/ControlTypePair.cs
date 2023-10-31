using System;
using UnityEngine;
namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// IPair of type `&lt;ControlType&gt;`. Inherits from `IPair&lt;ControlType&gt;`.
    /// </summary>
    [Serializable]
    public struct ControlTypePair : IPair<ControlType>
    {
        public ControlType Item1 { get => _item1; set => _item1 = value; }
        public ControlType Item2 { get => _item2; set => _item2 = value; }

        [SerializeField]
        private ControlType _item1;
        [SerializeField]
        private ControlType _item2;

        public void Deconstruct(out ControlType item1, out ControlType item2) { item1 = Item1; item2 = Item2; }
    }
}