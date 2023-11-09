using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

[CreateAssetMenu(menuName = "The Good Dog Show/Create Play Background Music External Function")]
public class PlayBackgroundMusicFunction : ActionExternalFunction
{
    [SerializeField] private StringEventReference playBackgroundMusicStringEvent;

    public PlayBackgroundMusicFunction() : base("playBackgroundMusic") { }

    private void Awake()
    {
        Assert.IsNotNull(playBackgroundMusicStringEvent.Event);
    }

    public override void Call(ExternalFunctionContext context)
    {
        var musicName = GetArgument<string>(context, 0);
        playBackgroundMusicStringEvent.Event.Raise(musicName);
    }
}
