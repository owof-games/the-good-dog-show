using System.Linq;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;
using UnityAtoms.BaseAtoms;

public class KitchenGame : MonoBehaviour
{
    [SerializeField] private GameObject ingredientButtonPrefab;
    [SerializeField] private VerticalLayoutGroup verticalLayoutGroup1;
    [SerializeField] private VerticalLayoutGroup verticalLayoutGroup2;
    [SerializeField] private float recipeBookHeight = 400;
    [SerializeField] private FloatReference ingredientsSpeedMultiplier;
    [SerializeField] private FloatReference ingredientsSpeedAcceleration;
    [SerializeField] private IntReference ingredientsMaxRounds;
    [SerializeField] private int minNumEntries;
    [SerializeField] private StringEvent ingredientChosenEvent;

    private void Awake()
    {
        Assert.IsNotNull(ingredientButtonPrefab);
        Assert.IsNotNull(verticalLayoutGroup1);
        Assert.IsNotNull(verticalLayoutGroup2);
        Assert.IsTrue(ingredientsSpeedMultiplier.Value > 0);
        Assert.IsTrue(minNumEntries > 0);
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

    private void OnEnable()
    {
        runningAnimation = false;
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
        // make a (randomized) list of ingredients
        var baseIngredients = ingredientKeys
            .Split(',')
            .OrderBy(_ => Random.Range(0f, 1f))
            .ToList();
        // repeat the list multiple times, if just one time isn't enough to cover a whole page
        var numRepeats = (int)Mathf.Ceil((float)minNumEntries / baseIngredients.Count);
        var ingredients = Enumerable.Repeat(baseIngredients, numRepeats).SelectMany(x => x);
        // create the buttons in each vertical layout
        foreach (var (ingredientKey, button) in
            from root in verticalLayoutRectTransforms
            from ingredientKey in ingredients
            let button = Instantiate(ingredientButtonPrefab, root)
            select (ingredientKey, button))
        {
            button.GetComponent<IngredientButton>().SetupIngredient(ingredientKey);
        }
    }

    private float verticalLayoutGroup1YPosition;
    private float verticalLayoutGroup2YPosition;
    private bool runningAnimation = false;
    private float speed;
    private int numRounds;

    private void RunIngredientButtonsAnimations()
    {
        // force layouts to recompute
        Canvas.ForceUpdateCanvases();

        var spacing = verticalLayoutGroup1.spacing;
        var preferredHeight = verticalLayoutGroup1.preferredHeight;

        verticalLayoutGroup1YPosition = 0;
        verticalLayoutGroup2YPosition = -(preferredHeight + spacing);

        speed = 100 * ingredientsSpeedMultiplier.Value;
        runningAnimation = true;
        numRounds = 0;
    }

    private void Update()
    {
        if (!runningAnimation)
        {
            return;
        }
        var spacing = verticalLayoutGroup1.spacing;
        var preferredHeight = verticalLayoutGroup1.preferredHeight;
        void UpdateLayoutGroup(RectTransform layoutGroupRectTransform, float y, float otherY, System.Action<float> setY)
        {
            var newY = y + Time.deltaTime * speed;
            if (newY >= recipeBookHeight + preferredHeight)
            {
                newY = otherY - (preferredHeight + spacing);
                numRounds++;
                Debug.Log("num rounds: " + numRounds.ToString());
                if (numRounds >= ingredientsMaxRounds)
                {
                    ingredientChosenEvent.Raise("InvalidIngredient");
                }
            }
            setY(newY);
            layoutGroupRectTransform.anchoredPosition = new Vector2(0, newY);
        }
        speed += ingredientsSpeedAcceleration * Time.deltaTime;
        UpdateLayoutGroup(
            verticalLayoutRectTransform1,
            verticalLayoutGroup1YPosition,
            verticalLayoutGroup2YPosition,
            (float newY) => verticalLayoutGroup1YPosition = newY);
        UpdateLayoutGroup(
            verticalLayoutRectTransform2,
            verticalLayoutGroup2YPosition,
            verticalLayoutGroup1YPosition,
            (float newY) => verticalLayoutGroup2YPosition = newY);
    }
}
