INCLUDE VariablesAndFunctions/Lounge.ink
INCLUDE VariablesAndFunctions/BuiltIn.ink
INCLUDE VariablesAndFunctions/IngredientsDatabase.ink
INCLUDE VariablesAndFunctions/Exception.ink
INCLUDE VariablesAndFunctions/Kitchen.ink
INCLUDE VariablesAndFunctions/Endings.ink
INCLUDE VariablesAndFunctions/DayStart.ink
INCLUDE VariablesAndFunctions/Abilities.ink
INCLUDE VariablesAndFunctions/Audio.ink
INCLUDE VariablesAndFunctions/Characters.ink
INCLUDE VariablesAndFunctions/NewModePlus.ink







// -> test_dogron_va_via

// -> test_bug_finale_speciale

// -> too_many_choices

// -> test_abilities

// -> prima_giornata

// ~ dialogue_ingredients_of_the_day = (CollaDiPesce, Filtrare, Cipolla)
// ~ chosen_ingredient = InvalidIngredient
// -> cucina_giorno_uno

// -> finale_giorno_uno(3, 2)

// -> test_transitions

// -> test_variants

// -> test_enter

// -> test_counter

-> test_credits

// -> bug_eliminazione

// -> prima_giornata_nmp

// -> test_choice_with_column

// -> test_set_new_mode_plus




== test_dogron_va_via

    @moveToEnding
    DOGRON: Ma, ma! Abbiamo una sorpresa per te. Credo. Uuuuuuuuna sorpresa uuuuuuuunica, come te.
    DOGRON: Uuuuuna lettera!
    
    + YOU: Perché hai finito le "u"?
    + YOU: Chissà se è Adramelech, mi deve ancora un aspic.
    + YOU: Sarà da parte dei miei padri, minimo.[] Tipo: "Te lo sei portato il maglioncino di lana?" o "Non di capra ma di pecora il sangue, che poi Caacrinolaas si mette ad abbaiare!"
    
    -
    
    DOGRON: No, dice che è Ermenegildo. E sento odore di indizi!
    DOGRON: "Ehi tu. Sì, tu che mi hai lasciato tramortito sul Trenino di Nonno Pig. Che hai mangiato le mie ditina preferite. Che mi hai seppellito in una cover di Kate Bush! So dove sei!"
    ~ dialogue_ingredients_of_the_day += KateBush
    DOGRON: Uuuu, sembra arrabbiatino, non trovi?
    
    + YOU: Naa, fa così ogni volta che lo uccido.
    + YOU: Devi sentirlo quando insultano Taylor Swift. Lì sì che sbrocca.
    + YOU: Non so se hai parlato con BeBe: quella è rabbia!
    
    -
    
    DOGRON: Continuo con la lettura che è avvincente, sembra quell'episodio di "Corgi Fuori"! O era "Shih Tzu and the City"?
    DOGRON: "So dove sei, ma anche sette e otto. Lol, sai che sono più divertente di tuo padre. Di quello coi tentacoli, intendo. L'altro è imbattibile. Ti ricordi di quella volta in cui per scherzo rivoltò all'esterno gli organi di tutti i fascisti? Che ridere!"
    ~ dialogue_ingredients_of_the_day += Padre
    
    + YOU: Fu una mia idea, uffi. Che balle avere un padre famoso!
    + YOU: Mi sa che era il finale di stagione di "Questo mondo non mi renderà Shiba Inu".
    + YOU: Tornò di moda anche l'intestino alla piazzale Loreto! Che spasso quei giorni!
    
    -
    
    DOGRON: "O quella volta in cui decise di teletrasportare tutti gli umani dal pianeta dei cani al pianeta dei gatti, solo perché un cagnaccio gli rubò il suo giocattolo preferito!"
    ~ dialogue_ingredients_of_the_day += GiocattoloPreferito
    DOGRON: "E poi se ne è pure dimenticato, e ora i gatti sono ufficialmente divinità intergalattiche e stanno conquistando l'universo. O, come va chiamato ora: "La grande mensola". Lollone."
    DOGRON: In che senso, umani sul pianeta dei gatti? Portati via dal, dal, dal nooooooooooooostro pianeta?!?
    
    + YOU: No no sicuro non il tuo. L'universo è pieno di pianeti governati da carlini. Pieno.
    + YOU: Diciamo che se tuo padre è furry e un cane gli ruba la palla preferita...
    + YOU: Si tratta di un buffo equivoco, Dogron. Uno scherzo tra amici, no?
    
    -
    
    DOGRON: Credo anzi, è, è il caso che vada a parlare col gran consiglio dei caaaarlini. Tieniti la lettera.

    @otherCharacterLeaves
    
    YOU: Uhm...
    + [YOU: Leggi a voce alta.]
    
    -
    
    YOU: "E insomma. Sono resuscitato, mi sono lavato i denti e ho rigirato al contrario le mutande che quindi è come se le avessi lavate. Ora me lo dai quell'appuntamento?"
    YOU: "Sarà la sesta volta che te lo chiedo, e ogni volta inventi delle scuse per non venire. Come quando mi hai detto: "Non ti voglio vedere, Caacrinolaas cane!" o l'ultima volta quando hai urlato: "Ma mannaggia l'aereo tossico di Taylor, la vuoi capire che mi fai schifo?!?"
    YOU: "Io non li so leggere tutti questi segnali contrastanti che mi dai."
    YOU: "Per questo ti aspetto sul pianetino qui a fianco, con una bottiglia di Tavernello e l'ultimo gioco di (nome coperto per evitare denunce da parte di un creator di videogiochi italiano che non paga chi lavora)."
    YOU: "Tuo, Ermenegildo."
    
    + YOU: Spedisci BeBe a uccidere Ermenegildo, di nuovo.
    + YOU: Chiedi ai carlini di far esplodere il pianetino.
    + YOU: Fai assumere Ermenegildo da (nome coperto per evitare denunce da parte di un creator di videogiochi italiano che non paga chi lavora).
    
    -

