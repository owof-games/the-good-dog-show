=== day_four_lounge

-> inizio_lounge ->

@moveToDialogue character:{DOGRON}

DOGRON: Tail, come here! Tail, tail! Stop! Bad tail, bad tail!
DOGRON: Oh, are we on air?
DOGRON: Welcome to the fooooooourth and penultimate episode of THE VERY GOOD DOGGO GOOD DOGGO GOOD DOGGO! AND SHOW! Here is your favorite host, isn’t it? I am youuuuur favorite host, right?
DOGRON: Who is the best host in the world? Who is he?
DOGRON: Today's theme concerns us all. The theme that comes to your mind when your favorite mug breaks, or the kibble is new and tastes unexpected, or the mailman has a clean uniform.
DOGRON: Or when they get a puppy and they tell youuuu that everything will stay the same but it's not true, that puppy starts walking, goes to stuuudy and you got attached to them and they forget about you.
DOGRON: Today's theme is change, something to accept change.
DOGRON: Another great idea from Supreme Chihuahua and the Pug Council.
{LIST_COUNT(alive_characters) == 1:
DOGRON: The Great Council of Pugs has a riddle for you.
DOGRON: The Supreme in my heart, Balenciaga in my voice, Myrtle is my name.
DOGRON: Wait, where’s the riddle?
}
DOGRON: You can chat with each other for a little while, and then we start cooking.
DOGRON: Come here, tail!

~ character_variants += MIMI

-> lounge_loop(-> bebe_choice, -> ugo_e_mimi_choice, -> piiiietro_choice, -> quello_choice, -> il_divo_choice, -> day_four_kitchen)


