using System;

using UnityAtoms.BaseAtoms;

using UnityEngine;

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
    [SerializeField] private StringValueList characterVariants;
    [SerializeField] private ShadowButtonCompanion shadowButtonCompanion;

    public CharacterName CharacterName => characterName;

    private void OnEnable()
    {
        characterVariants.Added.Register(CharacterVariantsChanged);
        characterVariants.Removed.Register(CharacterVariantsChanged);
        CharacterVariantsChanged("");
    }

    private void OnDisable()
    {
        characterVariants.Added.Unregister(CharacterVariantsChanged);
        characterVariants.Removed.Unregister(CharacterVariantsChanged);
    }

    private void CharacterVariantsChanged(string _variant)
    {
        foreach (var characterVariant in characterVariants)
        {
            foreach (var myVariant in variants)
            {
                if (characterVariant == myVariant.VariantName)
                {
                    shadowButtonCompanion.SetForegroundImage(myVariant.Sprite);
                }
            }
        }
    }
}
