using System.Collections;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;
using UnityEngine.Localization.Settings;
using UnityEngine.UI;

public class Menu : MonoBehaviour
{
    [SerializeField] private StringEvent continueEvent;
    [SerializeField] private InkAtomsStory inkAtomsStory;
    [SerializeField] private TextAsset inkTextAsset;

    [SerializeField] private Button startButton;
    [SerializeField] private Toggle enToggle;
    [SerializeField] private Toggle itToggle;

    private void Awake()
    {
        Assert.IsNotNull(inkAtomsStory);
        Assert.IsNotNull(inkTextAsset);
        Assert.IsNotNull(continueEvent);
        Assert.IsNotNull(startButton);
        Assert.IsNotNull(itToggle);
        Assert.IsNotNull(enToggle);
    }

    private IEnumerator Start()
    {
        yield return LocalizationSettings.InitializationOperation;

        enToggle.gameObject.SetActive(true);
        itToggle.gameObject.SetActive(true);
        string localeCode = LocalizationSettings.SelectedLocale.Identifier.Code;
        enToggle.isOn = localeCode == "en-US";
        itToggle.isOn = localeCode == "it-IT";
    }

    private void Update()
    {
        EventSystem currentEventSystem = EventSystem.current;
        if (currentEventSystem.currentSelectedGameObject == null)
        {
            Debug.Log("Selecting start button");
            currentEventSystem.SetSelectedGameObject(startButton.gameObject);
        }
    }

    public void OnStart()
    {
        inkAtomsStory.Setup(inkTextAsset);
        continueEvent.Raise(null);
    }
}
