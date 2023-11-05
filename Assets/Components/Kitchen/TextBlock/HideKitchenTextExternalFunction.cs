using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Hide Kitchen Text External Function")]
public class HideKitchenTextExternalFunction : ActionExternalFunction
{
    [SerializeField] private VoidEvent hideKitchenTextBox;

    HideKitchenTextExternalFunction() : base("hideKitchenText") { }

    private void OnEnable()
    {
        Assert.IsNotNull(hideKitchenTextBox);
    }

    public override void Call(ExternalFunctionContext context)
    {
        hideKitchenTextBox.Raise();
    }
}
