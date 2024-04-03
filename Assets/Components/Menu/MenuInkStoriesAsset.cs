using UnityEngine;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Menu Ink Stories Asset")]
public class MenuInkStoriesAsset : ScriptableObject
{
    [SerializeField] private TextAsset itInkTextAsset;
    public TextAsset ItInkTextAsset => itInkTextAsset;

    [SerializeField] private TextAsset enInkTextAsset;
    public TextAsset EnInkTextAsset => enInkTextAsset;
}
