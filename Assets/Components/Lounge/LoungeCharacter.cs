using UnityEngine;
using UnityEngine.Assertions;

public class LoungeCharacter : MonoBehaviour
{
    [SerializeField] private Character character;
    [SerializeField] private Lounge lounge;

    public string ChoiceString => "$" + character.CharacterName.ToString();

    public CharacterName CharacterName => character.CharacterName;

    private void Awake()
    {
        Assert.IsNotNull(character);
    }

    public void OnClick() => lounge.OnChooseCharacter(ChoiceString);
}
