/*
INGREDIENTS DATABASE

A database containing all the ingredients and their characteristics.
*/



/* ---------------------------------

   VARIABLES AND CONSTANTS

 ----------------------------------*/


// list of info that can be queried about an ingredient
LIST IngredientInfo = Name, Strangeness

// list of all the ingredients
LIST Ingredients = InvalidIngredient, Uova, Pentola, NoceMoscata, Farina, Saltare, Sciogliere, Lievitare, Sale, Cipolla, Affettare, TonnoInScatola, Mescolare, Burro, Montare, Zafferano, Mantecare, Braciola, Arrosticino, Costina, Osso, Grigliare, Crocchette, Versare, Riempire, Formaggio, Fondere, Coccole, Brandina, Cuccia, Sgranocchiare, Fidarsi, BarattoloDelloYogurt, Pettorina, Trasportino, Veterinario, Automobile, Viaggiare, Inconscio, CorrereNeiSogni, Coccolare, Carezzare, Pettare, Grattare, DormireAssieme, Protezione, NoGatti, VolAuVent, Skyrim, BlocchiDiErba, UovaDiPecora, Scolare, Lacrime, CacaoAmaro, Specchiarsi, Scottare, IVeriVideogiochi, Canapé, Mungere, Cardare, ChinottoDiSavona, Raccontare, Selfie, Interviste, Avvelenare, CollareConEtichetta, TonnoAlNaturale, Cantare, Perdonare, Evolversi, IoMeStessoMedesimo, SelfCare, Sventrare, Emancipazione, MichelaMurgia, Sacrificio, PeanutButter, GiocattoloPreferito, KateBush, IdeaDiSuccesso, CassaPortatile, Padre, Funghicida, Mappa, Grande, Aiuto, Aiutoooooo, CollaDiPesce, Filtrare, Mazinga, OrecchieUgo, Balenciaga, Myrtle



/* ---------------------------------

   KNOTS

 ----------------------------------*/


/*
    Get the data regarding an ingredient.
    
    ingredient => the ingredient to query (see Ingredients list)
    what => which info to return about the ingredient (see IngredientInfo list)

    Usage:
    ~ VAR eggsStrangeness = getIngredientData(Eggs, Strangeness)
*/

