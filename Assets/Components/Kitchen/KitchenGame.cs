using Ink.Runtime;
using UnityAtoms.BaseAtoms;
using System.Linq;

using UnityEngine;
using UnityEngine.Assertions;
using LemuRivolta.InkAtoms;

public class KitchenGame : MonoBehaviour
{
    [SerializeField] private InkAtomsStoryReference inkAtomsStory;

    private void Awake()
    {
        Assert.IsNotNull(inkAtomsStory);
    }

    public void PlayKitchenGame(string ingredients)
    {
        var ingredientInfoName = inkAtomsStory.Value.GetInkListFromListDefinitions("IngredientInfo");
        ingredientInfoName.AddItem("Name");

        var ingredientsList = ingredients.Split(',');

        var ingredientNames = ingredientsList.Select(ingredient =>
        {
            InkList inkIngredient = inkAtomsStory.Value.GetInkListFromListDefinitions("Ingredients");
            inkIngredient.AddItem(ingredient);
            var ingredientName = inkAtomsStory.Value.Call("getIngredientData", out var _,
                inkIngredient, ingredientInfoName);
            return (string)ingredientName;
        }).ToList();
    }
}
