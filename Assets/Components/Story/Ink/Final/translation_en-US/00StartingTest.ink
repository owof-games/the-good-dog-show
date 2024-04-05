=== starting_test

@moveToEnding

DOGRON: Here we are little human person! I am super glad you are here with me and my new friends for this wonderful adventure!
DOGRON: You will face five episodes of THE GOOOOOOOOOD DOG SHOW and I'm sure you will be the person who wins! I am sure about all of you, actually!
DOGRON: And that makes the show difficult, perhaps.
DOGRON: Anyway: to get to know each other better, I'd like to ask you a few questions, just to see how get by in the kitchen, and figure out what kind of contestant you're going to be. Shall we start?

+ YOU: Sure!
+ YOU: Do I have any alternatives?
    DOGRON: Of course, but then you would miss all the fun!
+ YOU: Where am I? What is happening? Who are you?
    DOGRON: No, wait, in this test I'm the one asking questions, friendly person!

- (domande)
{ shuffle stopping:
    - -> domanda1 -> loop_domande
    - -> domanda2 -> loop_domande
    - -> domanda3 -> loop_domande
    - -> domanda4 -> loop_domande
    - -> domanda5 -> loop_domande
    - -> domanda6 -> loop_domande
    - -> domanda7 -> loop_domande
    - -> domanda8 -> loop_domande
    - -> finedomande
}


= loop_domande
{ LIST_COUNT(abilities) >= 3:
    -> finedomande
- else: 
    -> domande
}


= domanda1
//TEST: DOMANDA 1: abilità richiama Concorrente
DOGRON: You're on an unknowwwwn planet, you've made a big mistake, and you don't know how to get back. What do you do?
+ YOU: Do I try and ask for help?
    ~ abilities += RichiamaConcorrente
+ YOU: Planet? No, seriously, why am I here?
+ YOU: I sit in the corner and cry.
-
->->


= domanda2
// TEST: DOMANDA 2: abilità EvidenziaIngredienti
DOGRON: All the people around youuuu talk about colors, but you haven't a clue what they are. How do you try to understand something you don't understand so you don't get caught?
+ YOU: I don't know, I stopped studying at the times table for 3s.
+ YOU: But what rae all these lights? And why does the chair smell like wet dog?
+ YOU: I copy the things other people do, hoping I don't screw up.
    ~ abilities += EvidenziaIngredienti
-
->->


= domanda3
// TEST: DOMANDA 3: abilità EvidenziaAzioni
// TODO: è diventato EvidenziaIngredient, è ok?
DOGRON: Something with long whiskers, short hair and the ability to get into boxes has destroyed your favorite game. How do you react?
+ YOU: I destroy everything they hold dear.
    ~ abilities += EvidenziaIngredienti
+ YOU: But what does this have to do with a cooking contest?
+ YOU: Strange, all this reminds me of Kitty.
-
->->


= domanda4
// TEST: DOMANDA 4: abilità ScelteLente
DOGRON: Someone you love very very much told youuuu he would be right back, but it's already ten minutes and there’s still no sign of him. How do you deal with your grief?
+ YOU: Are we here to give you counseling, or for a competition?
+ YOU: If you don't release me right now I'll call my lawyer!
+ YOU: I'd say it's time to get some sleep, chill out a little bit, catch up on the list of video games in my list.
    ~ abilities += ScelteLente
-
->->


= domanda5
// TEST: DOMANDA 5: abilità SceltaIngrediente
DOGRON: What is your favorite food, but, like, your suuuuuper favorite thing in the world?
+ YOU: lamb skewers.
+ YOU: Please get me out of this place, please, what did I ever do to you?!?
+ YOU: The end of capitalism.
    ~ abilities += SceltaIngrediente
-
->->


= domanda6
// TEST: DOMANDA 6: abilità PNGParliExtra
DOGRON: They take you to the playground. There's sunshine, lots of friends, and your favorite collar.
+ YOU: But where is the question?
+ YOU: This is perfection!
    ~ abilities += PNGParliExtra
+ YOU: Uh, what kind of collar? Is there a harness too?
-
->->

= domanda7
// TEST: DOMANDA 7: abilità SaltaMorte
DOGRON: It's been days that your tummy hurts, your wwwwwwwhole tummy. They put you on a leash and pat on the trunk of the car. How do you react?
+ YOU: Please please free me I didn't do anything wrong, my succulent plant will miss me!
+ YOU: I am a brave person, I will meet my destiny!
    ~ abilities += SaltaMorte
+ YOU: No fucking way. I bite their hand and escape towards freedom!
-
->->

= domanda8
// TEST: DOMANDA 8: abilità EliminaConcorrente
DOGRON: You buried someone, but you don't remember where you did it, and you're very sad, very. How do you react?
+ YOU: Oh. You're going to kill me, aren't you?
    DOGRON: No no, what are you talking about, you're not a hot dog!
+ YOU: No body, no crime. I'm sorry, Ermenegildo.
    ~ abilities += EliminaConcorrente
+ YOU: I turn myself in to the police, voluntarily. Don't you think it’s the sensible thing to do? You're going to do it, right?
-
->->

= finedomande
- (loop)
{ LIST_COUNT(abilities) < 3:
    ~ temp ability = LIST_RANDOM(LIST_ALL(abilities))
    ~ abilities += ability
    -> loop
- else:
    DOGRON: The quuuuestions are over! And thanks to our very accurate psychology system approved by the Grand Council of Pugs and the Supreme Chihuahua, I, Dogron The III, award you with…

    -> recap(abilities)
}

= recap(list_recap)

{list_recap:
    ~ temp ability = pop(list_recap)

    {ability:
        - EvidenziaIngredienti: DOGRON: the ability to notice the ingredients right away!
        - ScelteLente: DOGRON: the ability to slow down time.
        - SceltaIngrediente: DOGRON: the luck of being able to choose an ingredient at the beginning of a recipe.
        - PNGParliExtra: DOGRON: the right to chat with an extra person in the lounge.
        - SaltaMorte: DOGRON: the, um, uh, thepossibilityofskippingyourdeathonce uh look how beautiful a labrador!
        - EliminaConcorrente: DOGRON: The right to kick another person out of the program who is here to contestantatan. Cronestant. Contrestant. Someone that is here to play.
        - RichiamaConcorrente: DOGRON: The power to recall the dead once. Woah!
    }
    
    -> recap(list_recap)
- else:
    -> day_one_lounge
}
