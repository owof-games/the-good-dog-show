using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class DogronFeedback : MonoBehaviour
{
    [SerializeField] private Animator animator;
    [SerializeField] private VoidBaseEventReference feedbackAnimationFinished;

    private void Awake()
    {
        Assert.IsNotNull(animator);
        Assert.IsNotNull(feedbackAnimationFinished);
    }

    public void OnAddedIngredient(bool success) => animator.SetTrigger(success ? "Happy" : "Disappointed");

    public void AnimationFinished() => feedbackAnimationFinished.Event.Raise();
}
