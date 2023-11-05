using System.Collections;
using System.Collections.Generic;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Ingredients Speed External Function")]
public class SetIngredientsSpeedExternalFunction : ActionExternalFunction
{
    [SerializeField] private FloatReference ingredientsSpeedMultiplier;

    public SetIngredientsSpeedExternalFunction() : base("setIngredientsSpeed") { }

    private void OnEnable()
    {
        Assert.IsNotNull(ingredientsSpeedMultiplier);
        Assert.IsTrue(ingredientsSpeedMultiplier.Value > 0);
    }

    public override void Call(ExternalFunctionContext context)
    {
        var speed = GetArgument<float>(context, 0);

        ingredientsSpeedMultiplier.Value = speed;
    }
}
