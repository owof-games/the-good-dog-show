=== day_two_lounge

-> inizio_lounge ->

@moveToDialogue character:{DOGRON}

DOGRON: But people friends, we are already on the second day of THE GOOD DOG (very very goooood dog!) SHOW!!! Aren't you super mega happy and wagging your tails!!!? Oh, hoooowwwww I would hate to see you all ever leave!
DOGRON: But if we didn't eliminate someone, how could we find a perfect replacement for, for, for the larger kitchen of Uuuuuranus?
DOGRON: And speaking of Uranus, today's theme is: a meal for when real friends come!
DOGRON: I'll give you a few minutes for chit-chat and then we're off!
    
-> lounge_loop(-> bebe_choice, -> ugo_e_mimi_choice, -> piiiietro_choice, -> quello_choice, -> il_divo_choice, -> day_two_kitchen)

= ugo_e_mimi_choice
    //Ingredienti suggeriti: Vol-au-vent e Skyrim
    UgoEMimi: Mimi, no, you're the one who doesn't understand! Kojima compared it to <b>Skyrim</b>! And Kojima is never wrong!
        ~ dialogue_ingredients_of_the_day += Skyrim
    UgoEMimi: Ugo, I don't want to contradict you, you know, but it was a dream!
    UgoEMimi: And you tell me that dreams lie, huh! Didn't you dream of cooking forever, and now you see where we are?
    UgoEMimi: My dream was to open an electrician's tool store, not to cook <b>vol-au-vents</b> every Saturday for your boorish friends!
     ~ dialogue_ingredients_of_the_day += VolAuVent
    UgoEMimi: Mimi, you're going too far now! And you know what happens when I get pissed off!
        + YOU: Mr. Hugh, so you are creating a video game?
            UgoEMimi: Oh, more than a video game, THE video game! It will be a stealth but not too much slasher shooter with 4X elements and a car race and resource management multiplayer mode with microtransactions, NFT and lots of DLC!
            UgoEMimi: But for now Ugo has only created the title and a cover with Paint.
        + YOU: Mrs. Mimi, so you're into electricality, is that what they say?
            UgoEMimi: A woman cannot be passionate about electricity, Mimi is only good at cleaning, cooking and ironing.
            UgoEMimi: In fact we only live in one house where I did all the grounding.
        + YOU: I don't know what you have, but in worship if you don't mind your own business you die badly. Bye.
        -

    ->->
    
    
= bebe_choice
    //Ingredienti: blocchi d'erba e uova di pecora (sacrificio)
    BeBe: Well, hello there! Who would have thought I would survive the first day? Nella didn't make it.
    {not day_one_lounge.bebe_choice: BeBe: Anyway, I didn't get a chance to introduce myself yesterday, I'm BeBe, single mother of eight, er, seven little lambs.}
        + You: Lala?
            BeBe: A long history, a long long history.
        + YOU: Why are you walking around with a cleaver?
            BeBe: Cleaver? What cleaver?
        + YOU: I feel sorry for those who got out. But sorry, who got out!!!
            BeBe: Do you think I remember the names of all of you, with my lambs at home?
        -
    BeBe: But let's talk about good things, given today's theme: do you have people friends waiting for you? I only have my eight, uh, seven daughters, and I'm their best friend.
    BeBe: The best mom and friend there is. I would do anything for them!
        + YOU: Of course, if you are convinced of it.…
        + YOU: I have Kitty waiting for me at home, she is my life.
        + YOU: There are a few people in the cult that I get along with, you know? But not too many.
        -
        + YOU: Do you have any secret recipes to focus on today?
        -
    BeBe: If I told you, it wouldn't be secret, would it?
    BeBe: Just kidding, if the theme is "food for friendly people," of course I agree.
    BeBe: And you are a friend to me aren't you?
        + YOU: Of course I do!
        + YOU: (lie) Of course I do!
        + YOU: (ironically) Of course I do!
        -
    BeBe: That reassures me. I don't like people who take me by the ears.
    BeBe: Anyway, I was thinking, what is true friendship? And of course I thought about my eight, er, seven daughters. And what do they love to do when we're all together? Video games!
    BeBe: It amuses me a lot when they say in an affectionate way, "No mom, don't play with us tonight, please!" They are so tender.
    BeBe: And so I was thinking of making baskets with fried <b>grass blocks</b>, and <b>sheep eggs</b>.
    ~ dialogue_ingredients_of_the_day += BlocchiDiErba
    ~ dialogue_ingredients_of_the_day += UovaDiPecora
        + YOU: Sheep eggs?
        -
    BeBe: Sure. In friendship, sacrifice is important!!!
    BeBe: But now I have to go brood for a moment. See you later!
        + YOU: Um, later.
        -

    ->->

    
