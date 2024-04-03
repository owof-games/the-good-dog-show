using System.Collections;
using System.Collections.Generic;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

/// <summary>
/// Shortly disable the buttons the moment they are displayed.
/// </summary>
public class Choices : MonoBehaviour
{
    [SerializeField] private float disableTime = 0.1f;
    private Button[] buttons;

    private void Start()
    {
        buttons = GetComponentsInChildren<Button>();
        Assert.IsTrue(buttons.Length > 0);
    }

    private void OnEnable()
    {
        foreach (var button in buttons)
        {
            StartCoroutine(ShortDisable(button));
        }
    }

    private IEnumerator ShortDisable(Button button)
    {
        var interactable = button.interactable;
        button.interactable = false;
        yield return new WaitForSeconds(disableTime);
        button.interactable = interactable;
    }
}
