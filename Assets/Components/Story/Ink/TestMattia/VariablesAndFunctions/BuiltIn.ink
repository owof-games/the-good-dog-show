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