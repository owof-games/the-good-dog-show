using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.UI;

public class SyncVolumeVariable : MonoBehaviour
{
    [SerializeField] private FloatReference volume;
    [SerializeField] private Slider slider;
    [SerializeField] private AudioSource exampleAudioSource;

    private void OnEnable()
    {
        slider.value = volume.Value;

        var e = volume.GetEvent<FloatEvent>();
        if (e != null)
        {
            e.Register(OnVolumeChanged);
        }

        slider.onValueChanged.AddListener(OnSliderChanged);
    }

    private void OnDisable()
    {
        var e = volume.GetEvent<FloatEvent>();
        if (e != null)
        {
            e.Unregister(OnVolumeChanged);
        }

        slider.onValueChanged.RemoveListener(OnSliderChanged);
    }

    private bool changing = false;

    private void OnVolumeChanged(float newVolume)
    {
        if (!changing)
        {
            slider.value = newVolume;
        }
    }

    private void OnSliderChanged(float newValue)
    {
        changing = true;
        try
        {
            playAudioExample = true;
            volume.Value = newValue;
        }
        finally
        {
            changing = false;
        }
    }


    private bool playAudioExample = false;
    private float lastPlayed = float.MinValue;
    [SerializeField] private float minExampleAudioLength = 0.5f;

    private void Update()
    {
        if (playAudioExample && exampleAudioSource != null && lastPlayed < Time.unscaledTime - minExampleAudioLength)
        {
            exampleAudioSource.Stop();
            exampleAudioSource.volume = volume.Value;
            exampleAudioSource.Play();
            playAudioExample = false;
            lastPlayed = Time.unscaledTime;
        }
    }
}
