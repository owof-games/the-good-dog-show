using UnityEngine;
using UnityEngine.Assertions;

public class YouPot : MonoBehaviour
{
    [SerializeField] private Pot pot;

    private void Awake()
    {
        Assert.IsNotNull(pot);
    }

    private void Reset()
    {
        pot = GetComponent<Pot>();
    }

    public void PlayRandomAnimation()
    {
        var values = System.Enum.GetValues(typeof(Pot.AnimationType));
        var value = (Pot.AnimationType)values.GetValue(Random.Range(0, values.Length));
        pot.PlayAnimation(value);
    }
}
