using System;
using LemuRivolta.InkAtoms;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using System.Linq;

public class Character : MonoBehaviour
{
    [Serializable]
    public class CharacterVariant
    {
        public string VariantName;
        public Sprite Sprite;
    }

    [SerializeField] private CharacterVariant[] variants;
    [SerializeField] private CharacterName characterName;
    [SerializeField] private SerializableInkListItemValueList characterVariants;
    [SerializeField] private ShadowButtonCompanion shadowButtonCompanion;

    public CharacterName CharacterName => characterName;

    private Sprite originalImage;

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
        var variant = (from characterVariant in characterVariants
            from myVariant in variants
            where characterVariant.itemName == myVariant.VariantName
            select myVariant).FirstOrDefault();
        if (variant != null)
        {
            if (originalImage == null)
            {
                originalImage = shadowButtonCompanion.ForegroundImage;
            }

            shadowButtonCompanion.ForegroundImage = variant.Sprite;
        }
        else if (originalImage != null)
        {
            shadowButtonCompanion.ForegroundImage = originalImage;
        }
    }
}