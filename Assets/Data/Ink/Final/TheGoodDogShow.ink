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
    DOGRON: Ehm, coff, coff, woof woof.
    DOGRON: Sembra che abbiamo un problema con la navicella spaziale.
    DOGRON: E in attesa della partenza tuuuuuutti si sono mostrati così gentili da far ripartire da capo lo show.
    DOGRON: E da chiacchierare sempre con te.
    DOGRON: Metti caso che hai perso quuuuuuualcosa di importante.
    DOGRON: Nel mentre mi metto a cercare quuuuella cosa lì dei carlini.
    DOGRON: La puuuuuuuuuuuuuuuuuuuuleggia.
}

-> starting_test