-> kitchen_loop(5, (Coccolare, Carezzare, Pettare, Grattare, DormireAssieme, Protezione, NoGatti), -> finale, 0)

-> DONE




== test_bug_finale_speciale

@moveToEnding

DOGRON: True ending!

-> lounge_loop(-> bebe_choice, -> ugoemimi_choice, -> piiiietro_choice, -> quello_choice, -> ildivo_choice, -> cucina_test)


-> END

    = ugoemimi_choice
    UgoEMimi: <b>ciao</b>, come va?
    YOU: ciao
    ->->

    = bebe_choice
    BeBe: ciao
    YOU: ciao
    ->->

    = piiiietro_choice
    Piiiietro: ciao, ho aiutato mimi a far fuori ugo
    YOU: ciao
    ~ character_variants += MIMI
    ->->


    = quello_choice
    Quello: ciao, ho fatto incazzare bebe
    YOU: ciao
    ~ character_variants += BeBenator
    ->->


    = ildivo_choice
    ilDivo: ciao
    YOU: ciao
    ->->
    
    = cucina_test
    
    @moveToEnding
    
    DOGRON: Fine!
    
    -> END



=== test_choice_with_column

@moveToEnding

DOGRON: Eccoci

+ YOU: scelta 1
+ YOU: scelta 2: the true choice
-

-> END

=== test_set_new_mode_plus

@moveToEnding
{ is_new_mode_plus():
DOGRON: siamo già in new mode plus.
- else:
DOGRON: setto il new mode plus.
~ setNewModePlus(true)
}

-> END



=== prima_giornata_nmp

-> inizio_lounge ->

-> lounge_loop_with_letter(-> bebe_choice, -> ugoemimi_choice, -> piiiietro_choice, -> quello_choice, -> ildivo_choice, -> cucina_giorno_uno_nmp, -> letter)


    = ugoemimi_choice
    UgoEMimi: <b>ciao</b>, come va?
    YOU: ciao
    ->->

    = bebe_choice
    BeBe: ciao
    YOU: ciao
    ->->

    = piiiietro_choice
    Piiiietro: ciao
    YOU: ciao
    ->->


    = quello_choice
    Quello: ciao
    YOU: ciao
    ->->


    = ildivo_choice
    ilDivo: ciao
    YOU: ciao
    ->->
    
    
    = letter
    @moveToEnding
    DOGRON: leggerò la lettera!
    ->->



