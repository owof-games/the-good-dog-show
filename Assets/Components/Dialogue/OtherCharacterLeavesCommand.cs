using System.Collections;
using System.Collections.Generic;
using LemuRivolta.InkAtoms;
using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Other Character Leaves Command")]
public class OtherCharacterLeavesCommand : CommandLineParser
{
    /// <summary>
    /// Dialogue property. Dialogue will set itself on this scriptable object at runtime.
    /// </summary>
    public Dialogue Dialogue { get; set; }

    public OtherCharacterLeavesCommand() : base("otherCharacterLeaves")
    {
    }

    public override IEnumerator Invoke(IDictionary<string, Parameter> parameters, StoryChoice[] choices,
        CommandLineParserAction commandLineParserAction)
    {
        Assert.IsNotNull(Dialogue);
        yield return Dialogue.OnOtherCharacterLeaves();
    }
}