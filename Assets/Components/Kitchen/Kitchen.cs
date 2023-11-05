using System.Collections.Generic;
using System.Linq;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class Kitchen : MonoBehaviour
{
    [SerializeField] private SerializableInkListItemValueList aliveCharacters;

    private void Awake()
    {
        Assert.IsNotNull(aliveCharacters);
    }

    private Character[] characters;
    private Character[] GetCharacters() => characters ??= GetComponentsInChildren<Character>(true);

    private Dictionary<CharacterName, NpcPot> npcPots;
    private Dictionary<CharacterName, NpcPot> GetNPCPots() => npcPots ??=
        GetComponentsInChildren<NpcPot>(true).ToDictionary(npcPot => npcPot.Owner);

    private void OnEnable()
    {
        // transform the ink list into a CharacterName list
        var aliveCharacterNames = (
            from aliveCharacter in aliveCharacters.List
            select System.Enum.Parse<CharacterName>(aliveCharacter.itemName))
            .ToList();

        // turn characters on or off according to whether they're alive, and their pots too
        // ("YOU" is always alive)
        foreach (var character in GetCharacters())
        {
            var isYou = character.CharacterName == CharacterName.YOU;
            var isAlive = aliveCharacterNames.Contains(character.CharacterName);
            bool isActive = isYou || isAlive;
            character.gameObject.SetActive(isActive);
            if (GetNPCPots().TryGetValue(character.CharacterName, out var npcPot))
            {
                npcPot.gameObject.SetActive(isActive);
            }
        }
    }
}
