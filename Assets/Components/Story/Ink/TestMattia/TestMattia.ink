INCLUDE VariablesAndFunctions/Lounge.ink
INCLUDE VariablesAndFunctions/BuiltIn.ink
INCLUDE VariablesAndFunctions/IngredientsDatabase.ink
INCLUDE VariablesAndFunctions/Exception.ink
INCLUDE VariablesAndFunctions/Kitchen.ink







// ~ dialogue_ingredients_of_the_day = (CollaDiPesce, Filtrare, Cipolla)
// ~ chosen_ingredient = Cipolla
// -> cucina_giorno_uno

-> finale_giorno_uno(3, 2)



=== test_abilities

~ moveToDialogue(DOGRON)
DOGRON: questa è la scelta delle abilità
YOU: bene, andiamo oltre
DOGRON: prima ti chiedo un numero.
* YOU: uno
* YOU: sessantadue
* YOU: tredici
-
DOGRON: buona scelta, avanti!

-> prima_giornata



=== prima_giornata

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



=== cucina_giorno_uno

-> kitchen_loop(3, (Uova, Farina, Saltare, Sciogliere, Lievitare, Sale), -> finale_giorno_uno)



=== finale_giorno_uno(strangeness, num_right_ingredients)

~ moveToEnding()

DOGRON: Finale del giorno uno, la strangeness è {strangeness}, e il numero di ingredienti giusti sono {num_right_ingredients}.
YOU: Fantastico! Vero?
DOGRON: Tu che ne dici?
+ YOU: È fantastico
+ YOU: Non male
+ YOU: Sono spacciato
-
DOGRON: Esatto!

-> END


=== seconda_giornata

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



// lista di tutte le abilità possibili, verrà popolata durante il primo dialogo
LIST abilities = EvidenziaIngredienti, ScelteLente, SceltaIngrediente, PNGParliExtra, SaltaMorte, EliminaConcorrente, RichiamaConcorrente
// lista dei personaggi in vita, all'inizio dovranno essere selezionati tutti
LIST alive_characters = (UgoEMimi), (BeBe), (Piiiietro), (Quello), (ilDivo)
LIST extra_characters = DOGRON

// viene impostata da unity alla fine della ricetta e ti dice se ce l'hai fatta o meno
VAR success = true

VAR Eliminatrice = false
VAR Resuscitatrice = false
VAR ScampataLaMorte = false




=== function remove_random_ability() ===

    ~ abilities = (EvidenziaIngredienti, ScelteLente, SceltaIngrediente, PNGParliExtra, SaltaMorte)
    
    ~ temp value = RANDOM(1, 8)
    ~ temp ability = abilities(value)
    ~ abilities -= ability
    
    Rimossa {ability}.
    
VAR tmp = 0

EXTERNAL moveToDialogue(character)
=== function moveToDialogue(character) ===
[[[move to dialogue with {character}]]]

EXTERNAL moveToKitchen()
=== function moveToKitchen() ===
[[[move to kitchen with {alive_characters}]]]

EXTERNAL hideKitchenText()
=== function hideKitchenText() ===
[[[hide the kitchen text]]]

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

EXTERNAL moveToEnding()
=== function moveToEnding() ===
[[[move to end]]]