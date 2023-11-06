// list of info that can be queried about an ingredient
LIST IngredientInfo = Name, Strangeness

// list of all the ingredients
LIST Ingredients = InvalidIngredient, Uova, Pentola, NoceMoscata, Farina, Saltare, Sciogliere, Lievitare, Sale, Cipolla, Affettare, TonnoInScatola, Mescolare, Burro, Montare, Zafferano, Mantecare, Braciola, Arrosticino, Costina, Osso, Grigliare, Crocchette, Versare, Riempire, Formaggio, Fondere, Coccole, Brandina, Cuccia, Sgranocchiare, Fidarsi, BarattoloDelloYogurt, Pettorina, Trasportino, Veterinario, Automobile, Viaggiare, Inconscio, CorrereNeiSogni, Coccolare, Carezzare, Pettare, Grattare, DormireAssieme, Protezione, NoGatti, VolAuVent, Skyrim, BlocchiDiErba, UovaDiPecora, Scolare, Lacrime, CacaoAmaro, Specchiarsi, Scottare, IVeriVideogiochi, Canapé, Mungere, Cardare, ChinottoDiSavona, Raccontare, Selfie, Interviste, Avvelenare, CollareConEtichetta, TonnoAlNaturale, Cantare, Perdonare, Evolversi, IoMeStessoMedesimo, SelfCare, Sventrare, Emancipazione, MichelaMurgia, Sacrificio, PeanutButter, GiocattoloPreferito, KateBush, IdeaDiSuccesso, CassaPortatile, Padre, Funghicida, Mappa, Grande, Aiuto, Aiutoooooo, CollaDiPesce, Filtrare, Mazinga, OrecchieUgo


/*
    Get the data regarding an ingredient.
    
    ingredient => the ingredient to query (see Ingredients list)
    what => which info to return about the ingredient (see IngredientInfo list)

    Usage:
    ~ VAR eggsStrangeness = getIngredientData(Eggs, Strangeness)
*/
=== function getIngredientData(ingredient, what)
{ ingredient:
    - CollaDiPesce:
        ~ return selectIngredientData(what, "colla di pesce", 1)
    - Filtrare:
        ~ return selectIngredientData(what, "filtrare", 1)
    - Cipolla:
        ~ return selectIngredientData(what, "cipolla", 1)
    - Uova:
        ~ return selectIngredientData(what, "uova", 1)
    - Farina:
        ~ return selectIngredientData(what, "farina", 1)
    - Saltare:
        ~ return selectIngredientData(what, "saltare", 1)
    - Sciogliere:
        ~ return selectIngredientData(what, "sciogliere", 2)
    - Lievitare:
        ~ return selectIngredientData(what, "lievitare", 1)
    - Sale:
        ~ return selectIngredientData(what, "sale", 1)
    - Pentola:
        ~ return selectIngredientData(what, "pentola", 1)
    - NoceMoscata:
        ~ return selectIngredientData(what, "noce moscata", 1)
    - Sciogliere:
        ~ return selectIngredientData(what, "sciogliere", 1)
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