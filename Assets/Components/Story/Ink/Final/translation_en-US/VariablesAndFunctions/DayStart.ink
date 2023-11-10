/*
DAY START

Management of the dialogues at the beginning of the day, before the lounge.
*/

=== inizio_lounge ===

~ playBackgroundMusic("chill")

@moveToDialogue character:{DOGRON}

DOGRON: {And now, a welcome to all the contestants and those following us from home!|Here wwwwe go again, contestants and spectators!|Goooood evening to all the beautiful people on this planet and beyond!|Has anyone seen my favorite collar?|Last night friends, last night together!}
DOGRON: {Competitors, remember that every day youuuuu will lose one of your abilities. Human person here in front of me! You will lose today, drum roll...|What skill will we take away from our huuuuuman person today?!?|Fewer and fewer people, fewer and fewer active skills!|Uuuuh, my tummy hurts today.|Me doggo big, not crying, no no, wooooof!}

~ temp ability = LIST_RANDOM(abilities)
{ ability:
  - EvidenziaIngredienti: DOGRON: You will no longer be able to see the ingredients clearly.
  - ScelteLente: DOGRON: Choices will now flow faster. 
  - SceltaIngrediente: DOGRON: You no longer have an ingredient of your choice to select at the startof the game.
  - PNGParliExtra: DOGRON: Enough with the extra chatter!
  - SaltaMorte: DOGRON: If you get the recipe wrong, you won't have any rescue plans.
  - EliminaConcorrente: DOGRON: You will no longer be able to eliminate another competitor.
  - RichiamaConcorrente: DOGRON: No power to recall a person who has left.
}
~ abilities -= ability

{ abilities has PNGParliExtra:
  DOGRON: I remind you dear person that you will be able to talk to one moreperson.
}

{ abilities has EliminaConcorrente and not eliminatrice:
    -> eliminatrice_choice ->
}

{ abilities has RichiamaConcorrente and not resuscitatrice:
    -> resuscitatrice_choice ->
}

->->

= eliminatrice_choice
    // TODO: visualizzare solo se ci sono almeno 2 persone vive
    DOGRON: You have a chance to get rid of one of these beautiful people, who doyou want to get rid of?
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
        DOGRON: Mimi, sashay away.
    + {alive_characters has Quello} YOU: That One
        ~ alive_characters -= Quello
        ~ eliminatrice = true
        ~ abilities -= EliminaConcorrente
        DOGRON: Oh. Oh. My friend, I hope you will forgive this competitor, but you mustleave. I will see you again in the endless meadow!
    + {alive_characters has ilDivo} YOU: Il Divo
        ~ alive_characters -= ilDivo
        ~ eliminatrice = true 
        ~ abilities -= EliminaConcorrente
        DOGRON: sorry, sort of. Goodbye, Divo!
    + YOU: No person!
        DOGRON: I like this way of reasoning!
    -
    ->->

= resuscitatrice_choice
    // TODO: visualizzare solo se c'è almeno una persona che è uscita
    DOGRON: You want to bring a competitor back among us?
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
        + { alive_characters hasnt UgoEMimi } YOU: Ugo & Mimi!
        ~ alive_characters += UgoEMimi
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: Mimi! How nice to have you here with us again!
        + { alive_characters hasnt Quello } YOU: That One.
        ~ alive_characters += Quello
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: Hello my friend, at last!
        + { alive_characters hasnt ilDivo } YOU: Il Divo.
        ~ alive_characters += ilDivo
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: Well, he's back!
        + YOU: MMM, I'm fine, thank you.
            DOGRON: Ah, uh, it seems cruuuuuel but that's the game, isn't it?
        -
    ->->
