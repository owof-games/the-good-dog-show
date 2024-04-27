=== day_three_lounge

-> inizio_lounge ->

@moveToDialogue character:{DOGRON}

DOGRON: Good morning, everyone, and wwwwwelcome to the third episode of THE VERY VERY GOOD GOOD DOG SHOW!
DOGRON: Don't you feel a little sad? {nonAliveCharacters()} already have left us, and I don't feel like making youuuuu leave too, no!
DOGRON: But the Supreme Chihuahua and the Grand Council of Pugs, in their wisdom they knooooooooow that it is important to find the perfect owner, I mean, the perfect little person for the restaurant on Saturn!
DOGRON: And surely this fantastic person with fantastic hands that can pat my head so gooooooood, must know how to make a recipe for…
DOGRON: ... when you feel sad because all the huuuuuumans are gone!
DOGRON: As usual, you have a few minutes for chit-chat, and then it's time to start cooooooooking!

-> lounge_loop(-> bebe_choice, -> ugo_e_mimi_choice, -> piiiietro_choice, -> quello_choice, -> il_divo_choice, -> day_three_kitchen)


= ugo_e_mimi_choice
    //INGREDIENTI SUGGERITI: iverivideogiochi e canapé
    UgoEMimi: …
        + YOU: I know I'm going to regret what I’m about to ask, but: how come you’re so quiet?
        -
    UgoEMimi: Ugo spoke with one of the publishers, for his video game.
    UgoEMimi: Junk sellers, they are. But did you know that the publishers are... pugs?!?
    UgoEMimi: And he was told that the project lacks a consistent narrative, and a connection between gameplay and graphical elements.
    UgoEMimi: They essentially told me that it makes no sense! That it's a game where meaningless things happen! But I've always been playing <b>REAL video games</b>! These are walking-simulator and visual-novel pugs!
        ~ dialogue_ingredients_of_the_day += IVeriVideogiochi
        + YOU: What are you going to do now?
        -
    UgoEMimi: Oh, I will cook <b>canapés</b> while Ugo recovers from his pain.
        ~ dialogue_ingredients_of_the_day += Canapé
    UgoEMimi: I do not suffer Mimi! Men do not suffer!
    UgoEMimi: What are then those tears, Ugo?
        + YOU: Aren't you scared about thing about missing humans?
        -
    UgoEMimi: Uh, I feel sorry for them, but we never really got along with humans. Not after the failure of the Virtual Boy.
    UgoEMimi: Speak for yourself, Ugo. I personally have always loved humans, I used to make a really good stew when they weren’t considered persons yet.
        + YOU: Oh, and I was afraid I was the only person who ate human flesh!
        + YOU: There is too much candy in my body for my meat to be tasty.
        + YOU: I think it’s the right moment for me to hide in a box.
        -

    ->->

    
= bebe_choice
    //Ingredienti suggeriti: mungere e cardare
    BeBe: Hey, there, I was distracted and didn't notice you coming.
        + YOU: Everything okay?
            BeBe: Oh yes of course, I'm so happy to be here!
        + YOU: In the cult they say, "Distraction is the gift of Belial."
            BeBe: Belial? Cult?
        + YOU: What's with the bandaged hoof?
            BeBe: Uh, a mistake during the pedicure.
        -
    BeBe: On a different note! You've been here for three episodes now, and you haven’t spoken much about yourself. Would you like to confide something to me, something that will stay between us?
        + YOU: When I dream I see the coming of the Apocalypse, and all the Horsemen have the face of Joan Rivers.
            BeBe: I think it's a common thing after Iron Man 3.
        + YOU: I am the second most important person in Rebecca Glasscock's fanclub.
            BeBe: Who?
        + YOU: I don't know why I'm here, I'm afraid it's a punishment from the Cult for that mistake with Ermenegildo.
            BeBe: You seem like a very confused person, you know?
        -
    BeBe: But, don't you find today's theme a little strange? What did he mean with "humans are all gone"? And then again, what are humans?
        + YOU: Uhm, I’m a human person. I think. I didn’t even know that there are non-human persons until just a few moments ago.
        -
    BeBe: Uh, that's why you have that hairless face, and you don’t ruminate! It must be so hard for you to digest. And, are there sheep too where you come from?
        + YOU: Many, they are among the most common animals.
        -
    BeBe: What do you mean, animals? Of course, it must be a civilized place, with so many sheep, very good!
        + YOU: We raise them to eat them, make wool, make milk.
            BeBe: But… you are monsters!!!
        + YOU: Yes, that's right, very civilized, um.
        + YOU: Well, they make great sacrificial animals for the Cult!
            BeBe: What do you mean? No, wait, I don't want to know. I don't want to.
        -
    BeBe: Today I want to amaze DOGRON: disappearance involves suffering, and suffering is overcome through pain. Therefore, I will cook something by <b>milking</b> myself and then <b>carding</b> my own wool.
    ~ dialogue_ingredients_of_the_day += Mungere
    ~ dialogue_ingredients_of_the_day += Cardare
    BeBe: That's why I say my goodbye to you now, and wish you the best.

    ->->


