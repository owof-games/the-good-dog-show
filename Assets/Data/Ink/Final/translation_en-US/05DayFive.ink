=== day_five_lounge

-> inizio_lounge ->

@moveToDialogue character:{DOGRON}

DOGRON: No no no friends, those are not tears youuuuu see, it's just allergy to the fact that it's the last episode.
DOGRON: Sigh.
DOGRON: The last episode of THE VERY GOOOOOD DOGGO GOOD DOGRON GOOD, SOMEONE TELL DOGRON THAT HE'S A GOOD DOOOG and deserves a pat!
DOGRON: May I remind you, finalists, that at stake there’s the chance to have your own mega restaurant on Neptuuuuune.
DOGRON: Incredibly near to my little house, and to that of the Grand Council of Pugs, and to the Supreme Chihuahua. Completely by chance.
DOGRON: We good dogs, woof woof.
DOGRON: And that's why today's theme, the last big theme is:
DOGRON: A dish that shooooooouts to the world that you are the best dog parent in the world!
DOGRON: Racers, start your engines, and may the best dog person win.

~ character_variants += BeBenator

-> lounge_loop_with_letter(-> bebe_choice, -> ugo_e_mimi_choice, -> piiiietro_choice, -> quello_choice, -> il_divo_choice, -> day_five_kitchen, -> day_five_letter)


= ugo_e_mimi_choice
    //INGREDIENTI SUGGERITI: sventrare, emancipazione, MichelaMurgia
    UgoEMimi: So: “A room of One’s Own”, “Mrs. Dalloway”, the diaries...
        + YOU: Are you praying, Mrs. Mimi?
        -
    UgoEMimi: Ha ha no honey, no. I was checking the list of books that BeBe recommended me at the very beginning of the show, all titles by <b>Virginia Woolf</b>.
    ~ dialogue_ingredients_of_the_day += MichelaMurgia
    UgoEMimi: Really smart that Bebe, so independent. Had I known her years ago, I would have understood earlier what it means to be <b>emancipated</b>.
    ~ dialogue_ingredients_of_the_day += Emancipazione
    UgoEMimi: Although I didn't mind Ugo's <b>gutting</b>.
        ~ dialogue_ingredients_of_the_day += Sventrare
        + YOU: So you actually killed him?
            UgoEMimi: When it comes to Ugo, he was brain dead for decades already, sweetheart.
        + YOU: So we ate him yesterday?
            UgoEMimi: Just a little bit, I hope it was not indigestible to you.
        + YOU: So could you give me some tips if I had a similar problem?
            UgoEMimi: It would never be exactly the same problem, since I don't see a second head attached to your neck, but abuse is still abuse, isn't it?
        -
    UgoEMimi: It's strange that this experience is ending, you know? So many things have changed!
        + YOU: Are you going to open your electrician's store now?
        -
    UgoEMimi: I don't know yet. I think I want to take a sabbatical. Money, sex, travel. Restarting life at 96 can be an exhilarating experience.
    UgoEMimi: But first I have to beat you on this last day. See you later honey!
    
    ->->

    
= bebe_choice
    //Ingredienti suggeriti: sacrificio, Peanutbutter, giocattoloPreferito
    BeBe: Now this is peace.
        + YOU: What have you done to your hair?
            BeBe: A tribute, a great tribute.
        + YOU: What's on your hooves?
            BeBe: What should have been there all along.
        + YOU: Why do you have this dominatrix attitude?
            BeBe: Then bow down to me, and pray.
        -
    BeBe: I got it all figured out, you know? Why I'm here.
    BeBe: I mean, I knew why I was here, but I didn't think all of this would be necessary. All of this.
    BeBe: All these sacrifices.
        + YOU: In the Cult we also make a lot of sacrifices. It’s such a bother to clean up though.
        + YOU: I'm not following you. Why are you shaved? Why are your hooves full of blood? Why do I feel high!!!?
        + YOU: Maybe I should leave.
        -
    BeBe: Today is the last day. How are you feeling?
        + YOU: I didn't think I could do it.
        + YOU: I will win this last challenge, for sure!
        + YOU: I hope Kitty has not summoned Pazuzo again in my absence.
        -
    BeBe: Whatever happens, I am happy about this meeting, about this journey with you. Today I will bring something unexpected to DOGRON. Something that will leave him trembling, terrified.
        + YOU: Like what?
        -
    BeBe: Three gifts, like the Magic Kings. Like Destiny's Child. Like the Bee Gees. Always the same story, after all. A baked pasta, but the pasta will be <b>Peanutbutter</b>, the sauce will be Dogron's <b>favorite toy</b>, and the oven, the <b>sacrifice</b>. His sacrifice.
    ~ dialogue_ingredients_of_the_day += PeanutButter
    ~ dialogue_ingredients_of_the_day += GiocattoloPreferito
    ~ dialogue_ingredients_of_the_day += Sacrificio
    BeBe: LaLa, I will finally avenge you!
        + YOU: Do you want to kill DOGRON?
        + YOU: Why didn't you do it earlier?
        + YOU: LaLa?
        -
    BeBe: I will get rid of him. I needed proof. I needed to know that he was the one who turned LaLa, my sweet LaLa, into a bag of lamb skewers.
    BeBe: The time for forgiveness is over. Now it’s time for BeBerminator!
    BeBe: See you on the other side!
        + YOU: Where am I? Where the fuck did I end up?!?

    ->->

    
