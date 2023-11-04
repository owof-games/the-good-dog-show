using Ink.Runtime;

using TMPro;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class IngredientButton : MonoBehaviour
{
    [SerializeField] private InkAtomsStoryReference inkAtomsStory;
    [SerializeField] private TextMeshProUGUI textMeshPro;
    [SerializeField] private StringEvent ingredientChosenEvent;

    private string ingredientKey;

    private void Awake()
    {
        Assert.IsNotNull(inkAtomsStory);
        Assert.IsNotNull(textMeshPro);
        Assert.IsNotNull(ingredientChosenEvent);
    }

    public void SetupIngredient(string ingredientKey)
    {
        // save the ingredient key
        this.ingredientKey = ingredientKey;

        // read the ingredient name from ink
        var ingredientInfoName = inkAtomsStory.Value.GetInkListFromListDefinitions("IngredientInfo");
        ingredientInfoName.AddItem("Name");

        InkList inkIngredient = inkAtomsStory.Value.GetInkListFromListDefinitions("Ingredients");
        inkIngredient.AddItem(ingredientKey);

        var ingredientName = (string)inkAtomsStory.Value.Call("getIngredientData", out var _,
            inkIngredient, ingredientInfoName);
        textMeshPro.text = ingredientName;
    }

    public void OnClick() => ingredientChosenEvent.Raise(ingredientKey);
}
