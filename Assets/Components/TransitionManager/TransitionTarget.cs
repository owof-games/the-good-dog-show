using System.Collections;
using UnityEngine;

/// <summary>
/// Component that can receive transition messages
/// </summary>
public abstract class TransitionTarget : MonoBehaviour
{
    public abstract IEnumerator OnTurnOn();
}
