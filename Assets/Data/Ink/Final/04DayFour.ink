=== day_four_lounge

-> inizio_lounge ->

@moveToDialogue character:{DOGRON}

DOGRON: Coda, vieni qua! Coda, coda! Fermati! Cattiva coda, cattiva!
DOGRON: Ah, siamo in onda?
DOGRON: Benvenute alla quarta e penuuuuuultima puntata di THE VERYSSIMAMENTE GOOD DOGGO BUONO BUONO DOGGO BUONO! E SHOW! Qui è il vostro conduttore preferito, vero che sono il vostro conduttore preferito?
DOGRON: Chi è il conduuuuttore più bravo al mondo? Chi è?
DOGRON: Il tema di oggi ci riguarda tutte. Quel tema che ti viene in mente quando la tua tazza preferita si rompe, o le crocchette sono nuuuuuove e hanno un sapore inaspettato o il postino ha una divisa pulita.
DOGRON: O quando prendono un cuuuuuucciolo e ti dicono che tutto rimarrà come prima ma non è vero, quel cucciolo inizia a camminare, ad andare a stuuudiare e tu ti ci sei affezionato e luuuuuuuuui si dimentica di te.
DOGRON: Il tema di oggi è il cambiamento, qualcosa per accettare il cambiamento.
DOGRON: Un'altra grande idea della Suprema Chihuahua e del Consiglio dei Carlini.
{LIST_COUNT(alive_characters) == 1:
DOGRON: E il consiglio dei Carlini ha per voi questo indovinello.
DOGRON: Suprema nel cuore, Balenciaga nella mia voce, Myrtle è il mio nome.
DOGRON: Uuuuh, dov'è l'indovinello?
}
DOGRON: Potete chiacchierare un attimo tra voi, e poi iniziamo a cucinare.
DOGRON: Vieni qui, coda!

~ character_variants += MIMI

-> lounge_loop(-> bebe_choice, -> ugo_e_mimi_choice, -> piiiietro_choice, -> quello_choice, -> il_divo_choice, -> day_four_kitchen)


