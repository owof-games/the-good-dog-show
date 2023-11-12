using System;
using System.Collections;
using System.Linq;

using DG.Tweening;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Assertions;

public class AudioManager : MonoBehaviour
{
    [System.Serializable]
    public class AudioEntry
    {
        [SerializeField] private string name;
        [SerializeField] private AudioClip audioClip;

        public string Name => name;
        public AudioClip AudioClip => audioClip;
    }

    [Header("Music")]
    [SerializeField] private AudioEntry[] audioEntries;
    [SerializeField] private AudioSource[] audioSources;
    [SerializeField] private FloatReference crossFadeDuration;
    [SerializeField] private FloatReference backgroundMusicVolume;

    [Header("Sfx")]
    [SerializeField] private AudioSource positiveFeedbackAudioSource;
    [SerializeField] private AudioSource negativeFeedbackAudioSource;
    [SerializeField] private FloatReference sfxVolume;

    private int currSourceIndex = 0;
    private string lastAudioEntryName;

    private void Awake()
    {
        Assert.AreEqual(audioSources.Length, 2);
        Assert.IsNotNull(positiveFeedbackAudioSource);
        Assert.IsNotNull(negativeFeedbackAudioSource);
    }

    private void OnEnable()
    {
        var bgMusicVolumeEv = backgroundMusicVolume.GetEvent<FloatEvent>();
        if (bgMusicVolumeEv != null)
        {
            bgMusicVolumeEv.Register(UpdateBackgroundMusicVolume);
        }

        var sfxVolumeEv = sfxVolume.GetEvent<FloatEvent>();
        if (sfxVolumeEv != null)
        {
            sfxVolumeEv.Register(UpdateSfxVolume);
        }
    }

    private void OnDisable()
    {
        var bgMusicVolumeEv = backgroundMusicVolume.GetEvent<FloatEvent>();
        if (bgMusicVolumeEv != null)
        {
            bgMusicVolumeEv.Unregister(UpdateBackgroundMusicVolume);
        }

        var sfxVolumeEv = sfxVolume.GetEvent<FloatEvent>();
        if (sfxVolumeEv != null)
        {
            sfxVolumeEv.Unregister(UpdateSfxVolume);
        }
    }

    private void UpdateBackgroundMusicVolume(float volume)
    {
        var nonTweeningAudioSources = from audioSource in audioSources
                                          // if the tween is active, its OnComplete will set the volume
                                      where !DOTween.IsTweening(audioSource)
                                      select audioSource;
        foreach (var audioSource in nonTweeningAudioSources)
        {
            audioSource.volume = volume;
        }
    }

    private void UpdateSfxVolume(float volume)
    {
        positiveFeedbackAudioSource.volume = volume;
        negativeFeedbackAudioSource.volume = volume;
    }

    public void PlayBackgroundMusic(string audioEntryName)
    {
        if (lastAudioEntryName == audioEntryName)
        {
            return;
        }
        lastAudioEntryName = audioEntryName;

        StopAllCoroutines();

        if (string.IsNullOrEmpty(audioEntryName))
        {
            StartCoroutine(CrossFadeBackgroundMusic(null));
            return;
        }

        var audioEntry = audioEntries.First(ae => ae.Name == audioEntryName);
        StartCoroutine(CrossFadeBackgroundMusic(audioEntry.AudioClip));
    }

    private IEnumerator CrossFadeBackgroundMusic(AudioClip audioClip)
    {
        // get the current bg audio source, and the new one
        // (we need 2 for cross-fade)
        int newSourceIndex = (currSourceIndex + 1) % 2;

        var currSource = audioSources[currSourceIndex];
        var newSource = audioSources[newSourceIndex];

        // switch indices for the next time this method is called
        currSourceIndex = newSourceIndex;

        // stop all currently running audio tweens
        currSource.DOKill();
        newSource.DOKill();

        // fade out the current audio source, if it's playing
        bool wasPlaying = false;
        if (currSource.isPlaying)
        {
            wasPlaying = true;
            yield return currSource
                .DOFade(0, crossFadeDuration / 2)
                .OnComplete(currSource.Stop)
                .WaitForCompletion();
        }

        // fade in the new audio source, if any
        newSource.Stop();
        newSource.clip = audioClip;
        if (newSource.clip != null)
        {
            newSource.volume = 0;
            newSource.Play();
            if (wasPlaying)
            {
                // cross-fade only if something was playing before
                yield return newSource
                    .DOFade(backgroundMusicVolume.Value, crossFadeDuration / 2)
                    .OnComplete(() =>
                    {
                        // force it anyway at the end, because it could have changed in the meanwhile
                        newSource.volume = backgroundMusicVolume.Value;
                    })
                    .WaitForCompletion();
            }
            else
            {
                newSource.volume = backgroundMusicVolume.Value;
            }
        }
    }

    public void PlayIngredientFeedback(bool success)
    {
        AudioSource audioSource = (success ? positiveFeedbackAudioSource : negativeFeedbackAudioSource);
        audioSource.volume = sfxVolume.Value;
        audioSource.Play();
    }
}
