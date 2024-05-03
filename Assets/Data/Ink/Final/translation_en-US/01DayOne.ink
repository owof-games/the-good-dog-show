=== day_one_lounge

-> inizio_lounge ->

@moveToDialogue character:{DOGRON}

DOGRON: But, let’s officially start!
DOGRON: Contestants, today, in this first episode of THE GOOD DOG SHOW we will put you to the test by asking you tooooooo…
DOGRON: Coooooking something that you would eat every day!
DOGRON: You have a few minutes to talk to each other before going to the kitchen. Translated into the show rules: you can talk with a maximum of {abilities has PNGParliExtra: {base_dialogue_loops+1}|{base_dialogue_loops}} people!
DOGRON: It's up to you to decide whether you want to share your secrets, trick the other contestants, or get a scratch behind your ear! And be carefuuuuuuul, because in THE GOOD DOG everything changes in the blink of an eye!

-> lounge_loop(-> bebe_choice, -> ugo_e_mimi_choice, -> piiiietro_choice, -> quello_choice, -> il_divo_choice, -> day_one_kitchen)


= ugo_e_mimi_choice
    //Ingredienti suggeriti: colla di pesce e filtrare
    UgoEMimi: Ugo, I don't think it’s appropriate.
    UgoEMimi: Mimi, it’s ME who decides when it's appropriate. And it just so happens that there’s a lot of money going around here and I need a publisher!
    UgoEMimi: Ugo, a stranger is watching us.
        + YOU: Um, hello!
            UgoEMimi: Hello, I am Ugo, and this is my wife Mimi. MY. Wife.
        + YOU: Are you also here against your will?
            UgoEMimi: Well, my husband…
            UgoEMimi: Mimi is shy but yes, we are here because we want to be.
        + YOU: Nice haircut, madam!
            UgoEMimi: My merit. I chose her hairdresser, as a good husband must!
        -
    UgoEMimi: And you, what are you doing here?
    UgoEMimi: Ugo, don't be rude! We are all tense because of this new situation!
        + YOU: I wonder about that too.
        + YOU: I think it's a punishment from the Cult.
        + YOU: I remember only my room, the quick lights, the chloroform…
        -
    UgoEMimi: Do you need help with the cooking, darling?
    UgoEMimi: Mimi! Why are you helping the competition? I need money for the publisher!
    UgoEMimi: But Ugo, I surely don’t want to tell this person that the secret for a perfect aspic is the best <b>isinglass</b> and to <b>filter</b> it gently.
        ~ dialogue_ingredients_of_the_day += CollaDiPesce
        ~ dialogue_ingredients_of_the_day += Filtrare
        + YOU: Thank you ma'am, but the 80s have been over since a long time!
        + YOU: I haven't had an aspic since the day Grandma was sacrificed to Adramelech for my initiation... so many memories!
        + YOU: Madam, if you need help, blink twice.
            YOU: Under this light I can't understand shit. Try again!
        -
    UgoEMimi: Mimi, let's go! I think I saw a chick with an iPod, maybe she's an audio designer!    
    
    ->->


= bebe_choice

    //Ingredienti suggeriti: cipolla e affettare
    BeBe: I was so sure I put them here, holy cow!
        + YOU: Have you lost something?
        -
    BeBe: My sunglasses! I don't like to walk around without them.
        + YOU: You have them on, you know?
            BeBe: Uh, how distracted I am! You know, having eight, er, seven daughters makes everything difficult.
        + YOU: But there is no sun here. Maybe not even on the whole planet.
            BeBe: There is grass though, I can smell it!
        + YOU: Uhm, yes, yes of course.
            BeBe: Are you quoting that new K-Metal band, the Blink of an eye?
        -
    BeBe: But how are you settling in, sweetheart? Do you have everything you need?
        + YOU: I don't know where I am, I just want to run away.
            BeBe: If I win, I promise to take you with me, I have a spare bedroom!
        + YOU: Last time I cooked, my house exploded.
            BeBe: It happens to all everybody, sooner or later.
        + YOU: I'm not supposed to be here. The Cult is looking for me.
            BeBe: Cult?
        -
        + YOU: More importantly, what did you decide to cook for this first episode?
        -
    BeBe: Uh you know, even though I’m a working sheep, being a single mom of eight – darn it! – seven little lambs forces you to deal with money problems.
    BeBe: So I think I will make some bread soup and <b>onion</b>s to <b>slice</b>.
    BeBe: Onion makes everything taste great, and it costs nothing.
    ~ dialogue_ingredients_of_the_day += Cipolla
    ~ dialogue_ingredients_of_the_day += Affettare
        + YOU: Uh, now I understand your breath.
        + YOU: I'm more of a snack person, you know?
        + YOU: Thank you for the advice.
        -
    BeBe: But I haven't introduced myself! I'm Bebe. Now I'm going to get ready for the cooking phase, hope to see you soon!
        + YOU: Good luck.
        + YOU: I will beat you.
        + YOU: How do we get out of here!?!?
        -

    ->->


