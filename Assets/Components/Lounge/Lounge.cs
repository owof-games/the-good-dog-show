using System.Collections;
using System.Collections.Generic;
using System.Linq;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Lounge : MonoBehaviour
{
    [SerializeField] private Transform charactersRoot;
    [SerializeField] private ChosenChoiceEvent choiceEvent;
    [SerializeField] private StringEvent continueEvent;
    [SerializeField] private CharacterNameValueList charactersInLounge;
    [SerializeField] private BoolReference isGameMenuOpened;

    private List<GameObject> characterButtons;
    private List<LoungeCharacter> loungeCharacters;

    private void Awake()
    {
        Assert.IsNotNull(charactersRoot);
        Assert.IsNotNull(choiceEvent);
        Assert.IsNotNull(charactersInLounge);
        Assert.IsNotNull(continueEvent);

        // extract all the buttons
        characterButtons = (
            from c in charactersRoot.GetComponentsInChildren<Button>(true)
            where c.interactable
            select c.gameObject)
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
        StartCoroutine(KeepButtonsSelected());
    }

    public void UpdateActiveCharacters()
    {
        foreach (var character in loungeCharacters)
        {
            character.gameObject.SetActive(charactersInLounge.Contains(character.CharacterName));
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
            // do nothing if the game menu is opened
            if(isGameMenuOpened.Value)
            {
                yield return null;
                continue;
            }

            var activeCharacterButtons = characterButtons.Where(cb => cb.activeSelf);

            // update last selected character button if it's no longer active
            if (!activeCharacterButtons.Contains(lastSelectedButton))
            {
                lastSelectedButton = activeCharacterButtons.FirstOrDefault();
            }

            // select a character-button if none of them is selected
            if (!activeCharacterButtons.Contains(current.currentSelectedGameObject))
            {
                current.SetSelectedGameObject(lastSelectedButton);
            }

            // update the last selected character
            if (activeCharacterButtons.Contains(current.currentSelectedGameObject) &&
                lastSelectedButton != current.currentSelectedGameObject)
            {
                lastSelectedButton = current.currentSelectedGameObject;
            }

            // wait for the next frame
            yield return null;
        }
    }
}
