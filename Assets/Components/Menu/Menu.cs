using System;
using System.Collections;
using System.Linq;

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
    [SerializeField] private TextAsset itInkTextAsset;
    [SerializeField] private TextAsset enInkTextAsset;

    [SerializeField] private Button startButton;
    [SerializeField] private Toggle enToggle;
    [SerializeField] private Toggle itToggle;

    [SerializeField] private StringEventReference playBackgroundMusicEvent;
    [SerializeField] private StringReference musicName;

    private const string enLocaleCode = "en-US";
    private const string itLocaleCode = "it-IT";

    private void Awake()
    {
        Assert.IsNotNull(inkAtomsStory);
        Assert.IsNotNull(itInkTextAsset);
        Assert.IsNotNull(enInkTextAsset);
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
        enToggle.isOn = localeCode == enLocaleCode;
        itToggle.isOn = localeCode == itLocaleCode;
    }

    private void OnEnable()
    {
        playBackgroundMusicEvent.Event.Raise(musicName);
    }

    public void SetENLocale(bool selected)
    {
        if (selected)
        {
            SetLocale(enLocaleCode);
        }
    }

    public void SetITLocale(bool selected)
    {
        if (selected)
        {
            SetLocale(itLocaleCode);
        }
    }

    private void SetLocale(string localeCode)
    {
        var locale = LocalizationSettings.AvailableLocales.Locales.First(
                locale => locale.Identifier.Code == localeCode);
        LocalizationSettings.SelectedLocale = locale;
    }

    private void Update()
    {
        EventSystem currentEventSystem = EventSystem.current;
        var selected = currentEventSystem.currentSelectedGameObject;
        if (selected != startButton.gameObject && selected != itToggle.gameObject && selected != enToggle.gameObject)
        {
            currentEventSystem.SetSelectedGameObject(startButton.gameObject);
        }
    }

    public void OnStart()
    {
        string localeCode = LocalizationSettings.SelectedLocale.Identifier.Code;
        inkAtomsStory.StartStory(localeCode == itLocaleCode ?
            itInkTextAsset :
            enInkTextAsset);
        inkAtomsStory["in_unity"] = true;
        continueEvent.Raise(null);
    }
}
