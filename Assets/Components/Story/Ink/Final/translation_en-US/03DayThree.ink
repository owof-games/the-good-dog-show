=== day_three_lounge

-> inizio_lounge ->

@moveToDialogue character:{DOGRON}

DOGRON: Good morning, everyone, and wwwwwelcome to the third episode of THE VERY VERY GOOD GOOD DOG SHOW!
DOGRON: Don't you feel a little sadness? Already two people have left us, and I don't feel like making youuuuu leave, no!
DOGRON: But the Supreme Chihuahua and the Grand Council of Pugs, in their wisdom they know that it is important to find the perfect mistress, no, the perfect little person for the restaurant on Satuuuuurn!
DOGRON: And suuuuurely this magnificent person with magnificent hands that
DOGRON: ... when you feel sad because all the huuuuuumans are gone!
DOGRON: As always you have a few minutes for chit-chat, and then it's time to start cooooooooking!

-> lounge_loop(-> bebe_choice, -> ugo_e_mimi_choice, -> piiiietro_choice, -> quello_choice, -> il_divo_choice, -> day_three_kitchen)


= ugo_e_mimi_choice
    //INGREDIENTI SUGGERITI: iverivideogiochi e canapé
    UgoEMimi: …
        + YOU: I know I'm going to regret saying this, but you seem very quiet today.
        -
    UgoEMimi: Ugo spoke with one of the producers, for his video game.
    UgoEMimi: Junk sellers, they are. But did you know that the manufacturers are pugs!!!!
    UgoEMimi: And he was told that the project lacks a coherent narrative, and a connection between gameplay, narrative and graphical elements.
    UgoEMimi: Mi hanno detto in sostanza che non ha senso! That it's a game where meaningless things happen! But I've been playing <b>real video games</b> forever! These are walking simulator pugs and visual novels!
        ~ dialogue_ingredients_of_the_day += IVeriVideogiochi
        + YOU: What are you going to do now?
        -
    UgoEMimi: Oh, I will cook <b>canapés</b> while Ugo recovers from the pain.
        ~ dialogue_ingredients_of_the_day += Canapé
    UgoEMimi: I do not suffer Mimi! Men do not suffer!
    UgoEMimi: Then what are they, those tears, Ugo?
        + YOU: Aren't you scared about that missing humans thing?
        -
    UgoEMimi: Uh, I feel sorry for them, but we never got along with humans. Not after the failure of the Virtual Boy.
    UgoEMimi: Speak for yourself, Ugo. I personally have always loved humans, I used to get really good pizza when I could still cook them.
        + YOU: Oh, and I was afraid I was the only person who ate human flesh!
        + YOU: I have too much junk in my body for my meat to be tasty.
        + YOU: I think it is time for me to go to Uranus.
        -

    ->->

    
= bebe_choice
    //Ingredienti suggeriti: mungere e cardare
    BeBe: Hey, there, I was distracted and didn't notice your arrival.
        + YOU: Everything okay?
            BeBe: Oh yes of course, I'm so happy to be here!
        + YOU: In the cult they say, "Distraction is the gift of Belial."
            BeBe: Belial? Cult?
        + YOU: What's with the bandaged paw?
            BeBe: Uh, a mistake during the pedicure.
        -
    BeBe: Rather: you've been here for three episodes now, and you don't tell much about yourself. Would you like to confide something to me, something that will stay between you and me?
        + YOU: When I dream I see the coming of the Apocalypse, and all the Horsemen of the Apocalypse have the face of Joan Rivers.
            BeBe: I think it's a common thing after Iron Man 3.
        + YOU: I am the second most important person in Rebecca Glasscock's fanclub.
            BeBe: Who?
        + YOU: I don't know why I'm here, I'm afraid it's a punishment from the cult for that mistake with Ermenegildo.
            BeBe: You seem like a very confused person, you know?
        -
    BeBe: But, don't you find today's theme a little strange? In what sense "humans are all gone"? And then what are humans?
        + YOU: Um, am I a human person?
        -
    BeBe: Uh, that's why that hairless face, and the fact that he doesn't rumble! That's so funny. And where you come from there are sheep too?
        + YOU: Many, they are among the most common animals.
        -
    BeBe: In what sense, animals? Of course, it must be an evolved place, with so many sheep, well well well!
        + YOU: We raise them to eat, make wool, make milk.
            BeBe: Ah. I guess I'll go back to my stuff. Baaaaaaaaaay.
        + YOU: Yes, that's right, very evolved, um.
        + YOU: Well, they make good sacrificial animals for the Cult!
            BeBe: In what sense? No, I don't want to know. I don't want to.
        -
    BeBe: Today I want to hit DOGRON: disappearance involves suffering, and suffering is overcome with pain. Therefore I will cook something by <b>milking</b> and then <b>carding</b> my own wool.
    ~ dialogue_ingredients_of_the_day += Mungere
    ~ dialogue_ingredients_of_the_day += Cardare
    BeBe: That's why I greet you now, and wish you the best.

    ->->


