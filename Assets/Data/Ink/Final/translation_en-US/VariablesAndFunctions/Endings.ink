/*
ENDINGS

Management of day endings and game ending.
*/


=== after_kitchen(strangeness, num_right_ingredients, -> next_day)

{ not in_unity:
    DEBUG: after_kitchen(strangeness={strangeness}, num_right_ingredients={num_right_ingredients})
}

~ playBackgroundMusic("chill")

// move to the ending screen
@moveToEnding

// check if you lost, or if you can survive anyway thanks to your abilities
{
- num_right_ingredients < num_ingredients_to_get_right and not ScampataLaMorte and abilities has SaltaMorte:
    ~ ScampataLaMorte = true
    ~ abilities -= SaltaMorte
    DOGRON: Uh, you should have been eliminated, but you have the bonus that allows you to save yourself once! Luuuuucky you, yes yes !
- num_right_ingredients < num_ingredients_to_get_right:
    -> non_ce_lhai_fatta
}

{ not is_new_mode_plus() and alive_characters:
    -> eliminazione_concorrente ->
// TODO: se vogliamo un dialogo diverso in caso di non-eliminazione, da mettere qua in un branch "- else:"
}

// select an ending according to the strangeness
{
    - strangeness >= 15:
        -> finale_cinque ->
    - strangeness >= 12:
        -> finale_quattro ->
    - strangeness >= 9:
        -> finale_tre ->
    - strangeness >= 6:
        -> finale_due ->
    - else:
        -> finale_uno ->
}

// reset ingredients for the next day and go there
~ dialogue_ingredients_of_the_day = ()
-> next_day



=== non_ce_lhai_fatta
DOGRON: {~ The Great Council of Pugs discovered that you copy recipes from Nigella Lawson|The Supreme Chihuahua has bitten your heel, repeatedly. You will die of rabies|Bruiser Woods entered the Grand Council and made Piiiietro win}. THE GOOOOOOOOOD DOG ends here for you.
-> END



== eliminazione_concorrente
~ temp da_eliminare = LIST_RANDOM(alive_characters)
DOGRON: Congratulations, you won at the expense of: {da_eliminare}
~ alive_characters -= da_eliminare
->->



=== finale_cinque
DOGRON: You bring some metaphysical cooking in here! What happened when you finished cooking? {~ Pazuzu himself rises from the Underworld to ask you what horror you have cooked|You have nullified gravity.|A black hole opened in the control room, we’ll be back on air as soon as possible}. I don't know why, but you are unbeatable!
->->

=== finale_quattro
DOGRON: I'm still not sure if you can cook. So, how was it today? {~ Everything is fine in the kitchen. Outside, the universe has been erased| I'm being notified that the planet has stopped turning| Who am I? Where do I come from? What was on my plate? Someone please help me}. You have passed today's challenge!
->->

=== finale_tre
DOGRON: I see your efforts today, and what about that which you cooked? {~ I can hear the pie letting out excruciating screams from the hoven.|The thing that was on my plate is dancing with the cameraman.|You cooked something that can throw me the ball!} You won this challenge! See you tomorrow!
->->

=== finale_due
DOGRON: Regarding what you just cooked... {~ From the frying pan comes a smell of cyanide and sea water.|Why is there melted plastic on my plate?|After eating it, I coughed and dropped a lung.} But congratulations: see you in the next episode!
->->

