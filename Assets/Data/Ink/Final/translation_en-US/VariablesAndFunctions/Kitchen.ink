/* ---------------------------------

   VARIABLES AND CONSTANTS

 ----------------------------------*/


// variabile che tiene gli ingredienti che appaiono nella roulette russa per il giorno che stiamo giocando
VAR dialogue_ingredients_of_the_day = ()
// chosen ingredient; this is set by Unity in @playKitchenGame
VAR chosen_ingredient = InvalidIngredient
VAR ScampataLaMorte = false
CONST normal_speed = 1.3
CONST slow_speed = 1.0
CONST acceleration = 7
CONST max_rounds = 6
CONST num_ingredients_to_get_right = 3



/* ---------------------------------

   EXTERNAL FUNCTIONS

 ----------------------------------*/


EXTERNAL setIngredientsSpeed(speed, acceleration, maxRounds)
=== function setIngredientsSpeed(speed, acceleration, maxRounds)
[[[ set ingredients speed to {speed} {acceleration} {maxRounds} ]]]

EXTERNAL hideKitchenText()
=== function hideKitchenText() ===
[[[hide the kitchen text]]]



/* ---------------------------------

   KNOTS

 ----------------------------------*/


=== kitchen_loop(num_ingredients, base_ingredients_of_the_day, -> next_day, extra_strangeness)

~ playBackgroundMusic("action")

// move to the kitchen scene
@moveToKitchen

{ not in_unity:
    DEBUG - gli ingredienti giusti sono {dialogue_ingredients_of_the_day}
}

// set the statistics of the ingredients to zero
~ temp strangeness = extra_strangeness
~ temp num_right_ingredients = 0

// loop counter (from 0 to num_ingredients)
~ temp num_loop = 0

// flags that track whether we displayed or not certain phrases
~ temp displayed_choose_ingredient = false
~ temp displayed_explanation = false

- (kitchen_inner_loop)

// setup speed according to abilities
{
- not displayed_choose_ingredient and abilities has SceltaIngrediente:
    ~ setIngredientsSpeed(slow_speed, 0, 99999)
- abilities has ScelteLente:
    ~ setIngredientsSpeed(slow_speed, acceleration, max_rounds)
- else:
    ~ setIngredientsSpeed(normal_speed, acceleration, max_rounds)
}

// check whether we should break the loop and go to the ending
~ num_loop += 1
{ num_loop > num_ingredients:
    -> after_kitchen(strangeness, num_right_ingredients, next_day)
}

// variable to track whether to only show correct ingredients in the list
~ temp show_only_correct_ingredients = false

{
    - not displayed_choose_ingredient and abilities has SceltaIngrediente:
        You’re lucky, you can choose a correct ingredient before starting!
        ~ displayed_choose_ingredient = true
        ~ show_only_correct_ingredients = true
    - not displayed_explanation:
        Choose ingredients and actions based on what’s been told to you… and be quick!
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
~ temp comma_separated_ingredients = get_list_with_commas(all_ingredients)
@playKitchenGame ingredients:{comma_separated_ingredients}

{ not in_unity:
    -> debugChooseIngredient(all_ingredients) ->
}

// if the timer runs out, it returns invalid ingredient: just mark it wrong and move on
{ chosen_ingredient == InvalidIngredient:
    @ingredientFeedback success:false
    -> kitchen_inner_loop
}

// add the strangeness of the chosen ingredient
~ temp ingredient_strangeness = getIngredientData(chosen_ingredient, Strangeness)
{ ingredient_strangeness:
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
-> kitchen_inner_loop



=== debugChooseIngredient(ingredients)
DEBUG - scegli l'ingrediente:
-> choose_from(ingredients, -> set_ingredient)

= set_ingredient(ingredient)
~ chosen_ingredient = ingredient
->->
