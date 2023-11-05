using System.Collections;
using System.Collections.Generic;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Ingredient Feedback Command")]
public class IngredientFeedbackCommand : CommandLineParser
{
    [SerializeField] private BoolEvent addedIngredient;
    [SerializeField] private VoidBaseEventReference feedbackAnimationFinished;

    IngredientFeedbackCommand() : base("ingredientFeedback") { }

    private void OnEnable()
    {
        Assert.IsNotNull(addedIngredient);
        Assert.IsNotNull(feedbackAnimationFinished);
    }

    public override IEnumerator Invoke(IDictionary<string, Parameter> parameters,
            StoryChoice[] choices,
            CommandLineParserAction commandLineParserAction)
    {
        var success = GetParameter(parameters, "success") switch
        {
            "true" => true,
            "false" => false,
            _ => throw new System.Exception("success parameter must be either 'true' or 'false'")
        };

        // add the ingredient
        addedIngredient.Raise(success);

        // wait for the end of the animation feedback
        yield return feedbackAnimationFinished.Event.Await();
    }
}
