/*
CHARACTERS

Data about the characters
*/


// lista dei personaggi in vita, all'inizio dovranno essere selezionati tutti
LIST alive_characters = UgoEMimi, BeBe, Piiiietro, Quello, ilDivo
LIST extra_characters = DOGRON
LIST character_variants = BeBenator, MIMI

=== function isAlive(character)
~ return alive_characters has character

=== function nonAliveCharacters()
{ LIST_COUNT(LIST_ALL(alive_characters)) - LIST_COUNT(alive_characters):
- 0:            zero persons left us
- 1:            one person left us
- 2:            two persons left us
- 3:            three persons left us
- 4:            four persons left us
- 5:            five persons left us
}
