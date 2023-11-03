using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class LoungeCharacter : MonoBehaviour
{
    [SerializeField] private Character character;
    [SerializeField] private CharacterNameEvent talkWithCharacter;

    public string ChoiceString => "$" + character.CharacterName.ToString();

    public CharacterName CharacterName => character.CharacterName;

    private void Awake()
    {
        Assert.IsNotNull(character);
        Assert.IsNotNull(talkWithCharacter);
    }

    public void OnClick() => talkWithCharacter.Raise(character.CharacterName);
}