= piiiietro_choice
    //Ingredienti: tonno in scatola e scolare
    Piiiietro: <b>Canned tuna</b>, <b>drain</b>.
        ~ dialogue_ingredients_of_the_day += TonnoInScatola
        ~ dialogue_ingredients_of_the_day += Scolare
        + YOU: I beg your pardon?
        + YOU: Ah, great, see you later.
        ->->
        + YOU: Is that all you can cook?
        -
    Piiiietro: That I saw yesterday that you were watching what I was cooking. They all do that, copying other people's work, and then.
        + YOU: It may surprise you, but I cook even worse than you do.
            Piiiietro: Let's not exaggerate, I saw what you brought up yesterday!
        + YOU: Did you then find your dog?
            Piiiietro: No, and I found his Russian sable fur coat abandoned behind an armchair.
            Piiiietro: But he always does this when I forbid him to go on vacation somewhere.
        + YOU: But the rosary then?
            Piiiietro: I think I saw it on Dogron, I'll have to investigate further.
        -
    Piiiietro: However, yesterday the production told me that I can't leave, that I signed a contract, and that if the mistake is my agent's it doesn't change anything to them.
        + YOU: Agent?
        -
    Piiiietro: Math agent. We do challenges like rap, but with equations. It doesn't look like it but it's super tiring, last year two contestants died of dehydration just to finish, oh, I don't even remember what, I always win anyway.
    Piiiietro: I'm so good at math.
    Piiiietro: But now I say goodbye, that I have to fix the diamonds on my teeth before the episode.
    {not day_one_lounge.piiiietro_choice: Piiiietro: Ah, we didn't introduce ourselves yesterday: my name is Piiiietro.}

    ->->

        
= quello_choice
    //Ingredienti: lacrime e cacao amaro
    {not day_one_lounge.quello_choice: Quello: Hello! I am That One, or It, sometimes. I was watching you cook yesterday and woah, you're doing great!}
    Quello: I'm kind of struggling today, you know?
    Quello: All my "real friends" are dead, you know?
        + YOU: But like that dinosaur joke?
        + YOU: This is the time when I have to say I'm sorry, right?
        + YOU: I saw a very friendly sheep earlier. If you want to talk to her…
        -
    Quello: I won't bore you with this sad story, I promise. I can't help but think of recipes that don't have <b>tears</b> in them, though. Lots.
    ~ dialogue_ingredients_of_the_day += Lacrime
        + YOU: Don't they spoil the flavor?
        -
    Quello: It depends. With <b>bitter cocoa</b>, the salty goes well with it. I might make a cake.
    ~ dialogue_ingredients_of_the_day += CacaoAmaro
    Quello: A cake not to be shared with any person.
    Quello: Except for Il Divo, which he would never eat, however, because it would gross him out on trust. And he's right.
    Quello: Sorry, sadness is forbidden by the labor contract. See you later, good luck!

    ->->

    
= il_divo_choice
    //Ingredienti: specchiarsi e scottare
    ilDivo: I get that it's the Pope, but it can wait, that I have to open a new office in Dubai before lunch, alright!!!?
        + YOU: But why do I persist in talking to this?
        -
    ilDivo: Why hello gorgeous! Have we met?
        + {day_one_lounge.il_divo_choice} YOU: We talked together yesterday, like. Oprah, the cocaine, the saffron?
        + {not day_one_lounge.il_divo_choice} YOU: I haven't had the luck yet, no.
        -
    ilDivo: They call me il Divo, but that's an understatement. He thinks the White House has a portrait of me, so to speak.
    ilDivo: Wikipedia has my picture under the definition of "Cool," not as the obvious preposition but what am I telling you that you may not have been in middle school but I already asked you, are you single?
        + YOU: Yes, and every time I meet a man I remember why.
        + YOU: No, I have someone waiting for me at home, but I don't know how to get back!
        + YOU: I think I have a crush on one of the people here in the studio.
        -
    ilDivo: Of course you then fall in love with me, of course. Bella Hadid decided not to <b>mirror</b> herself after she saw me.
        ~ dialogue_ingredients_of_the_day += Specchiarsi
    ilDivo: But then life is difficult.
    ilDivo: Because they tell you, "Hey, how fortunate to be a species with 23000 different sexual genders, it must be a great bazaar," but then we have binary things too, and I end up falling in love, and…
    ilDivo: What am I telling you? I'm <b>hot</b> stuff baby, you can't just grab me like that! And now I have to work, work, produce, fill in the blank! Get out!
        ~ dialogue_ingredients_of_the_day += Scottare

    ->->
    
    
=== day_two_kitchen

-> kitchen_loop(3, (Braciola, Arrosticino, Costina, Osso, Grigliare, Crocchette, Versare, Riempire), -> day_three_lounge, 0)
