using UnityEngine;

public class Character : MonoBehaviour
{
    [SerializeField] private CharacterName characterName;

    public CharacterName CharacterName => characterName;
}
