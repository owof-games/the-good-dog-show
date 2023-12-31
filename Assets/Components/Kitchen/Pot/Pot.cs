using UnityEngine;
using UnityEngine.Events;

public class Pot : MonoBehaviour
{
    [SerializeField] private UnityEvent potAnimationFinished;
    [SerializeField] private Animator animator;

    public void PotAnimationFinished() => potAnimationFinished.Invoke();

    public enum AnimationType
    {
        Bubbles,
        Pyramid,
        Smoke,
        Blob
    }

    public void PlayAnimation(AnimationType type) => animator.SetTrigger(type switch
    {
        AnimationType.Bubbles => "Bubbles",
        AnimationType.Pyramid => "Pyramid",
        AnimationType.Smoke => "Smoke",
        AnimationType.Blob => "Blob",
        _ => throw new System.ArgumentException($"Unknown animation type {type}", nameof(type)),
    });

    public void PlayRandomAnimation()
    {
        var values = System.Enum.GetValues(typeof(AnimationType));
        var value = (AnimationType)values.GetValue(Random.Range(0, values.Length));
        PlayAnimation(value);
    }
}