= piiiietro_choice
    //Ingredienti: tonno in scatola e scolare
    Piiiietro: Yet I was sure it was a D minor.
        + YOU: Excuse me?
        + YOU: You were down a semitone.
        + YOU: Demeanor of whom?
        -
    Piiiietro: But do you always get in other people's rooms like that? What a scumbag!
        + YOU: Actually this is the lounge, and it’s shared. But, do you have your own room?
        -
    Piiiietro: Sure thing, where would I place the UV bed and the speaker system otherwise?
        + YOU: Please please give me something that looks like sunshine for an hour!
            Piiiietro: What if I then get a sunburn infection!!!?
        + YOU: Speaker system? So it was you who was singing earlier?
            Piiiietro: NO.
        + YOU: But I don't have a room, I sleep in the girders above the kitchen.
            Piiiietro: And now we clearly see who has an agent and who does not, I’m sorry!
        -
    Piiiietro: Anyway: maybe they'll let us have karaoke. Short, tonight, after the rehearsal. It seems that my pasta with <b>canned tuna</b> and even badly <b>drained</b> is a hit. I'll try it again tonight!
        ~ dialogue_ingredients_of_the_day += TonnoInScatola
        ~ dialogue_ingredients_of_the_day += Scolare
        + YOU: But doesn’t the theme bother you, by any chance?
        -
    Piiiietro: And why should it?
        + YOU: I mean, do you see other human people?
    Piiiietro: Hey sweetheart, speak for yourself! I am a mathematical genius, an abstract entity, the very definition of the golden section. And I wear leopard print. Like hell I'm human!
    Piiiietro: And now get out of my room, I want to create some drama between BeBe and Dogron.
    
    ->->

    
= quello_choice
    //Ingredienti: Chinotto di Savona e raccontare
    Quello: What a shitty theme.
        + YOU: Is everything alright?
            Quello: Yes, yes, I think.
        + YOU: You look angry.
            Quello: No, what are you saying? Anger is FORBIDDEN by the contract of employment.
        + YOU: This "all humans are gone" thing is disturbing, don’t you think?
            Quello: You get by, you know?
        -
    Quello: Oh, sorry if I’m too bitter.
    Quello: It's kinda weird to think about a subject like this, when my father did… did some horrible things.
        + YOU: What do you mean?
        + YOU: If it’s of any consolation, mine too, when he became one of the Old Ones…
        + YOU: We all make mistakes, don't we?
        -
    Quello: Il Divo always says that work solves every problem and every fear. So I'm going to start cooking. I was thinking that the disappearance is a bitter thing, so I might make a braid that is a <b>storytelling</b> of other vacuum cleaners like me.
    ~ dialogue_ingredients_of_the_day += Raccontare
    Quello: Make it sweet but fill it with chunks of <b>Savona’s Chinotto</b> to enhance the bitterness of certain experiences.
    ~ dialogue_ingredients_of_the_day += ChinottoDiSavona
    Quello: A bit like when your father exterminates an entire population with one of his inventions.
        + YOU: Or when your father adds a new space-time dimension to your planet just because he had a fight with your other father and wants to mess with him.
            YOU: I will never forget those desperate, 5-dimensional screams.
        -
    Quello: That's right. You really understand me. I'm going to clean up Il Divo’s ingredients and then I will start my recipe. Thank you for the understanding!

    ->->

    
= il_divo_choice
    //Ingredienti: selfie e interviste
    ilDivo: Find me That One, now!
        + YOU: That one who?
        + YOU: Is he cleaning something of yours?
        + YOU: You know that I don't work for you, right?
        -
    ilDivo: Mom was always right, in the end you have to do everything on your own.
    ilDivo: Moreover, what a nightmare this language of yours, that only has two genders available.
    ilDivo: I don't get paid enough for all this!
        + YOU: What do you mean by “two genders”?
        + YOU: What do you mean by “on your own”?
        + YOU: What do you mean by… THEY PAY YOU?!?!
        -
    ilDivo: I’m sure you were wondering about this the whole time and, yes, being rich and famous is damn hard. Think, like, how do I know if a person loves me?
        + YOU: But are you here for the cooking contest, or to find love?
        -
    ilDivo: Me? A cooking contest? What do you think I am?!?
    ilDivo: Xi Jinping paid 7,759,312,650.00 Yuan for a <b>selfie</b> with me!
            ~ dialogue_ingredients_of_the_day += Selfie
    ilDivo: I learned to receive <b>interviews</b> before I even walked!
            ~ dialogue_ingredients_of_the_day += Interviste
    ilDivo: A cooking contest, tsk. That One is cooking for the both of us, what were you thinking?
        + YOU: Ooooook, it's time for me to go away.
        -

    ->->
    
    
=== day_three_kitchen

-> kitchen_loop(4, (Formaggio, Fondere, Coccole, Brandina, Cuccia, Sgranocchiare, Fidarsi, BarattoloDelloYogurt), -> day_four_lounge, 0)
