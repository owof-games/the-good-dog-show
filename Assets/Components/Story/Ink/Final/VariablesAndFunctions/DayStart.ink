/*
DAY START

Management of the dialogues at the beginning of the day, before the lounge.
*/

VAR day = 0

=== inizio_lounge ===

~ day++

~ playBackgroundMusic("chill")

@moveToDialogue character:{DOGRON}

DOGRON: {E ora, un benvenuuuuto a tuuuutte le persone concorrenti e a chi ci segue da casa!|Eccoci nuovamente, concorrenti e spettatrici!|Buonasera a tuuuuutte le persone belle di questo pianeta e oltre!|Qualcuuuuuna ha visto il mio collare preferito?|L'ultima sera amiche, l'uuuultima sera assieme!}
DOGRON: {Concorrenti, ricordatevi che ogni giorno perderete una delle vostre abilità.  Persona uuuuumana qui davanti a me! Tu oggi perderai, rullo di tamburi...| Quuuuale abilità toglieremo oggi alla nostra persona umana?!?|Sempre meno gente, sempre meno abilità attive!|Uuuuh, mi fa male il pancino oggi.|Me doggo grande, non piange, no no, auuuuu!}

~ temp ability = LIST_RANDOM(abilities)
{ ability:
  - EvidenziaIngredienti: DOGRON: Non potrai più vedere in modo chiaro gli ingredienti.
  - ScelteLente: DOGRON: Le scelte ora scorreranno più veloci. 
  - SceltaIngrediente: DOGRON: Non avrai più un ingrediente a scelta da selezionare a inizio partita.
  - PNGParliExtra: DOGRON: Basta con le chiacchiere extra!
  - SaltaMorte: DOGRON: Se sbagli la ricetta, non avrai più piani di salvataggio.
  - EliminaConcorrente: DOGRON: Non potrai più eliminare un'altra persona concorrente.
  - RichiamaConcorrente: DOGRON: Niente potere di richiamare una persona che se ne è andata.
}
~ abilities -= ability

{ abilities has PNGParliExtra:
  DOGRON: Ti ricordo cara persona che potrai parlare con una persona in più.
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
    DOGRON: Hai la possibilità di eliminare una di queste belle persone, di chi ti vuoi liberare?
    + {alive_characters has BeBe} YOU:BeBe
        ~ alive_characters -= BeBe
        DOGRON: Bebe, per te Miss Italia finisce qui!
        ~ eliminatrice = true
        ~ abilities -= EliminaConcorrente
    + {alive_characters has Piiiietro} YOU:Piiiietro
        ~ alive_characters -= Piiiietro
        ~ eliminatrice = true
        ~ abilities -= EliminaConcorrente
        DOGRON: Piiiietro, il mio numero preferito: sei stato eliminato!
    + {alive_characters has UgoEMimi} YOU:Ugo e Mimi
        ~ alive_characters -= UgoEMimi
        ~ eliminatrice = true
        ~ abilities -= EliminaConcorrente
        DOGRON: Mimi, sashay away.
    + {alive_characters has Quello} YOU:Quello
        ~ alive_characters -= Quello
        ~ eliminatrice = true
        ~ abilities -= EliminaConcorrente
        DOGRON: Oh. Oh. Amico mio, spero perdonerai questa persona concorrente, ma dovrai andartene. Ci rivedremo nel prato infinito!
    + {alive_characters has ilDivo} YOU:Il divo
        ~ alive_characters -= ilDivo
        ~ eliminatrice = true 
        ~ abilities -= EliminaConcorrente
        DOGRON: spiace, circa. Addio Divo!
    + YOU: Nessuna persona!
        DOGRON: Mi piace questo modo di ragionare!
    -
    ->->

= resuscitatrice_choice
    // TODO: visualizzare solo se c'è almeno una persona che è uscita
    DOGRON: Vuoi riportare una persona concorrente tra noi?
        + { alive_characters hasnt BeBe } YOU:BeBe!
        ~ alive_characters += BeBe
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON:Bentornata BeBe!
        + { alive_characters hasnt Piiiietro } YOU:Piiiietro!
        ~ alive_characters += Piiiietro
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: Ed ecco a voi di nuovo: Piiiietro!
        + { alive_characters hasnt UgoEMimi } YOU: Ugo e Mimi!
        ~ alive_characters += UgoEMimi
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: Mimììì! Che bello averti qui con noi di nuovo!
        + { alive_characters hasnt Quello } YOU: Quello
        ~ alive_characters += Quello
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: Ma ciao amico mio, finalmente!
        + { alive_characters hasnt ilDivo } YOU: Il Divo
        ~ alive_characters += ilDivo
        ~ resuscitatrice = true
        ~ abilities -= RichiamaConcorrente
        DOGRON: Toh, è tornato!
        + YOU: MMM, sto bene così, grazie.
            DOGRON: Ah, uuuuh, mi sembra crudele ma il gioco è questo, no?
        -
    ->->