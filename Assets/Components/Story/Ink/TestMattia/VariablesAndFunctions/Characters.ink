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

=== function nonAliveCharacters()
{ LIST_COUNT(LIST_ALL(alive_characters)) - LIST_COUNT(alive_characters):
- 0:            zero persone ci hanno lasciate
- 1:            una persona ci ha lasciate
- 2:            due persone ci hanno lasciate
- 3:            tre persone ci hanno lasciate
- 4:            quattro persone ci hanno lasciate
- 5:            cinque persone ci hanno lasciate
}