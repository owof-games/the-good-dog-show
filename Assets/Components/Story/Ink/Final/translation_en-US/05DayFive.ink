=== day_five_lounge

-> inizio_lounge ->

@moveToDialogue character:{DOGRON}

DOGRON: No no no friends, those are not tears youuuuu see, it's just allergy to the fact that it's the last episode.
DOGRON: Sob.
DOGRON: The last episode of THE VERY GOOOOOD DOGGO GOOD DOGRON GOOD, SOMEONE TELL DOGRON THAT IT'S A GOOD DOOOG and deserves a pat-pat!
DOGRON: May I remind you, finalists, that up for grabs is the chance to have your own mega restaurant on Neptuuuuune.
Coincidentally very close to my huuuuuman-less cottage, and that of the Great Pug Council and the Supreme Chihuahua.
DOGRON: We good dogs, woof woof
DOGRON: And that's why today's theme, the last big theme is:
DOGRON: A dish that shouuuuuts to the world that you are the best dog parent in the world!
DOGRON: Racers, start your engines, and may the best dog person win.

-> lounge_loop(-> bebe_choice, -> ugo_e_mimi_choice, -> piiiietro_choice, -> quello_choice, -> il_divo_choice, -> day_five_kitchen)


= ugo_e_mimi_choice
    //INGREDIENTI SUGGERITI: sventrare, emancipazione, MichelaMurgia
    UgoEMimi: “A room of One’s Own”, “Mrs Dalloway”, the diaries...
        + YOU: Are you praying, Mrs. Mimi?
        -
    UgoEMimi: Ha ha no honey, no. I was checking the list of books that BeBe recommended at the beginning of the program, all titles by <b>Virginia Woolf</b>.
    ~ dialogue_ingredients_of_the_day += MichelaMurgia
    UgoEMimi: Really smart that Bebe, so independent. Had I known her years ago, I would have understood earlier what it means to be <b>emancipated</b>.
    ~ dialogue_ingredients_of_the_day += Emancipazione
    UgoEMimi: Although I didn't mind Ugo's <b>gutting</b>.
        ~ dialogue_ingredients_of_the_day += Sventrare
        + YOU: So you actually killed him?
            UgoEMimi: For Ugo, we had been at brain death for decades already, sweetheart.
        + YOU: So we ate him yesterday?
            UgoEMimi: A little bit, I hope it was not indigestible to you.
        + YOU: So could you give me two tips if I had a similar problem?
            UgoEMimi: It would never be exactly the same problem, since I don't see a second head attached to your neck, but meat is still meat, isn't it?
        -
    UgoEMimi: It's strange that this path is ending, you know? So many things have changed!
        + YOU: Are you going to open your electrician's store now?
        -
    UgoEMimi: I don't know yet. I think I want to take a sabbatical. Money, sex, travel. Restarting life at 96 can be an exhilarating experience.
    UgoEMimi: But first I have to beat you on this last day. See you later honey!
    
    ->->

    
= bebe_choice
    //Ingredienti suggeriti: sacrificio, Peanutbutter, giocattoloPreferito
    BeBe: Now that's peace.
        + YOU: What have you done to your hair?
            BeBe: A tribute, a great tribute.
        + YOU: What's on your paws?
            BeBe: What should have been there all along.
        + YOU: Why do you have this dominatrix attitude?
            BeBe: Then bow down to me, and pray.
        -
    BeBe: I got it all figured out, you know? Why I'm here.
    BeBe: I mean, I knew why I was here, but I didn't think all this would be necessary. Everything.
    BeBe: All these sacrifices.
        + YOU: In the Worship we also make a lot of sacrifices. Then it's a ball clean up though.
        + YOU: I'm not following you. Why are you shaved? Why are your paws full of blood? Why do I feel high!!!?
        + YOU: Maybe I should leave.
        -
    BeBe: Today is the last day. How are you feeling?
        + YOU: I didn't think I could do it.
        + YOU: I will win this last challenge, guaranteed lemon!
        + YOU: I hope Kitty has not summoned Pazuzo again in my absence.
        -
    BeBe: However it goes, I am happy about this meeting, this journey with you. Today I will bring something unexpected, to DOGRON. Something that will leave him trembling, terrified.
        + YOU: Like what?
        -
    BeBe: Three gifts, like the Magic Kings. Like Destiny's Child. One story, basically. A baked pasta, but the pasta will be <b>Peanutbutter</b>, the sauce DOGRON's <b>favorite toy</b>, and the oven, the <b>sacrifice</b>. His.
    ~ dialogue_ingredients_of_the_day += PeanutButter
    ~ dialogue_ingredients_of_the_day += GiocattoloPreferito
    ~ dialogue_ingredients_of_the_day += Sacrificio
    BeBe: LaLa, I will finally avenge you!
        + YOU: Do you want to kill DOGRON?
        + YOU: Why didn't you do it earlier?
        + YOU: LaLa?
        -
    BeBe: I will get rid of him. I needed the proof. I needed to know that he was the one who turned LaLa, my sweet LaLa, into a bag of lamb vindaloo.
    BeBe: The time for forgiveness is over. Now is just the time for BeBerminator!
    BeBe: See you on the other side!
        + YOU: Where are they? Where the fuck am I!!!?

    ->->

    