= ugo_e_mimi_choice
    //INGREDIENTI: Mazinga e Le orecchie di Ugo
    UgoEMimi: Well, hello there, gorgeous!
        + YOU: Mrs. Mimi, I notice something different!
        -
    UgoEMimi: Uh, maybe it’s the haircut. I was inspired by Venusia from the <b>Great Mazinger</b>. Uh, you know, I had a crush on Tetsuya!
            ~ dialogue_ingredients_of_the_day += Mazinga
        + YOU: He had his why with that tuft.
        + YOU: But what about Mr. Ugo?
        + YOU: No, I mean the fact that you are, like, missing a head.
        -
    UgoEMimi: I feel so light today, you know? I haven't in the longest time. Earlier today, I soldered some electrical sockets, and helped the cameraman with a problem in his android circuits.
    UgoEMimi: And to celebrate the change, as requested by Dogron and his dog friends, I think I will make an Olivier salad with <b>Ugo's ears</b>.
            ~ dialogue_ingredients_of_the_day += OrecchieUgo
            + YOU: I remember Ermenegildo's fingers, so great with mushrooms.
            + YOU: Maybe you'd better hear what the jury thinks about it first?
            + YOU: Will Mr. Ugo miss it?
            -
    UgoEMimi: But I'm going now, sweetheart, I have an appointment with a certain android. See you later!        
    
    ->->

    
    = bebe_choice
    //Ingredienti: avvelenare e collare con un'etichetta: DOGRON
    BeBe: Accept it, of course. He's right.
        + YOU: Are you all right, BeBe?
        -
    BeBe: Yes yes yes, I'm just in a hurry. Change, it's important to embrace change. Change, for my eight, no, seven daughters. Seven.
        + YOU: How come you always quote your daughters?
        -
    BeBe: Because every mother's duty is to protect them. And if she fails, to retaliate. Be the change you want to see in the world.
        + YOU: Should I worry?
        -
    BeBe: No, you shouldn’t. But today I will bring a very special recipe, you know? Change requires risk, and for that I'm going to use hemlock. A little bit of <b>poison</b>, betting on how fatal it can be. And the <b>killer's collar</b>.
    ~ dialogue_ingredients_of_the_day += Avvelenare
    ~ dialogue_ingredients_of_the_day += CollareConEtichetta
        + YOU: Um, I think I left the cat in the oven.
        + YOU: Maybe the air of this planet is harming you?
        + YOU: Are you... dripping milk?
        -
    BeBe: Axe-eptance. You have to axe-ept it all. See you later, bye.    

    ->->

    
    = piiiietro_choice
    //Ingredienti: Tonno in scatola al naturale (più punti) e cantare
    Piiiietro: In the end, he left.
        + YOU: Who?
        -
    Piiiietro: Bruiser. He left me a letter, telling me that he found a Supreme Chihuahua, and that he will live with her. That he sent a service cat to retrieve his spotted bowls and his satin and diamond kennel, and asks me not to look for him.
    Piiiietro: He thanks me for these years together, but he thinks it's time for him to be with someone who doesn't hide himself from the others. Who doesn't pretend to be infinite, he says.
        + YOU: What does he mean?
        + YOU: Just like granny said, it’s important to go where the bowl is full.
        + YOU: Bruiser can write?!
        -
    Piiiietro: He's right, you know? You, do you show yourself as you are to the world?
        + YOU: I mean, if people saw the gifts I inherited from my ancient father, they would be made blind by madness.
        + YOU: In the Cult I learned to hide who I am so that I could get everything.
        + YOU: I tried it once. Lots of alcohol, police, a few days in jail for indecent exposure. Poor sheep.
        -
    Piiiietro: Gee, you've had an interesting life!
    Piiiietro: Mine instead... Bruiser is probably right, you know? I don't really live. I have to, I have to say things out loud. But it's so fucking scary for me to do that.
        + YOU: We've been kidnapped, we're on a planet the size of an Ikea store, we won't know what will become of us tomorrow. If you don't speak today, when?
            Piiiietro: But it is difficult!
        + YOU: I have someplace to be…
            Piiiietro: Two minutes!
        + YOU: BeBe sounds to me like a good listener, you know?
            Piiiietro: When she needs to say my name she gets all mixed up, though.
        -
    Piiiietro: I too will welcome change tonight, you know? Like Bruiser. No more pasta with canned tuna. I'll make pasta with <b>canned tuna in brine</b>! And I will present it by <b>singing</b>.
       ~ dialogue_ingredients_of_the_day += TonnoAlNaturale
        ~ dialogue_ingredients_of_the_day += Cantare
    Piiiietro: Uh, I said it. I have to run now, see you later!

    ->->

    
    = quello_choice
    //Ingredienti: perdonare e evolversi
    Quello: Let me give you a hug!
        + YOU: You look great, That One!
        + YOU: Um, first get the dust off.
        + YOU: Er, where do I put my right hand?
        -
    Quello: I didn't expect it, but this path is becoming a real journey, you know? A journey toward <b>forgiving</b> even those who have hurt you.
    ~ dialogue_ingredients_of_the_day += Perdonare
    Quello: Like forgiving my father. He didn't invent roomba against me, against us.
    Quello: It was people, lazy people, who got rid of us vacuum cleaners in favor of those, those who are maybe my brothers, don't you think?
        + YOU: I just feel a great confusion in my head now.
        + YOU: So, Il Divo is not your father?
        + YOU: I have never cleaned my house, so I don't know what you are talking about.
        -
    Quello: Moreover, one needs to <b>evolve</b>. I think, uh, it's silly, you know?
    ~ dialogue_ingredients_of_the_day += Evolversi
        + YOU: That One, I think this whole situation is silly, if not ridiculous.
        + YOU: "Silly" is accidentally killing Ermenegildo, and then forgetting about it, and taking him to Disneyworld and talking to him all day and even paying for the ticket!
        + YOU: My brain is leaking out of my ears by now.
        -
    Quello: I couldn't forgive my father, so I sought another one. I put my energies and my faith in il Divo. Another arrogant man.
    Quello: But I am a good person by myself, don't you think? Even though we were all thrown into dumpsters. Even if my father created something to replace us all. Even if il Divo will never give me his approval.
    Quello: I am the one who has to approve MYSELF, and that's it.
        + YOU: That's deep, bro!
        + YOU: In the Cult this is subversive thinking, you know?
        + YOU: What about me, who approves of me? You? Dogron? Who!?!?
        -
    Quello: Now I'm going to go to il Divo, and tell him I'm quitting. Also, I'm going to win this program!    
        
    ->->

    
    = il_divo_choice
    //Ingredienti: iomestessomemedesimo e #selfcare
        ilDivo: Uh, my favorite contestant! How are you doing?
            + YOU: I find myself here without understanding how. I'm moving forward and I don't understand in what. How am I supposed to be?!?
            + YOU: I think I just saw a cucumber make a love declaration to a dead cameraman.
            + YOU: I never thought I would have said this, but I miss the Cult. The rites, the deads, the blood, the escapes from the exorcists.
            -
        ilDivo: You certainly have a fabulous life, don't you?
        ilDivo: But never as much as mine!
            + YOU: What a surprise.
            -
        ilDivo: I have found true love. Here, on this tiny planet, I understood everything. I stopped for a moment, a hit of cocaine and a moment of <b>hashtag selfcare</b>, and there he was, the true love of my life!
            ~ dialogue_ingredients_of_the_day += SelfCare
            + YOU: That One?
            + YOU: Bruiser?
            + YOU: the corpse of Ermenegildo?
            -
        ilDivo: <b>Me, myself and I</b>. There is only one great love in this life, and it can only be me. Just me!
            ~ dialogue_ingredients_of_the_day += IoMeStessoMedesimo
        ilDivo: Do you want to celebrate my marriage to myself?
            + YOU: I'm sorry but I have to have my ears pulled out before continuing this show.
            + YOU: I can't, I have to drop a spotlight on my head and hope to die.
            + YOU: Sure, after taking a bath with my beloved toaster.
            -
        ilDivo: I feel so much love!    
        
        ->->
        
        
=== day_four_kitchen
{LIST_COUNT(alive_characters) == 1:
~ dialogue_ingredients_of_the_day += Balenciaga
~ dialogue_ingredients_of_the_day += Myrtle
}

-> kitchen_loop(4, (Pettorina, Trasportino, Veterinario, Automobile, Viaggiare, Inconscio, CorrereNeiSogni), -> day_five_lounge, 3)
