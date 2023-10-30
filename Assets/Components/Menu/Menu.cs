using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class Menu : MonoBehaviour
{
    [SerializeField] private StringEvent continueEvent;
    [SerializeField] private InkAtomsStory inkAtomsStory;
    [SerializeField] private TextAsset inkTextAsset;

    private void Start()
    {
        Assert.IsNotNull(inkAtomsStory);
        Assert.IsNotNull(inkTextAsset);
        Assert.IsNotNull(continueEvent);
    }

    public void OnStart()
    {
        inkAtomsStory.Setup(inkTextAsset);
        continueEvent.Raise(null);
    }
}
