/* ---------------------------------

   VARIABLES AND CONSTANTS

 ----------------------------------*/


// variabile che tiene gli ingredienti che appaiono nella roulette russa per il giorno che stiamo giocando
VAR dialogue_ingredients_of_the_day = ()
// chosen ingredient; this is set by Unity in @playKitchenGame
VAR chosen_ingredient = InvalidIngredient
CONST normal_speed = 1.3
CONST slow_speed = 1.0



/* ---------------------------------

   EXTERNAL FUNCTIONS

 ----------------------------------*/


EXTERNAL setIngredientsSpeed(speed)
=== function setIngredientsSpeed(speed)
[[[ set ingredients speed to {speed} ]]]

EXTERNAL moveToKitchen()
=== function moveToKitchen() ===
[[[move to kitchen with {alive_characters}]]]

EXTERNAL hideKitchenText()
=== function hideKitchenText() ===
[[[hide the kitchen text]]]



/* ---------------------------------

   KNOTS

 ----------------------------------*/


=== kitchen_loop(num_ingredients, base_ingredients_of_the_day, -> ending)

// move to the kitchen scene
~ moveToKitchen()

// set the statistics of the ingredients to zero
~ temp strangeness = 0
~ temp num_right_ingredients = 0

// loop counter (from 0 to num_ingredients)
~ temp num_loop = 0

// flags that track whether we displayed or not certain phrases
~ temp displayed_choose_ingredient = false
~ temp displayed_explanation = false

// setup speed according to abilities
{ abilities has ScelteLente:
    ~ setIngredientsSpeed(slow_speed)
- else:
    ~ setIngredientsSpeed(normal_speed)
}

- (loop)

// check whether we should break the loop and go to the ending
~ num_loop += 1
{ num_loop > num_ingredients:
    ~ dialogue_ingredients_of_the_day = ()
    -> ending(strangeness, num_right_ingredients)
}

// variable to track whether to only show correct ingredients in the list
~ temp show_only_correct_ingredients = false

{
    - not displayed_choose_ingredient and abilities has SceltaIngrediente:
        Hai fortuna, puoi scegliere un ingrediente giusto prima di iniziare!
        ~ displayed_choose_ingredient = true
        ~ show_only_correct_ingredients = true
    - not displayed_explanation:
        Scegli ingredienti e azioni sulla base di quello che ti è stato raccontato... e fai in fretta!
        ~ displayed_explanation = true
    - else:
        ~ hideKitchenText()
}

// choose which ingredients to show
~ temp all_ingredients = dialogue_ingredients_of_the_day
{ not show_only_correct_ingredients:
    ~ all_ingredients += base_ingredients_of_the_day
}

// play a minigame round
@playKitchenGame ingredients:{get_list_with_commas(all_ingredients)}

{ not in_unity:
    -> debugChooseIngredient(all_ingredients) ->
}

// add the strangeness of the chosen ingredient
{ getIngredientData(chosen_ingredient, Strangeness):
- 1:
  ~ strangeness += 1
- 2:
  ~ strangeness += 2
- 3:
  ~ strangeness += 3
- 4:
  ~ strangeness += 4
}

// count the number of right ingredients
{ dialogue_ingredients_of_the_day has chosen_ingredient:
    ~ num_right_ingredients += 1
    @ingredientFeedback success:true
- else:
    @ingredientFeedback success:false
}

// remove the chosen ingredient from all the lists so that it can't be chosen again
~ base_ingredients_of_the_day -= chosen_ingredient
~ dialogue_ingredients_of_the_day -= chosen_ingredient

// loop back for another minigame round
-> loop