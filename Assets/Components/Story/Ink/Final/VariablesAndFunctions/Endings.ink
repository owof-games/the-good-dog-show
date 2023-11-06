=== after_kitchen(strangeness, num_right_ingredients, -> next_day)

{ not in_unity:
    DEBUG: after_kitchen(strangeness={strangeness}, num_right_ingredients={num_right_ingredients})
}

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
DOGRON: In merito alla tua ricetta: {~ Quello che c'è nella padella non grida, non si muove, e non fa domande esistenziali|Potrebbe essere passabile per un McDonald's|Conosco degli studenti che forse potrebbero mangiarlo, forse}. Inaspettatamente passi alla prossima puntata!
->->



=== finale ===
DOGRON: Uh, guarda che bella devastazione! Avresti mai pensato di vincere questo programma?
    + YOU: Ovvio, son l'unica persona che ha davvero cucinato.
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

-> END