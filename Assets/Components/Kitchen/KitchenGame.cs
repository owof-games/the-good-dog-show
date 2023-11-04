using Ink.Runtime;
using UnityAtoms.BaseAtoms;
using System.Linq;

using UnityEngine;
using UnityEngine.Assertions;
using System;
using System.Collections;
using UnityEngine.UI;
using DG.Tweening;

public class KitchenGame : MonoBehaviour
{
    [SerializeField] private GameObject ingredientButtonPrefab;
    [SerializeField] private VerticalLayoutGroup verticalLayoutGroup;

    private void Awake()
    {
        Assert.IsNotNull(ingredientButtonPrefab);
        Assert.IsNotNull(verticalLayoutGroup);
    }

    [SerializeField] private float outOfRecipeBookHeight = 400;

    private Tweener ingredientsAnimation;

    public void PlayKitchenGame(string ingredientKeys)
    {
        ingredientsAnimation?.Kill();

        ImmediatelyDestroyIngredientButtons();

        foreach (var ingredientKey in ingredientKeys.Split(','))
        {
            var button = Instantiate(ingredientButtonPrefab, verticalLayoutGroup.transform);
            button.GetComponent<IngredientButton>().SetupIngredient(ingredientKey);
        }

        // force layout to recompute
        Canvas.ForceUpdateCanvases();

        // run the ingredients button animation
        ingredientsAnimation = verticalLayoutGroup.GetComponent<RectTransform>().DOAnchorPos(
            new(0, outOfRecipeBookHeight + verticalLayoutGroup.preferredHeight),
            100)
            .SetEase(Ease.Linear)
            .SetSpeedBased()
            .SetLoops(-1);
    }

    private void ImmediatelyDestroyIngredientButtons()
    {
        GameObject[] allChildren = new GameObject[verticalLayoutGroup.transform.childCount];
        var i = 0;
        foreach (Transform child in verticalLayoutGroup.transform)
        {
            allChildren[i] = child.gameObject;
            i += 1;
        }
        foreach (GameObject child in allChildren)
        {
            DestroyImmediate(child);
        }
    }
}
