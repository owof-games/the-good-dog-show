using System.Collections;
using System.Collections.Generic;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Play Kitchen Game Command")]
public class PlayKitchenGameCommand : CommandLineParser
{
    [SerializeField] private StringEvent playKitchenGameEvent;
    [SerializeField] private StringEvent ingredientChosenEvent;
    [SerializeField] private InkAtomsStoryReference inkAtomsStory;

    public PlayKitchenGameCommand() : base("playKitchenGame")
    {
    }

    private void OnEnable()
    {
        Assert.IsNotNull(playKitchenGameEvent);
        Assert.IsNotNull(ingredientChosenEvent);
    }

    public override IEnumerator Invoke(IDictionary<string, Parameter> parameters, StoryChoice[] choices, CommandLineParserAction commandLineParserAction)
    {
        Assert.IsNotNull(inkAtomsStory.Value);

        // get the list of ingredients and signal to start the game
        var ingredients = GetParameter(parameters, "ingredients");
        playKitchenGameEvent.Raise(ingredients);

        // wait for an ingredient to be chosen in the minigame
        string chosenIngredient = null;
        yield return ingredientChosenEvent.Await(onEvent: i => chosenIngredient = i);
        Assert.IsNotNull(chosenIngredient);
        Assert.AreNotEqual(chosenIngredient, "InvalidIngredient");

        // save the chosen ingredient in ink
        var c = inkAtomsStory.Value.GetInkListFromListDefinitions("Ingredients");
        c.AddItem(chosenIngredient);
        inkAtomsStory.Value["chosen_ingredient"] = c;
    }
}
