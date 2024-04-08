using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Set New Mode Plus External Function")]
public class SetNewModePlusExternalFunction : ActionExternalFunction
{
    [SerializeField] private StringReference plusModePlayerPrefsKey;

    SetNewModePlusExternalFunction() : base("setNewModePlus") { }

    private void OnEnable()
    {
        Assert.IsNotNull(plusModePlayerPrefsKey);
    }

    public override void Call(ExternalFunctionContext context)
    {
        PlayerPrefs.SetString(plusModePlayerPrefsKey, (bool)context.Arguments[0] ? "true" : "false");
    }
}