= piiiietro_choice
    //Ingredienti: tonno in scatola e scolare
    Piiiietro: Yet I was sure it was a D minor.
        + YOU: Excuse me?
        + YOU: You were down a semitone.
        + YOU: demeanor of whom?
        -
    Piiiietro: But that you always enter other people's rooms like that? What a scumbag!
        + YOU: Actually this is the lounge, and it is common.But why? Do you have your own room?
        -
    Piiiietro: Sure, otherwise where would I place the UV bed and the speaker system?
        + YOU: Please please give me something that looks like sunshine for an hour!
            Piiiietro: What if I then get a sunburn infection!!!?
        + YOU: Speaker system? So it was you who sang first?
            Piiiietro: NO.
        + YOU: But I don't have a room, I sleep in the rafters above the kitchen.
            Piiiietro: And here you can see who has an agent and who doesn't, I'm sorry!
        -
    Piiiietro: Maybe they'll have us do karaoke anyway. Small, tonight, after the rehearsal. It seems that my pasta with <b>canned tuna</b> and even badly <b>drained</b> is a hit. I'll reintroduce it again tonight!
        ~ dialogue_ingredients_of_the_day += TonnoInScatola
        ~ dialogue_ingredients_of_the_day += Scolare
        + YOU: But the theme doesn't bother you, by any chance?
        -
    Piiiietro: And why should it?
        + YOU: I mean, do you see other human people?
    Piiiietro: Hey sweetheart, speak for yourself! I am a mathematical genius, an abstract entity, the very definition of the golden section. And I wear leopard print. Like hell I'm a human!
    Piiiietro: And now get out of my room, that I must create some drama between BeBe and Dogron.
    
    ->->

    
= quello_choice
    //Ingredienti: Chinotto di Savona e raccontare
    Quello: What a fucking theme.
        + YOU: Is everything all right?
            Quello: Yes, yes, I think.
        + YOU: You look angry.
            Quello: No, what are you saying? Anger is FORBIDDEN by the labor contract.
        + YOU: This whole "all humans are gone" thing is disturbing, isn't it?
            Quello: You survive, you know?
        -
    Quello: Oh, sorry to be bitter.
    Quello: It's a little strange though to think about a theme like this, when your father did, did some horrible things.
        + YOU: In what sense?
        + YOU: You know, even mine, when he became one of the Old Ones…
        + YOU: We all make mistakes, don't we?
        -
    Quello: Il Divo always says that work solves every problem though, every fear. So I'm going to start cooking. I was thinking that disappearance is a bitter thing, and I might make a braid that is a <b>tell the story</b> of other vacuum cleaners like me.
    ~ dialogue_ingredients_of_the_day += Raccontare
    Quello: Make it sweet but fill it with chunks of <b>Savona’s Chinotto</b> to enhance the bitterness of certain experiences.
    ~ dialogue_ingredients_of_the_day += ChinottoDiSavona
    Quello: Kind of like when your father exterminates an entire population with his invention.
        + YOU: Or your father adds a space-time dimension to your planet because he quarreled with your other father.
        -
    Quello: That's right. You really understand me. I'm going to clean up Il Divo ingredients and then start my recipe. Thank you for understanding!

    ->->

    
= il_divo_choice
    //Ingredienti: selfie e interviste
    ilDivo: Find me That One, now!
        + YOU: That one who?
        + YOU: Is he going to be cleaning something of yours?
        + YOU: You understand that I don't work for you, right?
        -
    ilDivo: Mom was always right, in the end you have to do things yourself.
    ilDivo: What a nightmare then that this language of yours has only two genders to define.
    ilDivo: I don't get paid enough for all this!
        + YOU: What do you mean, two genders?
        + YOU: What do you mean, alone?
        + YOU: What do you mean, THEY PAY YOU?!?!
        -
    ilDivo: You've been wondering this forever, and yes, being rich and famous is damn hard. Think like, how do I know if a person loves me?
        + YOU: But are you here for the cooking contest, or to find love?
        -
    ilDivo: Me, a cooking contest? What do you take me for!!!
    ilDivo: Xi Jinping paid 7,759,312,650.00 Yuan for a <b>selfie</b> with me!
            ~ dialogue_ingredients_of_the_day += Selfie
    ilDivo: I learned to receive <b>interviews</b> before I even walked!
            ~ dialogue_ingredients_of_the_day += Interviste
    ilDivo: A cooking contest, tsé. That one's cooking for both of us, what do you think?
        + YOU: Ooooook, it's time for me to take the curtains off.
        -

    ->->
    
    
=== day_three_kitchen

-> kitchen_loop(4, (Formaggio, Fondere, Coccole, Brandina, Cuccia, Sgranocchiare, Fidarsi, BarattoloDelloYogurt), -> day_four_lounge, 0)