=== cucina_giorno_uno_nmp

~ dialogue_ingredients_of_the_day = (CollaDiPesce, Filtrare, Cipolla)

-> kitchen_loop(3, (Uova, Farina, Saltare, Sciogliere, Lievitare, Sale), -> seconda_giornata_inizio_nmp, 0)



=== seconda_giornata_inizio_nmp

@moveToDialogue character:{DOGRON}

DOGRON: Finale del giorno uno!
YOU: Fantastico! Vero?
DOGRON: Tu che ne dici?
+ YOU: È fantastico
+ YOU: Non male
+ YOU: Sono spacciato
-
DOGRON: Esatto!

-> seconda_giornata_lounge_nmp


=== seconda_giornata_lounge_nmp

-> lounge_loop(-> bebe_choice, -> ugoemimi_choice, -> piiiietro_choice, -> quello_choice, -> ildivo_choice, -> cucina_giorno_uno_nmp)


    = ugoemimi_choice
    UgoEMimi: ciao
    YOU: ciao
    ->->

    = bebe_choice
    BeBe: ciao
    YOU: ciao
    ->->

    = piiiietro_choice
    Piiiietro: ciao
    YOU: ciao
    ->->


    = quello_choice
    Quello: ciao
    YOU: ciao
    ->->


    = ildivo_choice
    ilDivo: ciao
    YOU: ciao
    ->->





=== bug_eliminazione

@moveToEnding

DOGRON: questo sarebbe il test iniziale.

~ abilities = (EliminaConcorrente)

-> inizio_lounge ->

@moveToDialogue character:{DOGRON}

DOGRON: ora c'è il dialogo di inizio giornata.

-> lounge_loop(-> bebe_choice, -> ugoemimi_choice, -> piiiietro_choice, -> quello_choice, -> ildivo_choice, -> cucina_test)

-> END

    = ugoemimi_choice
    UgoEMimi: <b>ciao</b>, come va?
    YOU: ciao
    ->->

    = bebe_choice
    BeBe: ciao
    YOU: ciao
    ->->

    = piiiietro_choice
    Piiiietro: ciao
    YOU: ciao
    ->->


    = quello_choice
    Quello: ciao
    YOU: ciao
    ->->


    = ildivo_choice
    ilDivo: ciao
    YOU: ciao
    ->->
    
    = cucina_test
    
    -> END

=== test_credits

@moveToEnding

DOGRON: E allora, si parte! La nostra missione qui è completa!
DOGRON: Vai coi titoli di coda, Bruiser!

~ playBackgroundMusic("credits")

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

=== test_counter

@moveToDialogue character:{DOGRON}

DOGRON: Non sentite un po' la tristezza? Già {nonAliveCharacters()}, e a me non va di farvi andare via, nuuuuuuuuuuuu!

-> END


=== test_enter

@moveToDialogue character:{Piiiietro}

Piiiietro: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

YOU: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase.

Piiiietro: molto breve.

YOU: molto breve.

Piiiietro: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

YOU: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

Piiiietro: molto breve.

YOU: molto breve.

Piiiietro: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

YOU: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

Piiiietro: molto breve.

YOU: molto breve.

Piiiietro: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

YOU: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

Piiiietro: molto breve.

YOU: molto breve.

Piiiietro: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

YOU: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

Piiiietro: molto breve.

YOU: molto breve.

Piiiietro: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

YOU: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

Piiiietro: molto breve.

YOU: molto breve.

Piiiietro: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

YOU: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

Piiiietro: molto breve.

YOU: molto breve.

Piiiietro: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

YOU: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

Piiiietro: molto breve.

YOU: molto breve.

Piiiietro: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

YOU: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

Piiiietro: molto breve.

YOU: molto breve.

Piiiietro: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

YOU: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

Piiiietro: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

YOU: Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. Questa è una lunga frase. 

-> END


