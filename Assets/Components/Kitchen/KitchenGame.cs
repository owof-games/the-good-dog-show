using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;
using DG.Tweening;
using System.Linq;
using UnityAtoms.BaseAtoms;

public class KitchenGame : MonoBehaviour
{
    [SerializeField] private GameObject ingredientButtonPrefab;
    [SerializeField] private VerticalLayoutGroup verticalLayoutGroup1;
    [SerializeField] private VerticalLayoutGroup verticalLayoutGroup2;
    [SerializeField] private float recipeBookHeight = 400;
    [SerializeField] private FloatReference ingredientsSpeedMultiplier;

    private void Awake()
    {
        Assert.IsNotNull(ingredientButtonPrefab);
        Assert.IsNotNull(verticalLayoutGroup1);
        Assert.IsNotNull(verticalLayoutGroup2);
        Assert.IsTrue(ingredientsSpeedMultiplier.Value > 0);
    }

    private RectTransform verticalLayoutRectTransform1;
    private RectTransform verticalLayoutRectTransform2;
    private RectTransform[] verticalLayoutRectTransforms;

    private void Start()
    {
        verticalLayoutRectTransform1 = verticalLayoutGroup1.GetComponent<RectTransform>();
        verticalLayoutRectTransform2 = verticalLayoutGroup2.GetComponent<RectTransform>();
        verticalLayoutRectTransforms = new[]
        {
            verticalLayoutRectTransform1,
            verticalLayoutRectTransform2
        };
    }

    private void OnDisable()
    {
        ImmediatelyDestroyIngredientButtons();
    }

    public void PlayKitchenGame(string ingredientKeys)
    {
        ImmediatelyDestroyIngredientButtons(); // should never be necessary: OnDisable already cleans up the buttons

        CreateButtons(ingredientKeys);

        RunIngredientButtonsAnimations();
    }

    private void ImmediatelyDestroyIngredientButtons()
    {
        foreach (var root in verticalLayoutRectTransforms)
        {
            GameObject[] allChildren = new GameObject[root.childCount];
            var i = 0;
            foreach (Transform child in root)
            {
                allChildren[i++] = child.gameObject;
            }
            foreach (var child in allChildren)
            {
                DestroyImmediate(child);
            }
        }
    }

    /// <summary>
    /// Create the buttons in both vertical layout groups.
    /// </summary>
    /// <param name="ingredientKeys">Comma-separated list of ingredients</param>
    private void CreateButtons(string ingredientKeys)
    {
        var ingredients = ingredientKeys
            .Split(',')
            .OrderBy(_ => Random.Range(0f, 1f));
        foreach (var (ingredientKey, button) in
            from root in verticalLayoutRectTransforms
            from ingredientKey in ingredients
            let button = Instantiate(ingredientButtonPrefab, root)
            select (ingredientKey, button))
        {
            button.GetComponent<IngredientButton>().SetupIngredient(ingredientKey);
        }
    }

    private Tweener ingredientsAnimation1;
    private Tweener ingredientsAnimation2;

    private void RunIngredientButtonsAnimations()
    {
        // kill currently running animations, if needed
        ingredientsAnimation1?.Kill();
        ingredientsAnimation2?.Kill();

        // force layouts to recompute
        Canvas.ForceUpdateCanvases();

        // extract measures from layout groups
        Assert.AreEqual(verticalLayoutGroup1.spacing, verticalLayoutGroup2.spacing);
        Assert.AreEqual(verticalLayoutGroup1.preferredHeight, verticalLayoutGroup2.preferredHeight);
        var spacing = verticalLayoutGroup1.spacing;
        float preferredHeight = verticalLayoutGroup1.preferredHeight;

        void CreateIngredientsAnimation(RectTransform myTransform, RectTransform otherTransform, System.Func<Tweener> getTweener, System.Action<Tweener> setTweener, Vector2? startPosition = null)
        {
            // kill the current tweener, if necessary
            getTweener()?.Kill();
            // start at given position, or just under the other layout
            myTransform.anchoredPosition = startPosition ??
                otherTransform.anchoredPosition - new Vector2(0, preferredHeight + spacing);
            // start the animation up until it disappears
            var tweener = myTransform
                .DOAnchorPos(new Vector2(0, recipeBookHeight + preferredHeight), 100 * ingredientsSpeedMultiplier.Value)
                .SetEase(Ease.Linear)
                .SetSpeedBased()
                .OnComplete(() =>
                {
                    // restart animation just under the other layout, with automatic computation of start position
                    CreateIngredientsAnimation(myTransform, otherTransform, getTweener, setTweener);
                });
            // save the new tweener
            setTweener(tweener);
        }
        CreateIngredientsAnimation(
            verticalLayoutRectTransform1,
            verticalLayoutRectTransform2,
            () => ingredientsAnimation1,
            t => ingredientsAnimation1 = t,
            Vector2.zero);
        CreateIngredientsAnimation(
            verticalLayoutRectTransform2,
            verticalLayoutRectTransform1,
            () => ingredientsAnimation2,
            t => ingredientsAnimation2 = t);
    }
}
