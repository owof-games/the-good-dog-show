/*
LOUNGE

Routines that are re-used each time we enter the lounge section
*/



/* ---------------------------------

   VARIABLES AND CONSTANTS

 ----------------------------------*/


CONST base_dialogue_loops = 3



/* ---------------------------------

   KNOTS

 ----------------------------------*/


=== lounge_loop(-> bebe_tunnel, -> ugoemimi_tunnel, -> piiiietro_tunnel, -> quello_tunnel, -> ildivo_tunnel, -> kitchen_divert)

// reset the dialogue ingredients, they will be assigned in this conversation
~ dialogue_ingredients_of_the_day = ()

// compute the max number of people you can talk to
~ temp num_loop_rimanenti = base_dialogue_loops
{ abilities has PNGParliExtra:
    ~ num_loop_rimanenti += 1
}

~ temp talkedWith = ()

- (loop)

~ num_loop_rimanenti -= 1
~ temp youHaveTimeToTalk = num_loop_rimanenti >= 0

@moveToLounge
+ {youHaveTimeToTalk and isAlive(BeBe) and talkedWith hasnt BeBe} [BeBe]
    @moveToDialogue character:{BeBe}
    -> bebe_tunnel ->
    ~ talkedWith += BeBe
    -> loop
+ {youHaveTimeToTalk and isAlive(UgoEMimi) and talkedWith hasnt UgoEMimi} [UgoEMimi]
    @moveToDialogue character:{UgoEMimi}
    -> ugoemimi_tunnel ->
    ~ talkedWith += UgoEMimi
    -> loop
+ {youHaveTimeToTalk and isAlive(Piiiietro) and talkedWith hasnt Piiiietro} [Piiiietro]
    @moveToDialogue character:{Piiiietro}
    -> piiiietro_tunnel ->
    ~ talkedWith += Piiiietro
    -> loop
+ {youHaveTimeToTalk and isAlive(Quello) and talkedWith hasnt Quello} [Quello]
    @moveToDialogue character:{Quello}
    -> quello_tunnel ->
    ~ talkedWith += Quello
    -> loop
+ {youHaveTimeToTalk and isAlive(ilDivo) and talkedWith hasnt ilDivo} [ilDivo]
    @moveToDialogue character:{ilDivo}
    -> ildivo_tunnel ->
    ~ talkedWith += ilDivo
    -> loop
+ -> kitchen_divert
