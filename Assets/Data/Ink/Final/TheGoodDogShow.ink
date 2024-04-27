INCLUDE VariablesAndFunctions/Lounge.ink
INCLUDE VariablesAndFunctions/BuiltIn.ink
INCLUDE VariablesAndFunctions/IngredientsDatabase.ink
INCLUDE VariablesAndFunctions/Exception.ink
INCLUDE VariablesAndFunctions/Kitchen.ink
INCLUDE VariablesAndFunctions/Endings.ink
INCLUDE VariablesAndFunctions/DayStart.ink
INCLUDE VariablesAndFunctions/Abilities.ink
INCLUDE VariablesAndFunctions/Characters.ink
INCLUDE VariablesAndFunctions/Audio.ink
INCLUDE VariablesAndFunctions/NewModePlus.ink

INCLUDE 00StartingTest.ink
INCLUDE 01DayOne.ink
INCLUDE 02DayTwo.ink
INCLUDE 03DayThree.ink
INCLUDE 04DayFour.ink
INCLUDE 05DayFive.ink








VAR in_unity = false

{ not in_unity:
    ~ SEED_RANDOM(235)
}

{ is_new_mode_plus():
    @moveToDialogue character:{DOGRON}
    DOGRON: Prova prova. Prova prova.
    DOGRON: È acceso questo microfono?
    DOGRON: E dove sono i crocchini? Mi avevate promesso i crocchini se avessi fatto il bravo, uuuuuuuuuuffa!
    DOGRON: Ah, siamo già in diretta?
    DOGRON: Puuuuuuoi rimandare indietro il tempo?
    DOGRON: Uh, le lontrelline sono piuuuù affidabili, sai?
    DOGRON: Ricominciamo!
    DOGRON: Rieccoci a THE GOOD DOG SHOW!
    DOGRON: L'uuuuuunico reality che per la seconda stagione ti propone esattamente le stesse persone.
    DOGRON: Gli stessi drammi.
    DOGRON: Le stesse ricette.
    DOGRON: Ma con uuuuuuuuna grande novità: ora potrai parlare con tuuuuutte le persone senza limiti.
    DOGRON: Scoprire dove nascondono i loro giochi preferiti.
    DOGRON: O come scappare dal veterinario.
    DOGRON: E farmi ancora piuuuuuuuuuuuù grattini.
    DOGRON: Cominciamo?
}

// -> starting_test

~ dialogue_ingredients_of_the_day += Burro
~ dialogue_ingredients_of_the_day += Montare
~ abilities += SceltaIngrediente
-> day_one_kitchen