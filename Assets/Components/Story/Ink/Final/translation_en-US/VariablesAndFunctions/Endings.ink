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
    DOGRON: Uh, you should have lost, but you have the bonus that allows you to save yourself once ! Lucky for you, yes yes !
- num_right_ingredients < num_ingredients_to_get_right:
    -> non_ce_lhai_fatta
}

-> eliminazione_concorrente ->

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
DOGRON: {~ The Great Council of Pugs discovered that you cup recipes from. Nigella Lawson|The Supreme Chihuahua has bitten your heel, repeatedly. You will die of rage|Bruiser Woods entered the Grand Council and made Piiiietro win}. THE GOOOOOOOOOD DOG for you ends here.
-> END



== eliminazione_concorrente
~ temp da_eliminare = LIST_RANDOM(alive_characters)
DOGRON: Congratulations, you won at the expense of: {da_eliminare}
~ alive_characters -= da_eliminare
->->



=== finale_cinque
DOGRON: You bring some metaphysical cooking here! What happened when youuuu finished cooking? {~ Pazuzu himself rises from the Underworld to ask you what horror you have cooked|You have cancelled gravity.|A black hole has opened in the control room, let's restart as soon as possible}. I don't know why, but you are undefeatable!
->->

=== finale_quattro
DOGRON: I'm still not sure if you can cook. How did it go today? {~ Everything is fine in the kitchen. Outside, the universe has been erased| I'm being warned that the planet has stopped turning| Who am I? Where did I come from? What was on my plate? Someone help me}. You have passed today's challenge!
->->

=== finale_tre
DOGRON: I see your efforts today, and what abouuuuut what you cooked? {~ Out of the oven, the flan lets out heartrending cries|The thing that was on my plate is dancing with the cameraman|You cooked something that can throw me the ball}. You have won this challenge! See you tomorrow!
->->

=== finale_due
DOGRON: Compared to what you coooooooked... {~ From the frying pan comes a smell of cyanide and sea water|Why is there melted plastic on my plate?|After eating it, I coughed and dropped a lung}. But congratulations: see you in the next episode!
->->

== finale_uno
DOGRON: Regarding your recipe: {~ What's in the pan doesn't scream, doesn't move, and doesn't ask existential questions|Might be passable for a McDonald's|I know some students who might eat it, maybe}. Unexpectedly move on to the next installment!
->->



=== finale ===
DOGRON: Uh, look at that beautiful devastation! Did you ever think you would win this program?
    + YOU: Of course, I'm the only person who actually cooked.
    + YOU: You're not going to kill me, are you?
    + YOU: Can I go home now?
    -
DOGRON: And nowwwww, the prize!
DOGRON: Surprise: not a restaurant on Mercury, but, but, do you want to hear it?
    + YOU: The longer you take, the less I think I want to know.
    + YOU: Yes, yes, yes!
    + YOU: The important thing is to go home, please.
    -
DOGRON: You will be the first person!
    + YOU: To do what?
    -
DOGRON: To replace humans on our planet.
DOGRON: Taking care of the Suuuuupreme Chihuahua, Pugs and of course a labrador sweet and very good pat-pat!
    + YOU: And what would this labrador be?
    -
DOGRON: I don't like these jokes, no no.
    + YOU: Who is a good dog? WwwwwHO?
    -
DOGRON: I am a good dog, a good dog!!!
    + YOU: And where is your home located?
    -
DOGRON: A very simple planet. There are fire hydrants, gardens, rivers, lots of tennis balls, bunks, pizza trees and beer fouuuuuntains. I hope it's to your enjoyment.
    + YOU: Pizza trees?
        DOGRON: Yes. Do you like pizza?
         + + YOU: Let's go!
    + YOU: Beer fountains?
        DOGRON: Unfortunately, they growwwww up that way, even if we don't want to.
        + + YOU: We're leaving, right now!!!
    + YOU: Fire hydrants?
        DOGRON: Yes! Do youuuu like them too? Don't tell me you're a doggo!
        + + YOU: Macchè doggo! The Cult is allergic to water, they'll never catch me!
    -
DOGRON: So, off we go! Our mission here is complete!
DOGRON: Go with the credits, Bruiser!

-> END
