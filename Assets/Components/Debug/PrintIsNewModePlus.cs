using System.Collections;
using System.Collections.Generic;

using TMPro;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class PrintIsNewModePlus : MonoBehaviour
{
    [SerializeField] private StringReference plusModePlayerPrefsKey;
    TextMeshProUGUI thisText;
    // Start is called before the first frame update
    void Start()
    {
        thisText = GetComponent<TextMeshProUGUI>();
    }

    // Update is called once per frame
    void Update()
    {
        thisText.text = PlayerPrefs.GetString(plusModePlayerPrefsKey);
    }
}
