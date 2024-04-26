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
    DOGRON: Uh, avresti dovuto perdere, ma hai il bonus che ti permette di salvarti una volta ! Fortuuuna a te, sì sì!
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
DOGRON: {~ Il Gran Consiglio dei Carlini ha scoperto che copi le ricette da Benedetta Parodi|La Suprema Chihuahua ti ha morso il calcagno, ripetutamente. Morirai di rabbia|Bruiser Woods è entrato nel Gran Consiglio e ha fatto vincere Piiiietro}. THE GOOD DOG per te finisce qua.
-> END



== eliminazione_concorrente
~ temp da_eliminare = LIST_RANDOM(alive_characters)
DOGRON: Complimenti, hai vinto a scapito di: {da_eliminare}
~ alive_characters -= da_eliminare
->->



=== finale_cinque
DOGRON: Tu porti qui della cucina metafisica! Cosa è successo quando hai finito di cucinare? {~ Pazuzu in persona sale dagli Inferi per chiederti quale orrore tu abbia cucinato|Hai cancellato la gravità.|Si è aperto un buco nero in cabina di regia, ripartiamo il prima possibile}. Non so perché, ma sei imbattibile!
->->

=== finale_quattro
DOGRON: Non sono ancora sicuro che tu sappia cucinare. Com'è andata oggi? {~ In cucina va tutto bene. Fuori, l'universo è stato cancellato| Mi avvisano che il pianeta ha smesso di girare| Chi sono? Da dove vengo? Cosa c'era nel mio piatto? Qualcuno mi aiuti}. Hai superato la sfida di oggi!
->->

=== finale_tre
DOGRON: Vedo i tuoi sforzi, oggi, e che dire di ciò che hai cucinato? {~ Dal forno, lo sformato lancia grida strazianti.|La cosa che era nel mio piatto sta ballando con la cameraman.|Hai cucinato qualcosa che sa lanciarmi la palla!} Hai vinto questa sfida! A domani!
->->

=== finale_due
DOGRON: Rispetto a quello che hai cucinato... {~ Dalla padella arriva un odore di cianuro e acqua di mare|Perché c'è della plastica fusa nel mio piatto?|Dopo averlo mangiato, ho tossito e mi è caduto un polmone}. Ma complimenti: ci vediamo al prossimo episodio!
->->

== finale_uno
DOGRON: In merito alla tua ricetta: {~ quello che c'è nella padella non grida, non si muove, e non fa domande esistenziali|potrebbe essere passabile per un McDonald's|conosco degli studenti che forse potrebbero mangiarlo, forse}. Inaspettatamente passi alla prossima puntata!
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

_ Testi: Marco Spelgatti

_ Grafiche: _ Gabriele Perugini

_ Programmazione C\#: _ Mattia Belletti

_ Programmazione Ink: _ Marco Spelgatti, Mattia Belletti

_ Musiche: _ Alec Shea //#url:https:\/\/slaleky.itch.io/retro-and-electronic-music-pack

_ SFX: _ Chris Logdson //#url:https:\/\/chrislsound.itch.io/ambient-puzzle

_ Grazie per aver giocato con noi <3 _ (e fate un grattino al vostro _ DOGRON da parte nostra)

-> END

= secret
    DOGRON: Eccoti. L'ho capito, sai?
    DOGRON: Tuuuuuuuutto questo tempo.
    DOGRON: E sei sempre stata tuuuu, vero?
        + YOU: Non capisco cosa intendi.
        + YOU: Fossi stata qualcun altro sarebbe stato davvero strano.
        + YOU: Come l'hai capito?
        -
    DOGRON: Tutte quelle vite di Ermenegildo.
    DOGRON: E poi, è da quando è iniziato lo show che mi gratta sempre il nasino, e non capivo come mai.
    DOGRON: E sono allergico solo a una cosa.
    DOGRON: Ai gatti.
        + YOU: Miao!
        -
    DOGRON: Non c'è alcuuuun pianeta su cui tornare, vero?
        + YOU: Certo. Solo, senza umani.
        + YOU: Ora hai un pianeta pieno di possibilità!
        + YOU: Hai un universo intero, perché inseguire i bipedi senza pelo?
        -
    DOGRON: Quindi il Gran Consiglio dei Carlini mi ha sempre mentito?
        + YOU: Si fanno cose strane, per proteggere i più deboli.
        -
    DOGRON: Perché l'hai fatto? E perché sei tornata? Perché sei venuuuuuta nello show?
        + YOU: Può un semplice cane capire la mente di un gatto?
        + YOU: Una lunga storia, iniziata col sugo-gate, la Clerici e mio padre.
        + YOU: Beh, a volte quando subentra la noia si fanno cose strane.
        -
    YOU: Ma non prenderla sul personale. Qui hai un sacco di amici, i carlini, Bruiser Woods.
    YOU: Hai me.
    DOGRON: Dopo quello che hai fatto?
    YOU: Dopo secoli di regno nel mondo dei gatti, voglio provare a fare una cosa nuova, per una volta.
    YOU: Essere una brava miaaaaaaorsona.
        + YOU: Dogron: hai mai pensato di uuuuuululare fianco a fianco a un gatto?
        -
    DOGRON: E perché non fianco a fianco a un amico?
    DOGRON: Vuoi ricominciare tutto questo con me?
    
    ->->

= normal

    DOGRON: Uh, guarda che bella devastazione! Avresti mai pensato di vincere questo programma?
        + YOU: Ovvio, Sono l'unica persona che ha davvero cucinato.
        + YOU: Non stai per uccidermi, vero?
        + YOU: Ora posso andare a casa?
        -
    DOGRON: E ora, il premio!
    DOGRON: Sorpresa: non un ristorante su Mercuuuuuuurio, ma, ma, lo vuoi sentire?
        + YOU: Più prendi tempo, meno credo di volerlo sapere.
        + YOU: Si, si, si!
        + YOU: L'importante è tornare a casa, ti prego.
        -
    DOGRON: Sarai la prima persona!
        + YOU: A fare cosa?
        -
    DOGRON: A sostituire gli umani sul nostro pianeta.
    DOGRON: A prenderti cura della Suprema Chihuahua, dei Carlini e ovviamente di un labrador dolcissimo e bravissimo pat-pat!
        + YOU: E quale sarebbe questo labrador?
        -
    DOGRON: Non mi piacciono questi scherzi, no no.
        + YOU: Chi è un bravo cane? Chi?
        -
    DOGRON: Io sono un bravo cane, uuuuuuuuuun bravo cane!!!
        + YOU: E dove si trova la vostra casa?
        -
    DOGRON: Un pianeta molto semplice. Ci sono idranti, giardini, fiumi, un sacco di palline da tennis, cuccie, alberi della pizza e fontane di birra. Spero sia di tuo gradimento.
        + YOU: Alberi della pizza?
            DOGRON: Sì. Ti piace la pizza?
             + + YOU: Andiamo!
        + YOU: Fontane di birra?
            DOGRON: Purtroppo crescono così, anche se non vogliamo.
            + + YOU: Partiamo, subito!!!
        + YOU: Idranti?
            DOGRON: Sì! Piacciono anche a te? Non dirmi che sei un doggo!
            + + YOU: Macchè doggo! Il Culto è allergico all'acqua, non mi prenderanno mai!
        -
    DOGRON: E allora, si parte! La nostra missione qui è completa!
    DOGRON: Vai coi titoli di coda, Bruiser!
    
    ->->