using LemuRivolta.InkAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class StoryLoader : MonoBehaviour
{
    [SerializeField] private TextAsset inkTextAsset;
    [SerializeField] private InkAtomsStory inkAtomsStory;

    private void Start()
    {
        Assert.IsNotNull(inkTextAsset);
        Assert.IsNotNull(inkAtomsStory);
        inkAtomsStory.Setup(inkTextAsset);
    }
}
