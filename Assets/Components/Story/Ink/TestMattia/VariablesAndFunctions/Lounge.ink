CONST base_dialogue_loops = 1

=== lounge_loop(-> bebe_tunnel, -> ugoemimi_tunnel, -> piiiietro_tunnel, -> quello_tunnel, -> ildivo_tunnel, -> kitchen_divert)

// compute the max number of people you can talk to
~ temp num_loop_rimanenti = base_dialogue_loops
{ abilities has PNGParliExtra:
    ~ num_loop_rimanenti += 1
}

- (loop)

~ num_loop_rimanenti -= 1
~ temp youHaveTimeToTalk = num_loop_rimanenti >= 0

@moveToLounge
* {youHaveTimeToTalk and isAlive(BeBe)} [BeBe]
    ~ moveToDialogue(BeBe)
    -> bebe_tunnel ->
    -> loop
* {youHaveTimeToTalk and isAlive(UgoEMimi)} [UgoEMimi]
    ~ moveToDialogue(UgoEMimi)
    -> ugoemimi_tunnel ->
    -> loop
* {youHaveTimeToTalk and isAlive(Piiiietro)} [Piiiietro]
    ~ moveToDialogue(Piiiietro)
    -> piiiietro_tunnel ->
    -> loop
* {youHaveTimeToTalk and isAlive(Quello)} [Quello]
    ~ moveToDialogue(Quello)
    -> quello_tunnel ->
    -> loop
* {youHaveTimeToTalk and isAlive(ilDivo)} [ilDivo]
    ~ moveToDialogue(ilDivo)
    -> ildivo_tunnel ->
    -> loop
* -> kitchen_divert


=== function isAlive(character)
~ return alive_characters has character

EXTERNAL moveToLounge()
=== function moveToLounge() ===
[[[move to lounge]]]