=== test_variants

@moveToEnding

DOGRON: altre cose
YOU: benissimo

-> lounge_loop(-> bebe_choice, -> ugoemimi_choice, -> piiiietro_choice, -> quello_choice, -> ildivo_choice, -> cucina_test)


-> END

    = ugoemimi_choice
    UgoEMimi: <b>ciao</b>, come va?
    YOU: ciao
    ->->

    = bebe_choice
    BeBe: ciao
    YOU: ciao
    ->->

    = piiiietro_choice
    Piiiietro: ciao, ho aiutato mimi a far fuori ugo
    YOU: ciao
    ~ character_variants += MIMI
    ->->


    = quello_choice
    Quello: ciao, ho fatto incazzare bebe
    YOU: ciao
    ~ character_variants += BeBenator
    ->->


    = ildivo_choice
    ilDivo: ciao
    YOU: ciao
    ->->
    
    = cucina_test
    
    -> END

=== test_transitions

@moveToEnding

DOGRON: scena del test

~ day++

@moveToDialogue character:DOGRON

DOGRON: introduzione inizio prima giornata

@moveToLounge
    + [BeBe]
        @moveToDialogue character:{BeBe}
        BeBe: ciao, andiamo in cucina
-

~ playBackgroundMusic("action")
@moveToKitchen

~ temp lst = (Grande,BarattoloDelloYogurt,IVeriVideogiochi,GiocattoloPreferito,ChinottoDiSavona,CollareConEtichetta,TonnoAlNaturale,IoMeStessoMedesimo,Aiutoooooo)

-> kitchen(lst)

= kitchen(lst)

Testo a sinistra

@playKitchenGame ingredients:{Grande},{BarattoloDelloYogurt},{IVeriVideogiochi},{GiocattoloPreferito},{ChinottoDiSavona},{CollareConEtichetta},{TonnoAlNaturale},{IoMeStessoMedesimo},{Aiutoooooo}

{ not in_unity:
    -> debugChooseIngredient(lst) ->
}

~ lst -= chosen_ingredient

@ingredientFeedback success:true

// -> kitchen(lst)

~ playBackgroundMusic("chill")
@moveToEnding

GODRON: finale della giornata

~ day++

@moveToDialogue character:DOGRON

DOGRON: dico cose vedo gente

// DOGRON: introduzione inizio seconda giornata

@moveToLounge
    + [BeBe]
        @moveToDialogue character:{BeBe}
        BeBe: ciao, andiamo in cucina
-

~ playBackgroundMusic("action")
@moveToKitchen

Testo a sinistra

@playKitchenGame ingredients:{Uova},{Formaggio},{Farina},{GiocattoloPreferito},{Veterinario}
@ingredientFeedback success:true

// ~ playBackgroundMusic("chill")
// @moveToEnding

// GODRON: finale della giornata

-> DONE



=== too_many_choices

@moveToEnding

// DOGRON: una scelta
// + YOU: Scelta 1
// -

// DOGRON: due scelte
// + YOU: Scelta 1
// + YOU: Scelta 2
// -

// DOGRON: tre scelte
// + YOU: Scelta 1
// + YOU: Scelta 2
// + YOU: Scelta 3
// -

DOGRON: quattro scelte
+ YOU: Scelta 1
+ YOU: Scelta 2
+ YOU: Scelta 3
+ YOU: Scelta 4
-

DOGRON: cinque scelte
+ YOU: Scelta 1
+ YOU: Scelta 2
+ YOU: Scelta 3
+ YOU: Scelta 4
+ YOU: Scelta 5
-

DOGRON: sei scelte
+ YOU: Scelta 1
+ YOU: Scelta 2
+ YOU: Scelta 3
+ YOU: Scelta 4
+ YOU: Scelta 5
+ YOU: Scelta 6
-

-> DONE


=== test_abilities

@moveToEnding

DOGRON: questa è la scelta delle abilità
YOU: bene, andiamo oltre
DOGRON: prima ti chiedo un numero.
* YOU: uno
* YOU: sessantadue
* YOU: tredici
-
DOGRON: buona scelta, avanti!