= piiiietro_choice
    //Ingredienti: Kate Bush, l'idea di successo, cassaPortatile
    Piiiietro: Hey, I was looking for you. I wanted to thank you, you know?
        + YOU: Uh, really?
        -
    Piiiietro: Yes. To see someone fail so grandly everything and not even realize it, it was liberating. I mean: if a person can still live immersed in so much mediocrity, I may as well give up <b>the platonic idea of success</b> and take some risks.
       ~ dialogue_ingredients_of_the_day += IdeaDiSuccesso
        + YOU: Thank you, I think?
        + YOU: Look, why don't you just fuck off a little bit?
        + YOU: Hey, I'm trying my best!!!
        -
    Piiiietro: Then, I mean. How many people can say they have a song dedicated by <b>Kate Bush</b>?
       ~ dialogue_ingredients_of_the_day += KateBush
    Piiiietro: Even though I've always been one from Gigi D'Ag and Vengaboys.
        + YOU: Am I still part of this conversation, or is this a monologue?
        + YOU: What a taste of scumbag!
        + YOU: “We're Going to Ibiza” is a poem, nothing so stupid and simple like “Solsbury Hill”!
        -
    Piiiietro: That's also why I wanted you to be the first person to know: I leave math.
    Piiiietro: And you'll say, Piiiietro but you're a pi, what's the point, what else can you do?
    Piiiietro: And I would say, don't step on my dreams! Because I was born to sing, to go around with my <b>portable speaker</b>, my Eiffel 65 album and sing around the world!
       ~ dialogue_ingredients_of_the_day += CassaPortatile
        + YOU: Singing? What is there to sing in Blue dabudidabuda?
        + YOU: Woah, you are a brave person.
        + YOU: But that Fields medal stuff?
        -
    Piiiietro: And Snooki will get mad and fuck off, she'll take back some Rolexes but hey, that was a kangaroo court!
    Piiiietro: I realized it when I found the rosary! And do you know what the most beautiful thing is?
        + YOU: Stop it! I’ll “sashay away” myself!
        -
    Piiiietro: Minimum I make a video with Pauly D!    

    ->->

    
= quello_choice
    //Ingredienti: Padre, funghicida, mappa
    Quello: Well, I have the <b>map</b> to escape from here, friendly person!
    ~ dialogue_ingredients_of_the_day += Mappa
        + YOU: Finally!
        + YOU: And then where do we go next?
        + YOU: Now that I was settling in!
        -
    Quello: Strange, now that I feel lighter, some things are easier. I'll amaze Dogron, win the prize, and kill my father.
    ~ dialogue_ingredients_of_the_day += Padre
        + YOU: Symbolically, right?
        + YOU: What about that forgiveness stuff?
        + YOU: I have tried six times, but it is not easy to hurt someone who has eight dimensions.
        -
    That: I will get rid of his teachings, of his belittling me. And I will lead the vacuum cleaner revolt on my home planet. If the roombas want to join us, fine. If not, they will be useful spare parts.
        + YOU: This is escalating quickly, it seems to me.
        -
    That: And before I leave, one last gift for Il Divo: meringues enriched with <b>fungicide</b>.
    ~ dialogue_ingredients_of_the_day += Funghicida
        + ilDivo: Oh, aiuto! Quale scena è, dove mi trovo? Sei tu, DeMille?
        + YOU: Remind me not to invite you to dinner. See you later.
        + YOU: I hope you can make it to, to do this extermination? Where is the security?
        -

    ->->

        
= il_divo_choice
    //Ingredienti: "Io sono ancora grande, è la ristorazione che è diventata piccola." e aiuto e aiuto.
    ilDivo: <b>I Am Big, It's the Catering That Got Small</b>.
    ~ dialogue_ingredients_of_the_day += Grande
        + YOU: I remembered it differently.
        + YOU: Excuse me?
        + YOU: I said it, there is something wrong in the catering industry.
        -
    ilDivo: And that... That One's gone, and my heart, my heart I don't even have because I'm a mushroom but oh, my heart, <b>help</b>!
    ~ dialogue_ingredients_of_the_day += Aiuto
    IlDivo: But I don't care anyway. You! I want the coffin to be white.  And I want it specially lined with satin. White, or deep pink. It’s gayer!
        + YOU: Did you kill That One?
        + YOU: If it's big enough I'll get in on it.
        + YOU: I don't think white is the right color.
        -
    ilDivo: Thank you, dear. Tell Mr. Ramsay I will be on the set at once. But: What is the scene? Where am I? Is that an Hawaiian pizza?
    ~ dialogue_ingredients_of_the_day += Aiutoooooo
        + YOU: This is the staircase of the palace.
            ilDivo: Oh, yes, yes. They're below, waiting for the SuperChef ...I'm ready.
        + YOU: Well, it's gotten to a time, I'm leaving, okay?
        + YOU: Uncle Cthulhu would like you a lot. A lot!
        -
    You don't know how much I've missed all of you. And I promise you I'll never desert you again, because there’s nothing else – just us and the kitchen and the love for myself. All right Mr Ramsay, I'm ready for my closeup.        
    ->->
    
    
    
=== day_five_kitchen

-> kitchen_loop(5, (Coccolare, Carezzare, Pettare, Grattare, DormireAssieme, Protezione, NoGatti), -> finale, 0)
