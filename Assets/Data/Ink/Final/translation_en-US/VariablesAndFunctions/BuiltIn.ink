/*
BUILT-IN

Functions that are taken from Inky's "Ink" menu, or directly modified from there
*/



/*
	Takes the bottom element from a list, and returns it, modifying the list.

	Returns the empty list () if the source list is empty.

	Usage: 

	LIST fruitBowl = (apple), (banana), (melon)

	I eat the {pop(fruitBowl)}. Now the bowl contains {fruitBowl}.

*/

=== function pop(ref _list) 
    ~ temp el = LIST_MIN(_list) 
    ~ _list -= el
    ~ return el 


// same as pop, but for the top element
=== function dequeue(ref _list) 
    ~ temp el = LIST_MAX(_list) 
    ~ _list -= el
    ~ return el 


/*
    Returns a string with the whole list separated by commas
    
    Usage:
    
    ~ temp my_list_contents = get_list_with_commas(list_variable)
*/

=== function get_list_with_commas(list)
    { list:
        ~ temp curr = "{pop(list)}"
        ~ temp rest = get_list_with_commas(list)
        { rest:
            ~ return "{curr},{rest}"
        - else:
            ~ return curr
        }
    - else:
        ~ return ""
    }
    
    
/*
    Tunnel that displays all the entries of a list, execute a tunnel with
    the chosen choice, and then returns.
   
   Usage:
   
   LIST Colours = Red, Green, Blue, Pink
   VAR my_colour = ()
   
   === set_my_colour(colour)
   ~ my_colour = colour
   ->->
   
   === choose
   -> choose_from(LIST_ALL(Colours), -> set_my_colour) ->
   You chose {my_colour}

*/

=== choose_from(candidates, -> action)
<- choice_for_each(candidates, action)
-> DONE
= choice_for_each(candidates, -> action)
    {LIST_COUNT(candidates) == 0:
        -> DONE
    }
    ~temp curr = LIST_MIN(candidates)
    <- choice_for_each(candidates - curr, action)
    + [{curr}]
        -> action(curr) ->
        ->->
    -> DONE
