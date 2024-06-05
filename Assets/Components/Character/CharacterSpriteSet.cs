using System.Collections;
using System.Collections.Generic;

using LemuRivolta.InkAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class CharacterSpriteSet : MonoBehaviour
{
    [SerializeField] private Sprite[] sprites;
    [SerializeField] private ShadowButtonCompanion shadowButtonCompanion;
    [SerializeField] private Character character;

    private void Awake()
    {
        Assert.IsNotNull(shadowButtonCompanion);
        Assert.IsNotNull(character);
        Assert.IsTrue(sprites.Length > 0);
    }

    public void OnStoryStepChanged(StoryStep newStoryStep) {
        var (characterName, _) = Dialogue.GetCharacterAndText(newStoryStep.Text);
        if (characterName != character.CharacterName.ToString()) {
            return;
        }
        var sprite = sprites[Random.Range(0, sprites.Length)];
        shadowButtonCompanion.ForegroundImage = sprite;
    }
}
