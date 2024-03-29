using System.Collections;
using System.Collections.Generic;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Set Character Variant Command")]
public class SetCharacterVariantCommand : CommandLineParser
{
    [SerializeField] private StringValueList characterVariants;

    public SetCharacterVariantCommand(): base("setCharacterVariant") { }

    public override IEnumerator Invoke(IDictionary<string, Parameter> parameters, StoryChoice[] choices, CommandLineParserAction commandLineParserAction)
    {
        var characterVariant = GetParameter(parameters, "image");
        characterVariants.Add(characterVariant);
        yield break;
    }
}
