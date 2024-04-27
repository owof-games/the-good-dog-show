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
    DOGRON: Testing. One two three.
    DOGRON: Is the microphone on?
    DOGRON: Where are the kibbles? You promised me kibbles if I was a good dog, uuuuuuugh!
    DOGRON: Ah, we are live already?
    DOGRON: Can youuuuuu turn back time?
    DOGRON: Uhm, otters are more reliable, youuuuuu know?
    DOGRON: Let’s start again!
    DOGRON: Welcome back to THE GOOD DOG SHOW!
    DOGRON: The only reality show that brings you a second season with exactly the same people as the first one.
    DOGRON: The very same drama.
    DOGRON: The very same recipes.
    DOGRON: But with one huuuuuuuge news: now you will be able to talk with all the people without limits!
    DOGRON: Discover where they keep their favourite toys
    DOGRON: Or how they run away from the veterinarian
    DOGRON: Or how to give me even more ear scratches.
    DOGRON: Do we begin?
}

-> starting_test

// ~ dialogue_ingredients_of_the_day += Burro
// ~ dialogue_ingredients_of_the_day += Montare
// ~ abilities += SceltaIngrediente
// -> day_one_kitchen
