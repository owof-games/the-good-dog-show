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
    [SerializeField] private SerializableInkListItemValueList aliveCharacters;

    private List<GameObject> characterButtons;
    private List<LoungeCharacter> loungeCharacters;

    private void Awake()
    {
        Assert.IsNotNull(charactersRoot);
        Assert.IsNotNull(storyStep);
        Assert.IsNotNull(choiceEvent);
        Assert.IsNotNull(aliveCharacters);

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
            bool isAlive = aliveCharacters.Any(li => li.itemName == character.CharacterName.ToString());
            character.gameObject.SetActive(hasChoice && isAlive);
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
            bool doneSomething = false;
            // select a character-button if none of them is selected
            if (!characterButtons.Contains(current.currentSelectedGameObject))
            {
                Debug.Log($"updating lounge: selecting {lastSelectedButton.gameObject.name}");
                current.SetSelectedGameObject(lastSelectedButton);
                doneSomething = true;
            }

            // update the last selected character
            if (characterButtons.Contains(current.currentSelectedGameObject) &&
                lastSelectedButton != current.currentSelectedGameObject)
            {
                lastSelectedButton = current.currentSelectedGameObject;
                Debug.Log($"updating lounge: updating to {lastSelectedButton.gameObject.name}");
                doneSomething = true;
            }

            if(!doneSomething)
            {
                Debug.Log($"updating lounge: done nothing");
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
