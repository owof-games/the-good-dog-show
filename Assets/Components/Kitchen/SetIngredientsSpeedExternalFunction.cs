using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Ingredients Speed External Function")]
public class SetIngredientsSpeedExternalFunction : ActionExternalFunction
{
    [SerializeField] private FloatReference ingredientsSpeedMultiplier;

    public SetIngredientsSpeedExternalFunction() : base("setIngredientsSpeed") { }

    public override void Call(ExternalFunctionContext context)
    {
        var speed = GetArgument<float>(context, 0);

        Assert.IsTrue(speed > 0);

        ingredientsSpeedMultiplier.Value = speed;
    }
}
