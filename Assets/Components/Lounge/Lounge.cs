using System.Collections;
using System.Collections.Generic;
using System.Linq;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Lounge : MonoBehaviour
{
    [SerializeField] private Transform charactersRoot;

    private List<GameObject> characterButtons;

    private void Awake()
    {
        Assert.IsNotNull(charactersRoot);

        characterButtons = charactersRoot
            .GetComponentsInChildren<Button>()
            .Select(c => c.gameObject)
            .ToList();
    }


    private void Start()
    {
        StartCoroutine(KeepButtonsSelected());
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
}