~ day += 1

@moveToDialogue character:DOGRON

DOGRON: Eccoci alla prima parte della giornata!

@moveToDialogue character:DOGRON

DOGRON: transizione, di nuovo!

-> prima_giornata



=== prima_giornata

-> inizio_lounge ->

~ dialogue_ingredients_of_the_day = (CollaDiPesce, Filtrare, Cipolla)

-> lounge_loop_with_letter(-> bebe_choice, -> ugoemimi_choice, -> piiiietro_choice, -> quello_choice, -> ildivo_choice, -> cucina_giorno_uno, -> letter)


    = ugoemimi_choice
    UgoEMimi: <b>ciao</b>, come va?
    YOU: ciao
    ->->

    = bebe_choice
    BeBe: ciao
    YOU: ciao
    ->->

    = piiiietro_choice
    Piiiietro: ciao
    YOU: ciao
    ->->


    = quello_choice
    Quello: ciao
    YOU: ciao
    ->->


    = ildivo_choice
    ilDivo: ciao
    YOU: ciao
    ->->
    
    
    = letter
    @moveToEnding
    DOGRON: leggerò la lettera!
    ->->



=== cucina_giorno_uno

-> kitchen_loop(3, (Uova, Farina, Saltare, Sciogliere, Lievitare, Sale), -> seconda_giornata_inizio, 0)



=== seconda_giornata_inizio

@moveToDialogue character:{DOGRON}

DOGRON: Finale del giorno uno!
YOU: Fantastico! Vero?
DOGRON: Tu che ne dici?
+ YOU: È fantastico
+ YOU: Non male
+ YOU: Sono spacciato
-
DOGRON: Esatto!

-> seconda_giornata_lounge


=== seconda_giornata_lounge

-> lounge_loop(-> bebe_choice, -> ugoemimi_choice, -> piiiietro_choice, -> quello_choice, -> ildivo_choice, -> cucina_giorno_uno)


    = ugoemimi_choice
    UgoEMimi: ciao
    YOU: ciao
    ->->

    = bebe_choice
    BeBe: ciao
    YOU: ciao
    ->->

    = piiiietro_choice
    Piiiietro: ciao
    YOU: ciao
    ->->


    = quello_choice
    Quello: ciao
    YOU: ciao
    ->->


    = ildivo_choice
    ilDivo: ciao
    YOU: ciao
    ->->



// viene impostata da unity alla fine della ricetta e ti dice se ce l'hai fatta o meno
VAR success = true

VAR Eliminatrice = false
VAR Resuscitatrice = false




=== function remove_random_ability() ===

    ~ abilities = (EvidenziaIngredienti, ScelteLente, SceltaIngrediente, PNGParliExtra, SaltaMorte)
    
    ~ temp value = RANDOM(1, 8)
    ~ temp ability = abilities(value)
    ~ abilities -= ability
    
    Rimossa {ability}.
    
VAR tmp = 0

=== debugChooseIngredient(ingredients)
DEBUG - scegli l'ingrediente:
+ {ingredients has Uova} Uova
  ~ chosen_ingredient = Uova
+ {ingredients has Pentola} Pentola
  ~ chosen_ingredient = Pentola
+ {ingredients has NoceMoscata} NoceMoscata
  ~ chosen_ingredient = NoceMoscata
+ {ingredients has Farina} Farina
  ~ chosen_ingredient = Farina
+ {ingredients has Saltare} Saltare
  ~ chosen_ingredient = Saltare
+ {ingredients has Sciogliere} Sciogliere
  ~ chosen_ingredient = Sciogliere
+ {ingredients has Lievitare} Lievitare
  ~ chosen_ingredient = Lievitare
+ {ingredients has Sale} Sale
  ~ chosen_ingredient = Sale
+ {ingredients has Cipolla} Cipolla
  ~ chosen_ingredient = Cipolla
+ {ingredients has Affettare} Affettare
  ~ chosen_ingredient = Affettare
+ {ingredients has TonnoInScatola} TonnoInScatola
  ~ chosen_ingredient = TonnoInScatola
