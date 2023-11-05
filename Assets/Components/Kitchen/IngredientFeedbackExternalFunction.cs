using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Ingredient Feedback External Function")]
public class IngredientFeedbackExternalFunction : ActionExternalFunction
{
    [SerializeField] private BoolEvent addedIngredient;

    IngredientFeedbackExternalFunction() : base("ingredientFeedback") { }

    public override void Call(ExternalFunctionContext context)
    {
        if(context.Arguments.Length != 1)
        {
            throw new System.Exception("ingredientFeedback requires exactly 1 parameter");
        }

        var success = (bool)context.Arguments[0];
        addedIngredient.Raise(success);
    }
}
