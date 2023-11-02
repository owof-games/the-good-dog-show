using System.Collections;
using System.Collections.Generic;
using System.Linq;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Lounge : MonoBehaviour
{
    [SerializeField] private Transform charactersRoot;
    [SerializeField] private StoryStepVariable storyStep;
    [SerializeField] private ChosenChoiceEvent choiceEvent;

    private List<GameObject> characterButtons;
    private List<LoungeCharacter> loungeCharacters;

    private void Awake()
    {
        Assert.IsNotNull(charactersRoot);
        Assert.IsNotNull(storyStep);
        Assert.IsNotNull(choiceEvent);

        // extract all the buttons
        characterButtons = charactersRoot
            .GetComponentsInChildren<Button>(true)
            .Select(c => c.gameObject)
            .ToList();

        // and get the lounge characters
        loungeCharacters = new();
        foreach (var character in characterButtons)
        {
            if (character.TryGetComponent<LoungeCharacter>(out var loungeCharacter))
            {
                loungeCharacters.Add(loungeCharacter);
            }
        }
    }

    private void OnEnable()
    {
        storyStep.Changed.Register(OnStoryStepChanged);
    }

    private void Start()
    {
        StartCoroutine(KeepButtonsSelected());
    }

    private void OnDisable()
    {
        storyStep.Changed.Unregister(OnStoryStepChanged);
    }

    private void OnStoryStepChanged(StoryStep step)
    {
        UpdateActiveCharacters();
    }

    private void UpdateActiveCharacters()
    {
        foreach(var character in loungeCharacters) {
            bool hasChoice = storyStep.Value.Choices.Any(choice => choice.Text.Trim() == character.ChoiceString);
            character.gameObject.SetActive(hasChoice);
        }
    }

    /// <summary>
    /// Coroutine to make sure one of the character-buttons is always selected
    /// </summary>
    /// <returns></returns>
    private IEnumerator KeepButtonsSelected()
    {
        GameObject lastSelectedButton = characterButtons[Random.Range(0, characterButtons.Count)];
        var current = EventSystem.current;

        for (; ; )
        {
            // select a character-button if none of them is selected
            if (!characterButtons.Contains(current.currentSelectedGameObject))
            {
                current.SetSelectedGameObject(lastSelectedButton);
            }

            // update the last selected character
            if (characterButtons.Contains(current.currentSelectedGameObject) &&
                lastSelectedButton != current.currentSelectedGameObject)
            {
                lastSelectedButton = current.currentSelectedGameObject;
            }

            // wait for the next frame
            yield return null;
        }
    }

    public void OnChooseCharacter(string choiceName)
    {
        var choiceIndex = storyStep.Value
            .Choices
            .First(choice => choice.Text.Trim() == choiceName)
            .Index;
        choiceEvent.Raise(new()
        {
            ChoiceIndex = choiceIndex,
            FlowName = null
        });
    }
}