+ {ingredients has Mescolare} Mescolare
  ~ chosen_ingredient = Mescolare
+ {ingredients has Burro} Burro
  ~ chosen_ingredient = Burro
+ {ingredients has Montare} Montare
  ~ chosen_ingredient = Montare
+ {ingredients has Zafferano} Zafferano
  ~ chosen_ingredient = Zafferano
+ {ingredients has Mantecare} Mantecare
  ~ chosen_ingredient = Mantecare
+ {ingredients has Braciola} Braciola
  ~ chosen_ingredient = Braciola
+ {ingredients has Arrosticino} Arrosticino
  ~ chosen_ingredient = Arrosticino
+ {ingredients has Costina} Costina
  ~ chosen_ingredient = Costina
+ {ingredients has Osso} Osso
  ~ chosen_ingredient = Osso
+ {ingredients has Grigliare} Grigliare
  ~ chosen_ingredient = Grigliare
+ {ingredients has Crocchette} Crocchette
  ~ chosen_ingredient = Crocchette
+ {ingredients has Versare} Versare
  ~ chosen_ingredient = Versare
+ {ingredients has Riempire} Riempire
  ~ chosen_ingredient = Riempire
+ {ingredients has Formaggio} Formaggio
  ~ chosen_ingredient = Formaggio
+ {ingredients has Fondere} Fondere
  ~ chosen_ingredient = Fondere
+ {ingredients has Coccole} Coccole
  ~ chosen_ingredient = Coccole
+ {ingredients has Brandina} Brandina
  ~ chosen_ingredient = Brandina
+ {ingredients has Cuccia} Cuccia
  ~ chosen_ingredient = Cuccia
+ {ingredients has Sgranocchiare} Sgranocchiare
  ~ chosen_ingredient = Sgranocchiare
+ {ingredients has Fidarsi} Fidarsi
  ~ chosen_ingredient = Fidarsi
+ {ingredients has BarattoloDelloYogurt} BarattoloDelloYogurt
  ~ chosen_ingredient = BarattoloDelloYogurt
+ {ingredients has Pettorina} Pettorina
  ~ chosen_ingredient = Pettorina
+ {ingredients has Trasportino} Trasportino
  ~ chosen_ingredient = Trasportino
+ {ingredients has Veterinario} Veterinario
  ~ chosen_ingredient = Veterinario
+ {ingredients has Automobile} Automobile
  ~ chosen_ingredient = Automobile
+ {ingredients has Viaggiare} Viaggiare
  ~ chosen_ingredient = Viaggiare
+ {ingredients has Inconscio} Inconscio
  ~ chosen_ingredient = Inconscio
+ {ingredients has CorrereNeiSogni} CorrereNeiSogni
  ~ chosen_ingredient = CorrereNeiSogni
+ {ingredients has Coccolare} Coccolare
  ~ chosen_ingredient = Coccolare
+ {ingredients has Carezzare} Carezzare
  ~ chosen_ingredient = Carezzare
+ {ingredients has Pettare} Pettare
  ~ chosen_ingredient = Pettare
+ {ingredients has Grattare} Grattare
  ~ chosen_ingredient = Grattare
+ {ingredients has DormireAssieme} DormireAssieme
  ~ chosen_ingredient = DormireAssieme
+ {ingredients has Protezione} Protezione
  ~ chosen_ingredient = Protezione
+ {ingredients has NoGatti} NoGatti
  ~ chosen_ingredient = NoGatti
+ {ingredients has VolAuVent} VolAuVent
  ~ chosen_ingredient = VolAuVent
+ {ingredients has Skyrim} Skyrim
  ~ chosen_ingredient = Skyrim
+ {ingredients has BlocchiDiErba} BlocchiDiErba
  ~ chosen_ingredient = BlocchiDiErba
+ {ingredients has UovaDiPecora} UovaDiPecora
  ~ chosen_ingredient = UovaDiPecora
+ {ingredients has Scolare} Scolare
  ~ chosen_ingredient = Scolare
+ {ingredients has Lacrime} Lacrime
  ~ chosen_ingredient = Lacrime