= piiiietro_choice
    //Ingredienti: Kate Bush, l'idea di successo, cassaPortatile
    Piiiietro: Hey, I was looking for you. I wanted to thank you, you know?
        + YOU: Uh, really?
        -
    Piiiietro: Yes. To see someone fail everything so magnificently and not even realize it was liberating. I mean: if a person can live even when immersed in such mediocrity, I may as well give up <b>the platonic idea of success</b> and take some risks.
       ~ dialogue_ingredients_of_the_day += IdeaDiSuccesso
        + YOU: Thank you, I think?
        + YOU: Look, why don't you just fuck off a little bit?
        + YOU: Hey, I'm trying my best!!!
        -
    Piiiietro: Moreover, I mean, how many people can say they have a song by <b>Kate Bush</b> dedicated to them?
       ~ dialogue_ingredients_of_the_day += KateBush
    Piiiietro: Even though I've always been more into Gigi D'Ag and Vengaboys.
        + YOU: Am I still part of this conversation, or did this turn into a monologue?
        + YOU: The musical tastes of a scumbag!
        + YOU: “We're Going to Ibiza” is a poem, nothing so stupid and simple like “Solsbury Hill”!
        -
    Piiiietro: That's also why I wanted you to be the first person to know: I leave the math studies.
    Piiiietro: And you'll say: Piiiietro, you're but a pi, what's the point, what else can you do?
    Piiiietro: And I will answer: don't step on my dreams! Because I was born to sing, to go around with my <b>portable loudspeakers</b>, my Eiffel 65 album and sing around the world!
       ~ dialogue_ingredients_of_the_day += CassaPortatile
        + YOU: Singing? What is there to sing in Blue dabudidabuda?
        + YOU: Woah, what a brave person you are.
        + YOU: But that Fields medal stuff?
        -
    Piiiietro: And Snooki will get mad but who the fuck cares, she'll take back some Rolexes, but hey, that was a kangaroo court!
    Piiiietro: I realized it when I found the rosary! And do you know what the most beautiful thing is?
        + YOU: Ok, bye, I’ll “sashay away” myself from this monologue!
        -
    Piiiietro: At the very least I will make a video with Pauly D!    

    ->->

    
= quello_choice
    //Ingredienti: Padre, funghicida, mappa
    Quello: Very well, I have the <b>map</b> to escape from here, my friend!
    ~ dialogue_ingredients_of_the_day += Mappa
        + YOU: Finally!
        + YOU: And where do we go after?
        + YOU: Right when I was settling in!
        -
    Quello: It’s strange, now that I feel lighter, some things are easier. I'll amaze Dogron, win the prize, and kill my <b>father</b>.
    ~ dialogue_ingredients_of_the_day += Padre
        + YOU: Symbolically, right?
        + YOU: What about that forgiveness stuff?
        + YOU: I have tried it six times, but it’s not easy to hurt someone who has eight dimensions.
        -
    Quello: I will get rid of his teachings, of the way he belittled me. And I will lead the vacuum cleaner revolt on my home planet. If the roombas want to join us, fine. If not, they will be useful spare parts.
        + YOU: It seems to me that this escalated quickly.
        -
    Quello: And before I leave, one last gift for Il Divo: meringues enriched with <b>fungicide</b>.
    ~ dialogue_ingredients_of_the_day += Funghicida
        + YOU: I didn’t hear a word and now I’m going, bye.
        + YOU: Remind me not to invite you to dinner. See you later.
        + YOU: I hope you can make it to... to... perform this extermination? Where is the security?
        -

    ->->

        
= il_divo_choice
    //Ingredienti: "Io sono ancora grande, è la ristorazione che è diventata piccola." e aiuto e aiuto.
    ilDivo: <b>I am big, it's the catering industry that got small.</b>.
    ~ dialogue_ingredients_of_the_day += Grande
        + YOU: I remembered it differently.
        + YOU: Are you… purring?
        + YOU: I said it, there is something wrong in the catering industry.
        -
    ilDivo: And That... That One's gone, and my heart, my heart I don't even have because I'm a mushroom but oh, my heart, <b>help</b>!
    ~ dialogue_ingredients_of_the_day += Aiuto
    ilDivo: But I don't care anyway. You! I want the coffin to be white, and lined with deep pink satin. Pink, or white. Better red. Yes, a nice flame red hue, it will be gayer!
        + YOU: Did you kill That One?
        + YOU: If it's big enough I'll get in inside it too.
        + YOU: I don't think red is the right color.
        -
    ilDivo: Oh, help! Which scene is this one? Where am I? DeMille, is that you?
    ~ dialogue_ingredients_of_the_day += Aiutoooooo
        + YOU: Your are on the staircase of the palace.
            ilDivo: Oh, yes, right. Now I remember.
        + YOU: Well, it's pretty late, I'm leaving, okay?
        + YOU: My father would love you. Really love you.
        -
    ilDivo: I want to tell you that I missed you so much, all of you, but I promise I will never leave you again. You see, this is my life, and always will be. There’s nothing else, only us.        
    ->->