= ugo_e_mimi_choice
    //INGREDIENTI: Mazinga e Le orecchie di Ugo
    UgoEMimi: Ma ciao, splendore!
        + YOU: Signora Mimi, noto qualcosa di diverso!
        -
    UgoEMimi: Uh, sarà il taglio di capelli. Mi sono ispirata a Venusia di <b>Mazinga</b>. Uh, sai che avevo una cotta per Tetsuya?
            ~ dialogue_ingredients_of_the_day += Mazinga
        + YOU: Aveva il suo perché con quel ciuffo.
        + YOU: Ma il signor Ugo?
        + YOU: No, intendevo il fatto che le manca una testa, tipo.
        -
    UgoEMimi: Oggi mi sento così leggera, sai? Non mi capitava da tempo. Prima mi son messa a saldare un po' di prese elettriche, e ho aiutato la cameraman con un problema ai suoi circuiti androidici.
    UgoEMimi: E per celebrare il cambiamento, come richiesto da Dogron e i suoi amici cani, credo farò una pasta con le cime di rapa e le <b>orecchie di Ugo</b>.
            ~ dialogue_ingredients_of_the_day += OrecchieUgo
            + YOU: Ricordo le dita di Ermenegildo, coi funghi furono una bomba.
            + YOU: Forse conviene sentir prima che ne pensa la giuria?
            + YOU: Il signor Ugo ne sentirà la mancanza?
            -
    UgoEMimi: Ma ora vado, tesorino, che ho un appuntamento con una certa androide. A dopo!        
    
    ->->

    
    = bebe_choice
    //Ingredienti: avvelenare e collare con un'etichetta: DOGRON
    BeBe: Accettare, certo. Ha ragione.
        + YOU: Tutto bene, Bebe?
        -
    BeBe: Sì sì sì, sono solo di fretta. Il cambiamento, è importante accogliere il cambiamento. Cambiare, per le mie otto, no, sette figlie. Sette.
        + YOU: Come mai citi sempre le tue figlie?
        -
    BeBe: Perché il dovere di ogni madre è proteggerle. E se fallisce, vendicarsi. Essere il cambiamento che vuoi vedere nel mondo.
        + YOU: Mi devo preocuppare?
        -
    BeBe: No, tu no. Ma oggi porterò una ricetta davvero speciale, sai? Il cambiamento richiede un rischio, e per questo userò della cicuta. Un poco di <b>veleno</b>, scommettendo su quanto possa essere fatale. E il <b>collare</b> dell'assassino.
    ~ dialogue_ingredients_of_the_day += Avvelenare
    ~ dialogue_ingredients_of_the_day += CollareConEtichetta
        + YOU: Ehm, credo di aver lasciato il gatto nel forno.
        + YOU: Forse l'aria del pianeta ti sta facendo male?
        + YOU: Ma stai sgocciolando latte?
        -
    BeBe: Accettare. Bisogna accettarlo tutto. A dopo, ciao.    

    ->->

    
    = piiiietro_choice
    //Ingredienti: Tonno in scatola al naturale (più punti) e cantare
    Piiiietro: Alla fine, se ne è andato.
        + YOU: Chi?
        -
    Piiiietro: Bruiser. Mi ha lasciato una lettera, dicendomi che ha trovato una Chihuahua Suprema, e che vivrà con lei. Che ha mandato un gatto di servizio e recuperare le sue ciotole zebrate e la cuccia di raso e diamanti, e mi invita a non cercarlo.
    Piiiietro: Mi ringrazia per questi anni passati assieme, ma crede sia arrivato per lui il momento di stare con qualcuno che non si nasconde agli altri. Che non finga di essere infinito, dice.
        + YOU: Che intende?
        + YOU: Come diceva nonna, è importante andare dove la ciotola è piena.
        + YOU: Bruiser sa scrivere?!?
        -
    Piiiietro: Ha ragione, sai? Tu, tu ti mostri per come sei, al mondo?
        + YOU: Insomma, se le persone vedessero le doti che ho preso dal mio padre antico, verrebbero rese cieche dalla follia.
        + YOU: Nel Culto ho imparato a nascondere chi sono, così da poter ottenere tutto.
        + YOU: Una volta ci ho provato. Molto alcool, polizia, qualche giorno in cella per atti osceni in luogo pubblico. Povera pecora.
        -
    Piiiietro: Cavolo, hai avuto una vita interessante!
    Piiiietro: La mia... Bruiser forse ha ragione, sai? Non mi vivo davvero. Devo, devo dire delle cose ad alta voce. Ma mi fa così paura farlo, cazzo.
        + YOU: Siamo state rapite, siamo su un pianeta grosso come un negozio Ikea, non sapremo cosa sarà di noi domani. Se non le dici oggi, quando?
            Piiiietro: Ma è difficile!
        + YOU: Avrei un impegno...
            Piiiietro: Due minuti!
        + YOU: BeBe mi sembra una portata all'ascolto, sai?
            Piiiietro: Quando deve dire il mio nome però si incarta.
        -
    Piiiietro: Stasera accoglierò anche io il cambiamento, sai? Come Bruiser. Basta con pasta al tonno in scatola. Farò della pasta con <b>tonno in scatola al naturale</b>! E lo presenterò <b>cantando</b>.
       ~ dialogue_ingredients_of_the_day += TonnoAlNaturale
        ~ dialogue_ingredients_of_the_day += Cantare
    Piiiietro: Uh, l'ho detto. Devo correre ora, a dopo!

    ->->

    
    = quello_choice
    //Ingredienti: perdonare e evolversi
    Quello: Fatti dare un abbraccio!
        + YOU: Ti trovo benissimo, Quello!
        + YOU: Mmm, prima levati la polvere.
        + YOU: Ehm, dove metto la mano destra?
        -
    Quello: Non me l'aspettavo, ma questo percorso sta diventando un vero viaggio, sai? Un viaggio verso il <b>perdonare</b> anche chi ti ha ferito.
    ~ dialogue_ingredients_of_the_day += Perdonare
    Quello: Come il perdonare mio padre. Non ha inventato i roomba contro di me, contro di noi.
    Quello: Sono state le persone, pigre, a liberarsi di noi aspirapolveri a favore di quei, quelli che sono forse miei fratelli, non trovi?
        + YOU: Sento solo una grande confusione in testa, ora.
        + YOU: Ma quindi non è il Divo tuo padre?
        + YOU: Non ho mai pulito casa mia, non so di cosa tu stia parlando.
        -
    Quello: E poi bisogna <b>evolversi</b>. Credo, oh, è sciocco, sai?
    ~ dialogue_ingredients_of_the_day += Evolversi
        + YOU: Quello, credo sia sciocca tutta questa situazione, se non ridicola.
        + YOU: "Sciocco" è uccidere per sbaglio Ermenegildo, e poi dimenticarsene, e portarlo a Gardaland e parlarci tutto il giorno e pagare pure il biglietto!
        + YOU: Il mio cervello mi sta colando dalle orecchie ormai.
        -
    Quello: Non riuscivo a perdonare mio padre, e così ne ho cercato un altro. Ho riposto le mie energie, la mia fiducia nel Divo. Un altro uomo arrogante.
    Quello: Ma io sono una persona valida in me, non trovi? Anche se ci hanno gettato tutti nei cassonetti. Anche se mio padre ha creato qualcosa per sostituirci tutti. Anche se il Divo non mi darà mai la sua approvazione.
    Quello: IO sono quello che deve approvarsi, e basta.
        + YOU: Profondo, fratello!
        + YOU: Nel Culto questo è pensiero sovversivo, sai?
        + YOU: E me, chi mi approva? Tu? Dogron? Chi?!?!?
        -
    Quello: Ora vado dal Divo, e gli dico che mi licenzio. E poi, vincerò questo programma!    
        
    ->->

    
    = il_divo_choice
    //Ingredienti: iomestessomemedesimo e #selfcare
        ilDivo: Uh, la persona concorrente che preferisco! Come stai?
            + YOU: Mi ritrovo qui senza capire come. Sto andando avanti e non capisco in cosa. Come dovrei stare?!?
            + YOU: Credo di aver appena visto un cetriolo fare una dichiarazione d'amore a un cameraman morto.
            + YOU: Non l'avrei mai detto, ma mi manca il Culto. I riti, i morti, il sangue, le fughe dagli esorcisti.
            -
        ilDivo: Sicuramente hai una vita favolosa, vero?
        ilDivo: Ma mai quanto la mia!
            + YOU: Te pareva.
            -
        ilDivo: Ho trovato il vero amore. Qui, su questo minuscolo pianeta, ho capito tutto. Mi sono fermato un attimo, un tiro di bamba e un momento di <b>hashtag selfcare</b> ed eccolo lì, il vero amore della mia vita!
            ~ dialogue_ingredients_of_the_day += SelfCare
            + YOU: Quello?
            + YOU: Bruiser?
            + YOU: Il cadavere di Ermenegildo?
            -
        ilDivo: <b>Io, me stesso,me medesimo</b>. C'è un unico grande amore in questa vita, e posso solo essere io. Solo!
            ~ dialogue_ingredients_of_the_day += IoMeStessoMedesimo
        ilDivo: Vuoi celebrare il mio matrimonio con me stesso?
            + YOU: Mi dispiace ma devo farmi cavare le orecchie prima di continuare questo spettacolo.
            + YOU: Non posso, devo farmi cascare un riflettore in testa e sperare di morire.
            + YOU: Certo, dopo aver fatto il bagno col mio amato tostapane.
            -
        ilDivo: Quanto mi sento amato!    
        
        ->->
        
        
=== day_four_kitchen
{LIST_COUNT(alive_characters) == 1:
~ dialogue_ingredients_of_the_day += Balenciaga
~ dialogue_ingredients_of_the_day += Myrtle
}

-> kitchen_loop(4, (Pettorina, Trasportino, Veterinario, Automobile, Viaggiare, Inconscio, CorrereNeiSogni), -> day_five_lounge, 3)