=== function getIngredientData(ingredient, what)
{ ingredient:
    - Uova:
        ~ return selectIngredientData(what, "eggs", 1)
    - Pentola:
        ~ return selectIngredientData(what, "pot", 2)
    - NoceMoscata:
        ~ return selectIngredientData(what, "nutmeg", 1)
    - Farina:
        ~ return selectIngredientData(what, "flour", 1)
    - Saltare:
        ~ return selectIngredientData(what, "stir-fry", 1)
    - Sciogliere:
        ~ return selectIngredientData(what, "melt", 2)
    - Lievitare:
        ~ return selectIngredientData(what, "rise", 2)
    - Sale:
        ~ return selectIngredientData(what, "salt", 1)
    - Cipolla:
        ~ return selectIngredientData(what, "onion", 1)
    - Affettare:
        ~ return selectIngredientData(what, "slice", 3)
    - TonnoInScatola:
        ~ return selectIngredientData(what, "canned tuna", 1)
    - Mescolare:
        ~ return selectIngredientData(what, "stir", 1)
    - Burro:
        ~ return selectIngredientData(what, "butter", 1)
    - Montare:
        ~ return selectIngredientData(what, "whip", 3)
    - Zafferano:
        ~ return selectIngredientData(what, "saffron", 3)
    - Mantecare:
        ~ return selectIngredientData(what, "saute", 3)
    - Braciola:
        ~ return selectIngredientData(what, "pork chop", 2)
    - Arrosticino:
        ~ return selectIngredientData(what, "lamb skewer", 3)
    - Costina:
        ~ return selectIngredientData(what, "pork rib", 3)
    - Osso:
        ~ return selectIngredientData(what, "bone", 2)
    - Grigliare:
        ~ return selectIngredientData(what, "grill", 2)
    - Crocchette:
        ~ return selectIngredientData(what, "kibbles", 1)
    - Versare:
        ~ return selectIngredientData(what, "pour", 2)
    - Riempire:
        ~ return selectIngredientData(what, "fill", 3)
    - Formaggio:
        ~ return selectIngredientData(what, "cheese", 2)
    - Fondere:
        ~ return selectIngredientData(what, "melt", 2)
    - Coccole:
        ~ return selectIngredientData(what, "cuddles", 3)
    - Brandina:
        ~ return selectIngredientData(what, "cot", 3)
    - Cuccia:
        ~ return selectIngredientData(what, "kennel", 3)
    - Sgranocchiare:
        ~ return selectIngredientData(what, "crunch", 2)
    - Fidarsi:
        ~ return selectIngredientData(what, "trust", 3)
    - BarattoloDelloYogurt:
        ~ return selectIngredientData(what, "yogurt pot", 2)
    - Pettorina:
        ~ return selectIngredientData(what, "harness", 3)
    - Trasportino:
        ~ return selectIngredientData(what, "pet carrier", 3)
    - Veterinario:
        ~ return selectIngredientData(what, "veterinarian", 3)
    - Automobile:
        ~ return selectIngredientData(what, "car", 3)
    - Viaggiare:
        ~ return selectIngredientData(what, "travel", 2)
    - Inconscio:
        ~ return selectIngredientData(what, "subconscious", 3)
    - CorrereNeiSogni:
        ~ return selectIngredientData(what, "run in dreams", 2)
    - Coccolare:
        ~ return selectIngredientData(what, "cuddle", 3)
    - Carezzare:
        ~ return selectIngredientData(what, "pet", 2)
    - Pettare:
        ~ return selectIngredientData(what, "fondle", 3)
    - Grattare:
        ~ return selectIngredientData(what, "scratch", 4)
    - DormireAssieme:
        ~ return selectIngredientData(what, "sleep together", 4)
    - Protezione:
        ~ return selectIngredientData(what, "protection", 2)
    - NoGatti:
        ~ return selectIngredientData(what, "no cats allowed!", 4)
    - VolAuVent:
        ~ return selectIngredientData(what, "vol-au-vent", 2)
    - Skyrim:
        ~ return selectIngredientData(what, "Skyrim", 2)
    - BlocchiDiErba:
        ~ return selectIngredientData(what, "grass blocks", 2)
    - UovaDiPecora:
        ~ return selectIngredientData(what, "sheep eggs", 3)
    - Scolare:
        ~ return selectIngredientData(what, "drain", 2)
    - Lacrime:
        ~ return selectIngredientData(what, "tears", 3)
    - CacaoAmaro:
        ~ return selectIngredientData(what, "bitter cocoa", 2)
    - Specchiarsi:
        ~ return selectIngredientData(what, "look in the mirror", 3)
    - Scottare:
        ~ return selectIngredientData(what, "sear", 2)
    - IVeriVideogiochi:
        ~ return selectIngredientData(what, "the REAL video games", 3)
    - Canapé:
        ~ return selectIngredientData(what, "canapé", 2)
    - Mungere:
        ~ return selectIngredientData(what, "milk", 2)
    - Cardare:
        ~ return selectIngredientData(what, "card", 3)
    - ChinottoDiSavona:
        ~ return selectIngredientData(what, "Savona's Chinotto", 2)
    - Raccontare:
        ~ return selectIngredientData(what, "storytelling", 3)
    - Selfie:
        ~ return selectIngredientData(what, "selfie", 3)
    - Interviste:
        ~ return selectIngredientData(what, "interviews", 3)
    - Avvelenare:
        ~ return selectIngredientData(what, "poison", 3)
    - CollareConEtichetta:
        ~ return selectIngredientData(what, "necklace with a Dogron name tag", 3)
    - TonnoAlNaturale:
        ~ return selectIngredientData(what, "canned tuna in brine", 3)
    - Cantare:
        ~ return selectIngredientData(what, "singing", 3)
    - Perdonare:
        ~ return selectIngredientData(what, "forgive", 3)
    - Evolversi:
        ~ return selectIngredientData(what, "evolve", 3)
    - IoMeStessoMedesimo:
        ~ return selectIngredientData(what, "memyselfandI", 3)
    - SelfCare:
        ~ return selectIngredientData(what, "hashtagselfcare", 3)
    - Sventrare:
        ~ return selectIngredientData(what, "gutting", 3)
    - Emancipazione:
        ~ return selectIngredientData(what, "emancipated", 4)
    - MichelaMurgia:
        ~ return selectIngredientData(what, "Virginia Woolf", 4)
    - Sacrificio:
        ~ return selectIngredientData(what, "sacrifice", 3)
    - PeanutButter:
        ~ return selectIngredientData(what, "mr. Peanutbutter", 4)
    - GiocattoloPreferito:
        ~ return selectIngredientData(what, "DOGRON's favourite toy", 4)
    - KateBush:
        ~ return selectIngredientData(what, "Kate Bush", 3)
    - IdeaDiSuccesso:
        ~ return selectIngredientData(what, "the idea of success", 4)
    - CassaPortatile:
        ~ return selectIngredientData(what, "a portable loudspeaker", 4)
    - Padre:
        ~ return selectIngredientData(what, "father", 3)
    - Funghicida:
        ~ return selectIngredientData(what, "fungicide", 4)
    - Mappa:
        ~ return selectIngredientData(what, "map", 4)
    - Balenciaga:
        ~ return selectIngredientData(what, "Balenciaga", 4)
    - Myrtle:
        ~ return selectIngredientData(what, "Myrtle", 4)    
    - Grande:
        ~ return selectIngredientData(what, "I am big, it's the catering industry that got small.", 2)
    - Aiuto:
        ~ return selectIngredientData(what, "help", 3)
    - Aiutoooooo:
        ~ return selectIngredientData(what, "HEEEEEEEEEEEEEEEEELP!", 4)
    - CollaDiPesce:
        ~ return selectIngredientData(what, "isinglass", 1)
    - Filtrare:
        ~ return selectIngredientData(what, "filter", 1)
    - Mazinga:
        ~ return selectIngredientData(what, "Great Mazinger", 2)
    - OrecchieUgo:
        ~ return selectIngredientData(what, "Ugo's ears", 3)
    - else:
        ~ throwException("unknown ingredient data for {ingredient}")
}

=== function selectIngredientData(what, name, strangeness)
{ what:
    - Name:
        ~ return name
    - Strangeness:
        ~ return strangeness
    - else:
        ~ throwException("unknown ingredient data type {what}")
}