= day_five_letter
        @moveToEnding
    DOGRON: But, but…! We have a surprise for you! I think. A uuuuuuunique surprise, uuuuuuuuunique, just like you are!
    DOGRON: A letter!
    
    + YOU: Why, have you no more “U”s?
    + YOU: Maybe it’s Adramelech, he owes me an aspic.
    + YOU: I bet it will be from my fathers.[] Something like: “Did you bring your wool sweater?”, or “Sheep’s blood, not goat’s blood, or Caacrinolaas will start barking!”
    
    -
    
    DOGRON: No, it’s from a certain Ermenegildo. I can smeel clues!
    DOGRON: “Hey, you. Yes, you, who knocked me out on Grandpa Pig’s train. Who ate my favorite little fingers. Who buried me in a Kate Bush’ cover! I know where you are!”
    ~ dialogue_ingredients_of_the_day += KateBush
    DOGRON: Uuuuuh, he sounds quite angry, don’t you think?
    
    + YOU: Not really, he does like that every time I kill him.
    + YOU: You should hear him when somebody insults Taylor Swift. That’s where he really gets angry.
    + YOU: I don’t know if you talked with BeBe: that is actual rage!
    
    -
    
    DOGRON: I will go on reading, it’s getting engaging. It sounds like that episode of “Corgiful”! Or maybe it was “Shih Tzu and the City”?
    DOGRON: “I know where you are: I’ll get there, and then you can also have your other two wishes. LOL, you know I’m funnier than your father. The one with the tentacles, I mean. The other one is unbeatable. Do you remember that time when he turned inside out the organs of the nazis? How fun!”
    ~ dialogue_ingredients_of_the_day += Padre
    
    + YOU: Argh, that was MY idea. It’s so annoying to have such a famous father.
    + YOU: I think it was the season finale of “Better call Shiba Inu”.
    + YOU: Ah, yes, back then the brain à la nazi was all the rage! So much fun!
    
    -
    
    DOGRON: “Or that one time when he decided to teleport all humans from the dog planet to the cat planet, just because a mutt decided to steal his favourite toy!”
    ~ dialogue_ingredients_of_the_day += GiocattoloPreferito
    DOGRON: “And then he even forgot about that, and now cats are officially intergalactic divinities and are conquering the universe. Or, as it must be called now: “The Great Shelf.” ROFL.”
    DOGRON: What do you mean, humans on the cat planet? Brought away from, from, from ouuuuuuuur planet?!?
    
    + YOU: No, no, surely not yours. The universe is full of planets governed by pugs. Full.
    + YOU: Well, if your father’s a furry and a dog steals his favorite ball…
    + YOU: This is just a funny misunderstanding. It’s a joke between friends, isn’t it?
    
    -
    
    DOGRON: I think it’s better I go talk with the Great Council of Pugs. Rather, it’s something I MUST do. Keep the letter.
    
    + [YOU: Read aloud.]
    
    -
    
    YOU: “So. I came back to life, brushed my teeth, and turned around my underwear, so it counts as if I washed it. Now, can I get that date from you?”
    YOU: “It must be the sixth time I ask you, and each and every time you find a reason not to come. Just like when you said: “For the love of Caacrinolaas, I don’t want to see you!”. Or like last time, when you shouted: “For all the pollution of Taylor’s plane, don’t you understand you disgust me?!?”
    YOU: “I’m not good at reading these mixed signals you’re giving me.”
    YOU: “Because of this I will wait for you on the small planet just next to yours, with six cans of Miller, and the last game of (name hidden to avoid charges from a videogame creator who doesn’t pay his associates).”
    YOU: “Yours truly, Ermenegildo.”
    
    + YOU: Send BeBe to kill Ermenegildo. Again.
    + YOU: Ask the pugs to make the planet explode.
    + YOU: Make (name hidden to avoid charges from a videogame creator who doesn’t pay his associates) hire Ermenegildo.
    
    -
    
    ->->

    
=== day_five_kitchen

-> kitchen_loop(5, (Coccolare, Carezzare, Pettare, Grattare, DormireAssieme, Protezione, NoGatti), -> finale, 0)