= piiiietro_choice
    //Ingredienti suggeriti: tonno in scatola e mescolare
    Piiiietro: Bruiser Woods! Where did you go? Jesus, you took away my Gucci’s rosary too!
    Piiiietro: I told Snooki this was a bad idea, oh did I tell her, but no, she didn't listen! Bruiser!
        + YOU: Bruiser Woods?
            Piiiietro: Yes, like that Bruiser, and I can't find it!
        + YOU: Gucci’s rosary?
            Piiiietro: Yes, a gift from my grandmother Scianel to celebrate my 16th birthday.
        + YOU: Snookie?
            Piiiietro: Sorry, I signed an non-disclosure agreement, that's all I can say.
        -
    Piiiietro: She'll be back, I hope. This planet looks tiny anyway, there won't be many other puppies.
    Piiiietro: Anyway, pleasure to meet you, I am Piiiietro, a math student. When I was fourteen years old, I solved the Collatz game.
    Piiiietro: At fifteen, the Navier-Stokes equations, but I haven't received the Fields medal yet because, after that Perel'man thing, they are afraid of messing up.
    Piiiietro: But you're not understanding a goddamn thing, are you?
        + YOU: Actually Perel'man used to copy from me in middle school.
        + YOU: I'm still thinking about the Gucci’s rosary.
        + YOU: No, but last week I got the change right at first try at the supermarket.
        -
    Piiiietro: Yeah, yeah, anyway, I’m pretty worried because my grandmother will kill me if I don't find the rosary, you know?
    Piiiietro: The whole family. They're all so religious, just think they have a holy card of Miuccia Prada with blinking eyes over the fireplace.
    Piiiietro: They forced me to study mathematics to demonstrate the existence of God.
        + YOU: And are you also a very good cook, then?
        -
    Piiiietro: Cook? What do you mean, cook?
        + YOU: Well, this is a cooking program, I think they kidnapped us, and so on…
        -
    Piiiietro: Aren't we on The Voice!!!?
        + YOU: Where should we sing? Over that huge gas stove?
        + YOU: I feel like I've been locked up tight, for a century of lonely nights, waiting for someone to release me…
        + YOU: No thanks, I'd rather have been really kidnapped.
        -
    Piiiietro: But I can merely cook a pasta dish with <b>stir</b>red <b>canned tuna</b>, the fuck am I doing here?
       ~ dialogue_ingredients_of_the_day += TonnoInScatola
        ~ dialogue_ingredients_of_the_day += Mescolare
    Piiiietro: Bruiser, Bruiser where are you? We've got to get out of here! See you later, or never!

    ->->


= quello_choice
    //Ingredienti suggeriti: burro e montare
    Quello: Hello lunar splendor! Don't you think this place is magnificent?
        + YOU: Do you know how you got here?
        + YOU: I think I saw a body earlier, just behind the camera. And it winked at me.
        + YOU: Still better than the Church of the Cult, I think.
        -
    Quello: I feel a little bit of pressure, you know? All these professional people, and me being just a little pastry chef, as Il Divo always reminds me. Very very very small. Worthless, almost.
        + YOU: Il Divo?
            Quello: Yes, my boss, a strict but loving man in his own way. He forced me to come here, so if I win the money, it goes to his restaurant.
        + YOU: Do you let him tell you these things?
            Quello: Every learner deserves the lesson of humility, don't you think?
        + YOU: The most complex thing I've ever cooked is a caprese, and I lost a finger because of that.
            Quello: Il Divo says it's important to always leave something of yourself in what you cook, you know?
        -
    Quello: Anyway pleasure, my name is That One. Sometimes it’s That One There, other times That Other One. People can be so creative.
    Quello: How will you try to impress Dogron?
        + YOU: Throwing him fur balls.
        + YOU: Escaping while all of you are cooking.
        + YOU: Fried eggs?
        -
    Quello: Woah, you have very clear ideas! I wanted to go for meringues, but Il Divo last time called them too meringue-y, and that's no good. He understands what's right in a blink of an eye!
    Quello: I only know how to make desserts, so I was thinking of taking some <b>butter</b> and a few other things, patiently <b>whip</b> everything by hand and make some simple macaroons.
    ~ dialogue_ingredients_of_the_day += Burro
    ~ dialogue_ingredients_of_the_day += Montare
        + YOU: Simple. Sure. Simple.
        -
    Quello: Now I'm going to go clean the nails of Il Divo: the poor guy can’t do that alone. See you later, it was nice talking to you. Talking, in general.    
    
    ->->


= il_divo_choice
    //Ingredienti suggeriti: zafferanno e mantecare
    ilDivo: No no, no Oprah for me, I certainly don't stoop to her level!
    ilDivo: Hey, hey you!
        + YOU: You're talking to me?
        -
    ilDivo: Yes, to you, there are no other people around. Ah no, yes, I was on the phone with the secretary. Again. Do you maybe have some <b>saffron</b>?
    ~ dialogue_ingredients_of_the_day += Zafferano
        + YOU: I'm going to ring my dealer in a second and tell you.
            ilDivo: Okay, check if he also has cocaine then.
        + YOU: Is that why you're all yellow?
            ilDive: Hey, I’m red. Did Dogron teach you the colors?
        + YOU: But rather, do you have any idea where we are?
            ilDivo: Useless intern. Always useless, Christ!
        -
    ilDivo: No no, I wasn't talking to you. Holy moly, listen, I'll talk to you later. And make sure you work those three hours of unpaid overtime that we agreed on, okay?!?!
    ilDivo: And clean the kitchen, I don't care if the restaurant is closed.
    ilDivo: Here I am, you're obviously wondering what I'm doing here.
        + YOU: You're talking to me?
        -
    ilDivo: And who else, lazybones!!!? I guess you want an autograph, right?
    ilDivo: Or my secret to <b>saute</b> my risotto alla milanese?
    ~ dialogue_ingredients_of_the_day += Mantecare
    ilDivo: Are you single?
    ilDivo: Ah, but don't waste my time. Look for That One, and bring me a couple of ounces of caviar and coke for my winning snack.

    ->->



=== day_one_kitchen

-> kitchen_loop(3, (Uova, Farina, Saltare, Sciogliere, Lievitare, Sale), -> day_two_lounge, 0)