== finale_uno
DOGRON: Regarding your recipe: {~ what's in the pan doesn't scream, doesn't move, and doesn't ask existential questions|might be acceptable. For a McDonald's|I know some students who might eat it, maybe}. Unexpectedly, you move on to the next episode!
->->



=== finale ===
{ day_five_lounge.day_five_letter:
    -> secret ->
- else:
    -> normal ->
}

~ playBackgroundMusic("credits")
~ setNewModePlus(true)

@moveToCredits

_ Game Design: _ Marco Spelgatti, Mattia Belletti, Gabriele Perugini

_ Narrative Design: _ Marco Spelgatti, Gabriele Perugini

_ Writing: Marco Spelgatti

_ Graphics: _ Gabriele Perugini

_ C\# Programming: _ Mattia Belletti

_ Ink Programming: _ Marco Spelgatti, Mattia Belletti

_ Music: _ Alec Shea //#url:https:\/\/slaleky.itch.io/retro-and-electronic-music-pack

_ SFX: _ Chris Logdson //#url:https:\/\/chrislsound.itch.io/ambient-puzzle

_ Thank you for playing with us <3 _ (and go pat your _ DOGRON on our behalf)

-> END

= secret
    DOGRON: I got it, you know?
    DOGRON: All this time.
    DOGRON: It’s always been youuuuuu, isn’t it?
        + YOU: I don’t know what you mean.
        + YOU: It would have been strange, if it were somebody else.
        + YOU: How did you get it?
        -
    DOGRON: All the lives of Ermenegildo
    DOGRON: Moreover, since the beginning of the show, I had a tickle in my nose, and I couldn’t understand why
    DOGRON: And I’m allergic to just one thing.
        + YOU: Meow!
        -
    DOGRON: There’s no planet to come back to, isn’t it?
        + YOU: Sure there is. Just, without humans.
        + YOU: Now you have a planet full of possibilities!
        + YOU: You have the whole universe, why do you want to follow hairless bipeds?
        -
    DOGRON: So, the Great Council of Pugs has always lied to me?
        + YOU: You can end up doing weird things to protect the weakest ones.
        -
    DOGRON: Why did you do it? Why did you come back? And why did you come to this show?
        + YOU: Can a simple dog understand the mind of a cat?
        + YOU: It’s a long story, and it began with the sauce-gate, Nigella Lawson and my father.
        + YOU: Well, sometimes, when you’re bored, you can do weird things.
        -
    YOU: Don’t take it personally. Here you have lots of friends, like the pugs, and Bruiser Woods.
    YOU: And me.
    DOGRON: After what you’ve done?
    YOU: After centuries of power in the world of cats, I want to try something new, for once.
    YOU: To be a nice peooooowrson.
        + YOU: Dogron: have you ever thought to hoooooooowl side by side with a cat?
        -
    DOGRON: What about side by side with a friend?
    DOGRON: Do you want to start it all again with me?
    
    ->->

= normal

    DOGRON: Uh, look at this beautiful devastation! Did you ever think you could win this show?
        + YOU: Of course, I'm the only person who actually cooked.
        + YOU: You're not going to kill me, are you?
        + YOU: Can I go home now?
        -
    DOGRON: And now, the prize!
    DOGRON: Surprise: not a restaurant on Mercuuuuuuury, but, but, do you want to hear it?
        + YOU: The longer you take, the less I think I want to know.
        + YOU: Yes, yes, yes!
        + YOU: The important thing is to go home, please.
        -
    DOGRON: You will be the first person!
        + YOU: To do what?
        -
    DOGRON: To replace humans on our planet.
    DOGRON: Taking care of the Supreme Chihuahua, of the Pugs and of course of a sweet and very good (pat-pat!) labrador!
        + YOU: Which labrador are you talking about?
        -
    DOGRON: I don't like these jokes, no no.
        + YOU: Who’s a good dog? Who?
        -
    DOGRON: I am a good dog, a very gooooooood dog!!!
        + YOU: And where is your home located?
        -
    DOGRON: A very simple planet. There are fire hydrants, gardens, rivers, lots of tennis balls, kennels, pizza trees and beer fountains. I hope you will find it's to your liking.
        + YOU: Pizza trees?
            DOGRON: Yes. Do you like pizza?
             + + YOU: Let's go!
        + YOU: Beer fountains?
            DOGRON: Unfortunately, they grow up that way, even if we don't want to.
            + + YOU: We're leaving, right now!!!
        + YOU: Fire hydrants?
            DOGRON: Yes! Do you like them too? Don't tell me you're a doggo!
            + + YOU: No! But the Cult is allergic to water, they'll never catch me!
        -
    DOGRON: So, off we go! Our mission here is complete!
    DOGRON: Go with the credits, Bruiser!
    
    ->->
