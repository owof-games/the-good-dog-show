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
        ~ return selectIngredientData(what, "uova", 1)
    - Pentola:
        ~ return selectIngredientData(what, "pentola", 2)
    - NoceMoscata:
        ~ return selectIngredientData(what, "noce moscata", 1)
    - Farina:
        ~ return selectIngredientData(what, "farina", 1)
    - Saltare:
        ~ return selectIngredientData(what, "saltare", 1)
    - Sciogliere:
        ~ return selectIngredientData(what, "sciogliere", 2)
    - Lievitare:
        ~ return selectIngredientData(what, "lievitare", 2)
    - Sale:
        ~ return selectIngredientData(what, "sale", 1)
    - Cipolla:
        ~ return selectIngredientData(what, "cipolla", 1)
    - Affettare:
        ~ return selectIngredientData(what, "affettare", 3)
    - TonnoInScatola:
        ~ return selectIngredientData(what, "tonno in scatola", 1)
    - Mescolare:
        ~ return selectIngredientData(what, "mescolare", 1)
    - Burro:
        ~ return selectIngredientData(what, "burro", 1)
    - Montare:
        ~ return selectIngredientData(what, "montare", 3)
    - Zafferano:
        ~ return selectIngredientData(what, "zafferano", 3)
    - Mantecare:
        ~ return selectIngredientData(what, "mantecare", 3)
    - Braciola:
        ~ return selectIngredientData(what, "braciola", 2)
    - Arrosticino:
        ~ return selectIngredientData(what, "arrosticino", 3)
    - Costina:
        ~ return selectIngredientData(what, "costina", 3)
    - Osso:
        ~ return selectIngredientData(what, "osso", 2)
    - Grigliare:
        ~ return selectIngredientData(what, "grigliare", 2)
    - Crocchette:
        ~ return selectIngredientData(what, "crocchette", 1)
    - Versare:
        ~ return selectIngredientData(what, "versare", 2)
    - Riempire:
        ~ return selectIngredientData(what, "riempire", 3)
    - Formaggio:
        ~ return selectIngredientData(what, "formaggio", 2)
    - Fondere:
        ~ return selectIngredientData(what, "fondere", 2)
    - Coccole:
        ~ return selectIngredientData(what, "coccole", 3)
    - Brandina:
        ~ return selectIngredientData(what, "brandina", 3)
    - Cuccia:
        ~ return selectIngredientData(what, "cuccia", 3)
    - Sgranocchiare:
        ~ return selectIngredientData(what, "sgranocchiare", 2)
    - Fidarsi:
        ~ return selectIngredientData(what, "fidarsi", 3)
    - BarattoloDelloYogurt:
        ~ return selectIngredientData(what, "il barattolo dello Yogurt", 2)
    - Pettorina:
        ~ return selectIngredientData(what, "pettorina", 3)
    - Trasportino:
        ~ return selectIngredientData(what, "trasportino", 3)
    - Veterinario:
        ~ return selectIngredientData(what, "veterinario", 3)
    - Automobile:
        ~ return selectIngredientData(what, "automobile", 3)
    - Viaggiare:
        ~ return selectIngredientData(what, "viaggiare", 2)
    - Inconscio:
        ~ return selectIngredientData(what, "inconscio", 3)
    - CorrereNeiSogni:
        ~ return selectIngredientData(what, "correre nei sogni", 2)
    - Coccolare:
        ~ return selectIngredientData(what, "coccolare", 3)
    - Carezzare:
        ~ return selectIngredientData(what, "carezzare", 2)
    - Pettare:
        ~ return selectIngredientData(what, "pettare", 3)
    - Grattare:
        ~ return selectIngredientData(what, "grattare", 4)
    - DormireAssieme:
        ~ return selectIngredientData(what, "dormire assieme", 4)
    - Protezione:
        ~ return selectIngredientData(what, "protezione", 2)
    - NoGatti:
        ~ return selectIngredientData(what, "niente gatti!", 4)
    - VolAuVent:
        ~ return selectIngredientData(what, "vol-au-vent", 2)
    - Skyrim:
        ~ return selectIngredientData(what, "Skyrim", 2)
    - BlocchiDiErba:
        ~ return selectIngredientData(what, "blocchi di erba", 2)
    - UovaDiPecora:
        ~ return selectIngredientData(what, "uova di pecora", 3)
    - Scolare:
        ~ return selectIngredientData(what, "scolare", 2)
    - Lacrime:
        ~ return selectIngredientData(what, "lacrime", 3)
    - CacaoAmaro:
        ~ return selectIngredientData(what, "cacao amaro", 2)
    - Specchiarsi:
        ~ return selectIngredientData(what, "specchiarsi", 3)
    - Scottare:
        ~ return selectIngredientData(what, "scottare", 2)
    - IVeriVideogiochi:
        ~ return selectIngredientData(what, "i VERI videogiochi", 3)
    - Canapé:
        ~ return selectIngredientData(what, "canapé", 2)
    - Mungere:
        ~ return selectIngredientData(what, "mungere", 2)
    - Cardare:
        ~ return selectIngredientData(what, "cardare", 3)
    - ChinottoDiSavona:
        ~ return selectIngredientData(what, "Chinotto di Savona", 2)
    - Raccontare:
        ~ return selectIngredientData(what, "raccontare", 3)
    - Selfie:
        ~ return selectIngredientData(what, "selfie", 3)
    - Interviste:
        ~ return selectIngredientData(what, "interviste", 3)
    - Avvelenare:
        ~ return selectIngredientData(what, "avvelenare", 3)
    - CollareConEtichetta:
        ~ return selectIngredientData(what, "collare con un'etichetta col nome Dogron", 3)
    - TonnoAlNaturale:
        ~ return selectIngredientData(what, "tonno in scatola al naturale", 3)
    - Cantare:
        ~ return selectIngredientData(what, "cantare", 3)
    - Perdonare:
        ~ return selectIngredientData(what, "perdonare", 3)
    - Evolversi:
        ~ return selectIngredientData(what, "evolversi", 3)
    - IoMeStessoMedesimo:
        ~ return selectIngredientData(what, "iomestessomemedesimo", 3)
    - SelfCare:
        ~ return selectIngredientData(what, "hashtagselfcare", 3)
    - Sventrare:
        ~ return selectIngredientData(what, "sventrare", 3)
    - Emancipazione:
        ~ return selectIngredientData(what, "emancipazione", 4)
    - MichelaMurgia:
        ~ return selectIngredientData(what, "Michela Murgia", 4)
    - Sacrificio:
        ~ return selectIngredientData(what, "sacrificio", 3)
    - PeanutButter:
        ~ return selectIngredientData(what, "mr.Peanutbutter", 4)
    - GiocattoloPreferito:
        ~ return selectIngredientData(what, "la pallina preferita di DOGRON", 4)
    - KateBush:
        ~ return selectIngredientData(what, "Kate Bush", 3)
    - IdeaDiSuccesso:
        ~ return selectIngredientData(what, "l'idea del successo", 4)
    - CassaPortatile:
        ~ return selectIngredientData(what, "una cassa portatile", 4)
    - Padre:
        ~ return selectIngredientData(what, "padre", 3)
    - Funghicida:
        ~ return selectIngredientData(what, "funghicida", 4)
    - Mappa:
        ~ return selectIngredientData(what, "mappa", 4)
    - Balenciaga:
        ~ return selectIngredientData(what, "Balenciaga", 4)
    - Myrtle:
        ~ return selectIngredientData(what, "Myrtle", 4)    
    - Grande:
        ~ return selectIngredientData(what, "Io sono ancora grande, è la ristorazione che è diventata piccola.", 2)
    - Aiuto:
        ~ return selectIngredientData(what, "aiuto", 3)
    - Aiutoooooo:
        ~ return selectIngredientData(what, "AIUTOOOOOOOOOOOOOOOOOOOO", 4)
    - CollaDiPesce:
        ~ return selectIngredientData(what, "colla di pesce", 1)
    - Filtrare:
        ~ return selectIngredientData(what, "filtrare", 1)
    - Mazinga:
        ~ return selectIngredientData(what, "Mazinga", 2)
    - OrecchieUgo:
        ~ return selectIngredientData(what, "orecchie di Ugo", 3)
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