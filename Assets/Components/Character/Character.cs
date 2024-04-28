using System;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using System.Linq;

public class Character : MonoBehaviour
{
    [Serializable]
    public struct CharacterVariant
    {
        public string VariantName;
        public Sprite Sprite;
    }

    [SerializeField] private CharacterVariant[] variants;
    [SerializeField] private CharacterName characterName;
    [SerializeField] private SerializableInkListItemValueList characterVariants;
    [SerializeField] private ShadowButtonCompanion shadowButtonCompanion;

    public CharacterName CharacterName => characterName;

    private void OnEnable()
    {
        characterVariants.Added.Register(CharacterVariantsChanged);
        characterVariants.Removed.Register(CharacterVariantsChanged);
        InnerCharacterVariantsChanged();
    }

    private void OnDisable()
    {
        characterVariants.Added.Unregister(CharacterVariantsChanged);
        characterVariants.Removed.Unregister(CharacterVariantsChanged);
    }

    private void CharacterVariantsChanged(SerializableInkListItem _variant)
    {
        InnerCharacterVariantsChanged();
    }

    private void InnerCharacterVariantsChanged()
    {
        foreach (var myVariant in from characterVariant in characterVariants
                                  from myVariant in variants
                                  where characterVariant.itemName == myVariant.VariantName
                                  select myVariant)
        {
            shadowButtonCompanion.SetForegroundImage(myVariant.Sprite);
        }
    }
}
