using System;
using System.Collections;
using System.Linq;

using DG.Tweening;

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
    [SerializeField] private MenuInkStoriesAsset inkStoriesAsset;

    [SerializeField] private Button startButton;
    [SerializeField] private Toggle enToggle;
    [SerializeField] private Toggle itToggle;

    [SerializeField] private StringEventReference playBackgroundMusicEvent;
    [SerializeField] private StringReference musicName;
    [SerializeField] private BoolReference isGameMenuOpened;

    [SerializeField] private RectTransform startPlusRoot;
    [SerializeField] private float startPlusRootAnchorPosYDestination = -103;
    [SerializeField] private float startPlusRootBounceWaitDuration = 1f;
    [SerializeField] private float startPlusRootBounceDuration = 1f;
    [SerializeField] private RectTransform startPlusSymbol;
    [SerializeField] private float startPlusSymbolAnimationWaitDuration = 0.3f;
    [SerializeField] private float startPlusSymbolAnimationDuration = 1f;
    [SerializeField] private float startPlusSymbolFinalRotation = 360 * 8;
    [SerializeField] private StringReference plusModePlayerPrefsKey;

    [SerializeField] private BoolReference isDebug;
    [SerializeField] private GameObject[] debugObjects;

    private const string enLocaleCode = "en-US";
    private const string itLocaleCode = "it-IT";

    private void Awake()
    {
        Assert.IsNotNull(inkAtomsStory);
        Assert.IsNotNull(inkStoriesAsset);
        Assert.IsNotNull(continueEvent);
        Assert.IsNotNull(startButton);
        Assert.IsNotNull(itToggle);
        Assert.IsNotNull(enToggle);
    }

    private IEnumerator Start()
    {
        foreach (var debugObject in debugObjects)
        {
            debugObject.SetActive(isDebug.Value);
        }

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

        if (PlayerPrefs.GetString(plusModePlayerPrefsKey) == "true")
        {
            startPlusRoot.gameObject.SetActive(true);
            DOTween.Sequence()
                .Insert(startPlusRootBounceWaitDuration, startPlusRoot
                    .DOAnchorPos(new Vector2(startPlusRoot.anchoredPosition.x, startPlusRootAnchorPosYDestination), startPlusRootBounceDuration)
                    .SetEase(Ease.OutBounce))
                .AppendInterval(startPlusSymbolAnimationWaitDuration)
                .Append(startPlusSymbol.DOLocalRotate(new Vector3(0, 0, startPlusSymbolFinalRotation), startPlusSymbolAnimationDuration, RotateMode.FastBeyond360)
                    .SetEase(Ease.OutQuint))
                .Join(startPlusSymbol.DOScale(1, startPlusSymbolAnimationDuration));
        }
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
        // force selection of a button is the game menu is not on, and none of our elements are selected
        EventSystem currentEventSystem = EventSystem.current;
        var selected = currentEventSystem.currentSelectedGameObject;
        if (!isGameMenuOpened.Value && selected != startButton.gameObject && selected != itToggle.gameObject && selected != enToggle.gameObject)
        {
            Debug.Log($"Menu forces selected object from {selected?.name} back to {startButton.gameObject?.name}");
            currentEventSystem.SetSelectedGameObject(startButton.gameObject);
        }
    }

    public void OnStart(bool newModePlus)
    {
        string localeCode = LocalizationSettings.SelectedLocale.Identifier.Code;
        inkAtomsStory.StartStory(localeCode == itLocaleCode ?
            inkStoriesAsset.ItInkTextAsset :
            inkStoriesAsset.EnInkTextAsset);
        inkAtomsStory["in_unity"] = true;
        inkAtomsStory["new_mode_plus"] = newModePlus ? "true" : "false";
        continueEvent.Raise(null);
    }

    public void DebugSetModePlus(string value)
    {
        PlayerPrefs.SetString(plusModePlayerPrefsKey, value);
    }
}
