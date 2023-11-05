using System.Collections;

using UnityEngine;
using UnityEngine.Assertions;

public class NpcPot : MonoBehaviour
{
    [SerializeField] private CharacterName owner;
    [SerializeField] private Pot pot;
    [SerializeField] private float minTimeBetweenAnimations;
    [SerializeField] private float maxTimeBetweenAnimations;

    public CharacterName Owner => owner;

    private void Awake()
    {
        Assert.IsNotNull(pot);
        Assert.IsTrue(minTimeBetweenAnimations > 0);
        Assert.IsTrue(maxTimeBetweenAnimations > 0);
        Assert.IsTrue(minTimeBetweenAnimations <= maxTimeBetweenAnimations);
    }

    private void Reset()
    {
        pot = GetComponent<Pot>();
    }

    private IEnumerator Start()
    {
        for(; ; )
        {
            yield return new WaitForSeconds(Random.Range(minTimeBetweenAnimations, maxTimeBetweenAnimations));
            pot.PlayRandomAnimation();
        }
    }
}
