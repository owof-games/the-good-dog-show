using UnityEngine;
using UnityEngine.Assertions;

public class LoungeCharacter : MonoBehaviour
{
    [SerializeField] private string choiceString;
    [SerializeField] private Lounge lounge;

    public string ChoiceString => choiceString;

    private void Awake()
    {
        Assert.IsFalse(string.IsNullOrWhiteSpace(choiceString));
    }

    public void OnClick() => lounge.OnChooseCharacter(choiceString);
}
