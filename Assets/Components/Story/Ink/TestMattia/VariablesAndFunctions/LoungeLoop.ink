=== lounge_loop(-> bebe_tunnel, -> ugoemimi_tunnel, -> piiiietro_tunnel, -> quello_tunnel, -> ildivo_tunnel, -> kitchen_divert)

~ temp num_loop_rimanenti = 3

- (loop)

~ num_loop_rimanenti -= 1

@moveToLounge
* {num_loop_rimanenti >= 0 and alive_characters has BeBe} [BeBe]
    ~ moveToDialogue(BeBe)
    -> bebe_tunnel ->
    -> loop
* {num_loop_rimanenti >= 0 and alive_characters has UgoEMimi} [UgoEMimi]
    ~ moveToDialogue(UgoEMimi)
    -> ugoemimi_tunnel ->
    -> loop
* {num_loop_rimanenti >= 0 and alive_characters has Piiiietro} [Piiiietro]
    ~ moveToDialogue(Piiiietro)
    -> piiiietro_tunnel ->
    -> loop
* {num_loop_rimanenti >= 0 and alive_characters has Quello} [Quello]
    ~ moveToDialogue(Quello)
    -> quello_tunnel ->
    -> loop
* {num_loop_rimanenti >= 0 and alive_characters has ilDivo} [ilDivo]
    ~ moveToDialogue(ilDivo)
    -> ildivo_tunnel ->
    -> loop
* -> kitchen_divert