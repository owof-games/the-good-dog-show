using UnityEngine;

public class DogronFeedback : MonoBehaviour
{
    [SerializeField] private Animator animator;

    public void OnAddedIngredient(bool success) => animator.SetTrigger(success ? "Happy" : "Disappointed");
}
