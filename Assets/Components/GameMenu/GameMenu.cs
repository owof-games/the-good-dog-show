using System.Collections.Generic;
using System.Linq;

using DG.Tweening;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class GameMenu : MonoBehaviour
{
    [SerializeField] private RectTransform rectTransform;
    [SerializeField] private CanvasGroup canvasGroup;
    [SerializeField] private GameObject firstSelectedUIElement;
    [SerializeField] private FloatReference menuSlideDuration;
    [SerializeField] private BoolReference isGameMenuOpened;
    [SerializeField] private GameAreaEventReference moveToGameArea;

    private static Vector2 hiddenAnchorMin = new(-1, 0);
    private static Vector2 hiddenAnchorMax = new(0, 1);
    private static Vector2 shownAnchorMin = new(0, 0);
    private static Vector2 shownAnchorMax = new(1, 1);

    private List<GameObject> selectables;

    // Start is called before the first frame update
    void Start()
    {
        Assert.IsNotNull(rectTransform);
        Assert.IsNotNull(canvasGroup);
        Assert.IsNotNull(firstSelectedUIElement);

        rectTransform.anchorMin = hiddenAnchorMin;
        rectTransform.anchorMax = hiddenAnchorMax;
        isGameMenuOpened.Value = false;

        UpdateCanvasGroup();

        selectables = GetComponentsInChildren<Selectable>().Select(s => s.gameObject).ToList();
    }

    public void OnToggle()
    {
        // stop all previous animations
        rectTransform.DOKill();
        // slide in or out
        if (!isGameMenuOpened.Value)
        {
            SlideTo(shownAnchorMin, shownAnchorMax);
            isGameMenuOpened.Value = true;
            Time.timeScale = 0;
        }
        else
        {
            SlideTo(hiddenAnchorMin, hiddenAnchorMax);
            isGameMenuOpened.Value = false;
            Time.timeScale = 1;
        }
    }

    private void SlideTo(Vector2 newAnchorMin, Vector2 newAnchorMax) => DOTween
        .Sequence()
        .Insert(0, rectTransform.DOAnchorMin(newAnchorMin, menuSlideDuration))
        .Insert(0, rectTransform.DOAnchorMax(newAnchorMax, menuSlideDuration))
        .SetUpdate(true)
        .OnComplete(UpdateCanvasGroup);

    private GameObject storedSelectedGameObject;

    private void UpdateCanvasGroup()
    {
        canvasGroup.interactable = isGameMenuOpened.Value;
        canvasGroup.blocksRaycasts = isGameMenuOpened.Value;

        if (isGameMenuOpened.Value)
        {
            // when we show the menu, select the first button and save what was previously selected
            Debug.Log("GameMenu: menu game is opened, so i select the first element");
            storedSelectedGameObject = EventSystem.current.currentSelectedGameObject;
            EventSystem.current.SetSelectedGameObject(firstSelectedUIElement);
        }
        else if (storedSelectedGameObject != null)
        {
            // otherwise, if there was something stored before, hide it
            EventSystem.current.SetSelectedGameObject(storedSelectedGameObject);
        }
    }

    private GameObject lastSelected;

    private void Update()
    {
        if (!isGameMenuOpened.Value)
        {
            return;
        }

        var curr = EventSystem.current.currentSelectedGameObject;
        if (!selectables.Contains(curr))
        {
            EventSystem.current.SetSelectedGameObject(lastSelected == null ? firstSelectedUIElement : lastSelected);
        }
        else
        {
            lastSelected = curr;
        }
    }

    public void GoToMenu()
    {
        moveToGameArea.Event.Raise(GameArea.Menu);
        OnToggle();
    }

    public void Quit()
    {
        Debug.Log("Quitting!");
        Application.Quit();
    }
}