+ {ingredients has CacaoAmaro} CacaoAmaro
  ~ chosen_ingredient = CacaoAmaro
+ {ingredients has Specchiarsi} Specchiarsi
  ~ chosen_ingredient = Specchiarsi
+ {ingredients has Scottare} Scottare
  ~ chosen_ingredient = Scottare
+ {ingredients has IVeriVideogiochi} IVeriVideogiochi
  ~ chosen_ingredient = IVeriVideogiochi
+ {ingredients has Canapé} Canapé
  ~ chosen_ingredient = Canapé
+ {ingredients has Mungere} Mungere
  ~ chosen_ingredient = Mungere
+ {ingredients has Cardare} Cardare
  ~ chosen_ingredient = Cardare
+ {ingredients has ChinottoDiSavona} ChinottoDiSavona
  ~ chosen_ingredient = ChinottoDiSavona
+ {ingredients has Raccontare} Raccontare
  ~ chosen_ingredient = Raccontare
+ {ingredients has Selfie} Selfie
  ~ chosen_ingredient = Selfie
+ {ingredients has Interviste} Interviste
  ~ chosen_ingredient = Interviste
+ {ingredients has Avvelenare} Avvelenare
  ~ chosen_ingredient = Avvelenare
+ {ingredients has CollareConEtichetta} CollareConEtichetta
  ~ chosen_ingredient = CollareConEtichetta
+ {ingredients has TonnoAlNaturale} TonnoAlNaturale
  ~ chosen_ingredient = TonnoAlNaturale
+ {ingredients has Cantare} Cantare
  ~ chosen_ingredient = Cantare
+ {ingredients has Perdonare} Perdonare
  ~ chosen_ingredient = Perdonare
+ {ingredients has Evolversi} Evolversi
  ~ chosen_ingredient = Evolversi
+ {ingredients has IoMeStessoMedesimo} IoMeStessoMedesimo
  ~ chosen_ingredient = IoMeStessoMedesimo
+ {ingredients has SelfCare} SelfCare
  ~ chosen_ingredient = SelfCare
+ {ingredients has Sventrare} Sventrare
  ~ chosen_ingredient = Sventrare
+ {ingredients has Emancipazione} Emancipazione
  ~ chosen_ingredient = Emancipazione
+ {ingredients has MichelaMurgia} MichelaMurgia
  ~ chosen_ingredient = MichelaMurgia
+ {ingredients has Sacrificio} Sacrificio
  ~ chosen_ingredient = Sacrificio
+ {ingredients has PeanutButter} PeanutButter
  ~ chosen_ingredient = PeanutButter
+ {ingredients has GiocattoloPreferito} GiocattoloPreferito
  ~ chosen_ingredient = GiocattoloPreferito
+ {ingredients has KateBush} KateBush
  ~ chosen_ingredient = KateBush
+ {ingredients has IdeaDiSuccesso} IdeaDiSuccesso
  ~ chosen_ingredient = IdeaDiSuccesso
+ {ingredients has CassaPortatile} CassaPortatile
  ~ chosen_ingredient = CassaPortatile
+ {ingredients has Padre} Padre
  ~ chosen_ingredient = Padre
+ {ingredients has Funghicida} Funghicida
  ~ chosen_ingredient = Funghicida
+ {ingredients has Mappa} Mappa
  ~ chosen_ingredient = Mappa
+ {ingredients has Grande} Grande
  ~ chosen_ingredient = Grande
+ {ingredients has Aiuto} Aiuto
  ~ chosen_ingredient = Aiuto
+ {ingredients has Aiutoooooo} Aiutoooooo
  ~ chosen_ingredient = Aiutoooooo
+ {ingredients has CollaDiPesce} CollaDiPesce
  ~ chosen_ingredient = CollaDiPesce
+ {ingredients has Filtrare} Filtrare
  ~ chosen_ingredient = Filtrare
+ {ingredients has Mazinga} Mazinga
  ~ chosen_ingredient = Mazinga
+ {ingredients has OrecchieUgo} OrecchieUgo
  ~ chosen_ingredient = OrecchieUgo
-
->->

VAR in_unity = false