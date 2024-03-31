/*
CHARACTERS

Data about the characters
*/


// lista dei personaggi in vita, all'inizio dovranno essere selezionati tutti
LIST alive_characters = (UgoEMimi), (BeBe), (Piiiietro), (Quello), (ilDivo)
LIST extra_characters = DOGRON
LIST character_variants = BeBenator, MIMI

=== function isAlive(character)
~ return alive_characters has character