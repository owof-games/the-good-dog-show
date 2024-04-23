/*
DAY START

Management of the dialogues at the beginning of the day, before the lounge.
*/

VAR day = 0

=== inizio_lounge ===

~ day++

~ playBackgroundMusic("chill")

@moveToDialogue character:{DOGRON}

DOGRON: {And nowwwwwwww, a warm welcome to all the contestants and those following us from home!|Here we go again, contestants and spectators!|Goooood evening to all the beautiful people on this planet and beyond!|Has anyone seen my favorite collar?|Last night my friends, last night together!}

// skip "remove_ability" the first time and immediately go to use_ability
{ use_ability:
    -> remove_ability
- else:
    -> use_ability
}

= remove_ability

DOGRON: {Contestants, remember that every day youuuuu will lose one of your abilities. Human person here in front of me! Today you will lose... drum rolls...|What skill shall we take away from our huuuuuman person today?!?|Fewer and fewer people, fewer and fewer active skills!|Uuuuh, my tummy hurts today.|Me big doggo, me not crying, no no, wooooof!}

~ temp ability = LIST_RANDOM(abilities)
{ ability:
  - EvidenziaIngredienti: DOGRON: You will no longer be able to see the ingredients clearly.
  - ScelteLente: DOGRON: Choices will now flow faster.
  - SceltaIngrediente: DOGRON: You will have no longer an ingredient of your choice to select at the start of the game.
  - PNGParliExtra: DOGRON: Enough with the chit-chat!
  - SaltaMorte: DOGRON: If you get the recipe wrong, you won't have any rescue plans.
  - EliminaConcorrente: DOGRON: You will no longer be able to eliminate another contestant.
  - RichiamaConcorrente: DOGRON: No power to recall a person who left.
}
~ abilities -= ability

-> use_ability

= use_ability

{ abilities has PNGParliExtra:
  DOGRON: I remind you, my dear person, that you will be able to talk to one more person.
}

{ abilities has EliminaConcorrente and not eliminatrice and alive_characters:
    -> eliminatrice_choice ->
}

{ abilities has RichiamaConcorrente and not resuscitatrice and alive_characters != LIST_ALL(alive_characters):
    -> resuscitatrice_choice ->
}

->->

= eliminatrice_choice
    // TODO: visualizzare solo se ci sono almeno 2 persone vive
    DOGRON: You have a chance to get rid of one of these beautiful people, who do you want to get rid of?
    + {alive_characters has BeBe} YOU:BeBe.
        ~ alive_characters -= BeBe
        DOGRON: Bye Bye BeBe.
        ~ eliminatrice = true
        ~ abilities -= EliminaConcorrente
    + {alive_characters has Piiiietro} YOU:Piiiietro.
        ~ alive_characters -= Piiiietro
        ~ eliminatrice = true
        ~ abilities -= EliminaConcorrente
        DOGRON: Piiiietro, my favourite number: you've been eliminated!
    + {alive_characters has UgoEMimi} YOU:Ugo and Mimi.
        ~ alive_characters -= UgoEMimi
        ~ eliminatrice = true
        ~ abilities -= EliminaConcorrente
        DOGRON: Mimi, we will miss you. Ugo: sashay away.
    + {alive_characters has Quello} YOU: That One
        ~ alive_characters -= Quello
        ~ eliminatrice = true
        ~ abilities -= EliminaConcorrente
        DOGRON: Oh. Oh. My friend, I hope you will forgive this contestant, but you must leave. I will see you again in the endless meadows!
    + {alive_characters has ilDivo} YOU: Il Divo
        ~ alive_characters -= ilDivo
        ~ eliminatrice = true 
        ~ abilities -= EliminaConcorrente
        DOGRON: Sorry, kind of. Goodbye, Divo!
    + YOU: No person!
        DOGRON: I like this way of thinking!
    -
    ->->

= resuscitatrice_choice
    // TODO: visualizzare solo se c'è almeno una persona che è uscita
    DOGRON: You want to bring a contestant back among us?
        + { alive_characters hasnt BeBe } YOU:BeBe!
        ~ alive_characters += BeBe
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: Welcome baaaaaack, BeBe!
        + { alive_characters hasnt Piiiietro } YOU:Piiiietro!
        ~ alive_characters += Piiiietro
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: And here you go again: Piiiietro!
        + { alive_characters hasnt UgoEMimi } YOU: Ugo e Mimi!
        ~ alive_characters += UgoEMimi
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: Mimi! How nice to have you here with us again! And Ugo, ah. Ugo.
        + { alive_characters hasnt Quello } YOU: That One.
        ~ alive_characters += Quello
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: Hello my friend, at long last!
        + { alive_characters hasnt ilDivo } YOU: Il Divo.
        ~ alive_characters += ilDivo
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: Well... he's back.
        + YOU: MMM, I'm fine, thank you.
            DOGRON: Ah, uh, it seems cruuuuuel but that's the game, isn't it?
        -
    ->->
