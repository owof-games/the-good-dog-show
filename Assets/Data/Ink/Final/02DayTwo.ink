=== day_two_lounge

-> inizio_lounge ->

@moveToDialogue character:{DOGRON}

DOGRON: Ma persone amiche, siamo già alla seconda giornata di THE GOOD DOG (very very good dog!) SHOW!!! Non siete suuuuuupermegafelici e scodinzolanti?!? Oh, quanto non vorrei vedervi mai andare via!
DOGRON: Ma se non eliminassimo qualcuno, come potremmo trovare un sostituto perfetto per, per, per la cucina più grande di Urano?
DOGRON: E a proposito di Uuuuuuuurano, il tema di oggi è: un pasto per quando vengono i veri veri amici!
DOGRON: Vi lascio qualche minuto per le chiacchiere e poi si parte!
    
-> lounge_loop(-> bebe_choice, -> ugo_e_mimi_choice, -> piiiietro_choice, -> quello_choice, -> il_divo_choice, -> day_two_kitchen)

= ugo_e_mimi_choice
    //Ingredienti suggeriti: Vol-au-vent e Skyrim
    UgoEMimi: Mimi, no, sei tu che non capisci! Kojima l'ha paragonato a <b>Skyrim</b>! E Kojima non sbaglia mai!
        ~ dialogue_ingredients_of_the_day += Skyrim
    UgoEMimi: Ugo, non amo contraddirti, lo sai, ma era un sogno!
    UgoEMimi: E mi dici che i sogni mentono, eh?! Non sognavi di cucinare per sempre, e ora vedi dove siamo?
    UgoEMimi: Il mio sogno era aprire un negozio di attrezzi per elettricisti, non cucinare <b>vol-au-vent</b> tutto il sabato per quei buzzurri dei tuoi amici!
     ~ dialogue_ingredients_of_the_day += VolAuVent
    UgoEMimi: Mimi, stai esagerando, ora! E sai cosa succede quando mi incazzo!
        + YOU: Signor Ugo, quindi sta creando un videogioco?
            UgoEMimi: Oh, più di un videogioco, IL videogioco! Sarà uno sparatutto slasher stealth ma non troppo con elementi 4X e una gara di macchine e gestione delle risorse in modalità multiplayer con microtransazioni, NFT e un sacco di DLC!
            UgoEMimi: Ma per ora Ugo ha creato solo il titolo e una cover con Paint.
        + YOU: Signora Mimi, quindi è appassionata di elettricismo, si dice così?
            UgoEMimi: Una donna non può appassionarsi di elettricità, Mimì è brava solo a pulire, cucinare e stirare.
            UgoEMimi: Infatti viviamo solo in una casa dove ho fatto tutte le messe a terra.
        + YOU: Non so cosa abbiate, ma nel culto se non ti fai i cazzi tuoi muori male. Ciaone.
        -

    ->->
    
    
= bebe_choice
    //Ingredienti: blocchi d'erba e uova di pecora (sacrificio)
    BeBe: Ma ciao! Chi l'avrebbe mai detto che sarei sopravvissuta al primo giorno? Nella non ce l'ha fatta.
    {not day_one_lounge.bebe_choice: BeBe: Comunque ieri non ho avuto modo di presentarmi, sono BeBe, madre single di otto, ehm, sette agnelline.}
        + YOU: Nella?
            BeBe: Una lunga storia, una lunga lunga storia.
        + YOU: Perché giri con una mannaia?
            BeBe: Mannaia? Quale mannaia?
        + YOU: Mi dispiace per chi è uscito. Ma scusa, chi è uscito?!?
            BeBe: Secondo te mi ricordo i nomi di tutti voi, con le mie agnelline a casa?
        -
    BeBe: Ma parliamo di cose belle, visto il tema di oggi: hai persone amiche che ti aspettano? Io ho solo le mie otto, uh, sette figlie, e sono la loro migliore amica.
    BeBe: La migliore mamma e amica che ci sia. Farei di tutto per loro!
        + YOU: Certo, se ne sei convinta tu...
        + YOU: Ho Micia che mi aspetta a casa, lei è la compagna della mia vita.
        + YOU: Ci sono un po' di persone nel culto con cui vado d'accordo, sai? Ma non troppe.
        -
        + YOU: Hai qualche ricetta segreta su cui puntare, oggi?
        -
    BeBe: Se te la dicessi, non sarebbe segreta, non trovi?
    BeBe: Scherzo, se il tema è "cibo per persone amiche" è ovvio che condivido.
    BeBe: E tu sei una persona amica per me vero?
        + YOU: Ceeerto che sì!
        + YOU: (menti) Ceeeerto che sì!
        + YOU: (ironicamente) Ceeerto che sì!
        -
    BeBe: Questo mi rassicura. Non amo le persone che mi prendono per gli zoccoli.
    BeBe: Comunque, pensavo: cos'è la vera amicizia? E ovviamente ho pensato alle mie otto, ehm, sette figlie. E cosa amano fare quando siamo tutte assieme? I videogiochi!
    BeBe: Mi diverte un sacco quando dicono in modo affettuoso "No mamma, non giocare con noi stasera, ti preghiamo!". Sono così tenere.
    BeBe: E quindi pensavo di fare dei cestini con dei <b>blocchi d'erba</b> fritti, e le <b>uova di pecora</b>.
    ~ dialogue_ingredients_of_the_day += BlocchiDiErba
    ~ dialogue_ingredients_of_the_day += UovaDiPecora
        + YOU: Uova di pecora?
        -
    BeBe: Certo. In amicizia il sacrificio è importante!
    BeBe: Ma ora devo andare un attimo a covare. A dopo!
        + YOU: Ehm, a dopo.
        -

    ->->

    
= piiiietro_choice
    //Ingredienti: tonno in scatola e scolare
    Piiiietro: <b>Tonno in scatola</b> e <b>scolare</b>.
        ~ dialogue_ingredients_of_the_day += TonnoInScatola
        ~ dialogue_ingredients_of_the_day += Scolare
        + YOU: Come, scusa?
        + YOU: Ah, perfetto, a dopo.
        ->->
        + YOU: Non sai cucinare altro?
        -
    Piiiietro: Che ho visto ieri che guardavi cosa stavo cucinando. Fanno tutte così, a copiare il lavoro delle altre persone, e poi.
        + YOU: Potrebbe sorprenderti, ma cucino persino peggio di te.
            Piiiietro: Non esageriamo, ho visto cosa hai tirato fuori ieri!
        + YOU: Hai trovato poi il tuo cane?
            Piiiietro: No, ma ho trovato la sua pelliccia di zibellino russo abbandonata dietro una poltrona.
            Piiiietro: Ma fa sempre così, quando gli vieto di andare in vacanza da qualche parte.
        + YOU: Ma il rosario poi?
            Piiiietro: Credo di averlo visto addosso a Dogron, dovrò indagare meglio.
        -
    Piiiietro: Comunque ieri la produzione mi ha detto che non me ne posso andare, che ho firmato un contratto, e che se l'errore è del mio agente a loro non cambia nulla.
        + YOU: Agente?
        -
    Piiiietro: Agente matematico. Facciamo sfide tipo come il rap, ma a suon di equazioni. Non sembra ma è superfaticoso, l'anno scorso due concorrenti sono morti disidratati pur di finire, oh, non ricordo manco cosa, tanto vinco sempre.
    Piiiietro: Sono così brava in matematica.
    Piiiietro: Ma ora ti saluto, che devo sistemare i diamantini sui denti prima dell'episodio.
    {not day_one_lounge.piiiietro_choice: Piiiietro: Ah, ieri non ci siamo presentate: mi chiamo Piiiietro.}

    ->->

        
= quello_choice
    //Ingredienti: lacrime e cacao amaro
    {not day_one_lounge.quello_choice: Quello: Ciao! Io sono Quello, o Quello Lì a volte. Ti guardavo cucinare ieri e woah, te la cavi benissimo!}
    Quello: Io sono un po' in difficoltà oggi, sai?
    Quello: Tutti i miei "veri amici" sono morti, sai?
        + YOU: Ma come quella battuta sui dinosauri?
        + YOU: Questo è il momento in cui devo dire che mi dispiace, vero?
        + YOU: Ho visto una pecora molto amichevole prima. Se vuoi parlare con lei...
        -
    Quello: Non ti ammorbo con questa storia triste, promesso. Però non riesco a non pensare a ricette che non abbiano delle <b>lacrime</b>, sai? Un sacco.
    ~ dialogue_ingredients_of_the_day += Lacrime
        + YOU: Non rovinano il sapore?
        -
    Quello: Dipende. Con il <b>cacao amaro</b> il salato ci sta bene. Potrei fare una torta.
    ~ dialogue_ingredients_of_the_day += CacaoAmaro
    Quello: Una torta da non dividere con nessuna persona.
    Quello: A parte il Divo, che non mangerebbe però mai, perché gli farebbe schifo sulla fiducia. E ha ragione, sai?
    Quello: Scusa, la tristezza è vietata dal contratto di lavoro. A dopo, in bocca al lupo!

    ->->

    
= il_divo_choice
    //Ingredienti: specchiarsi e scottare
    ilDivo: Ho capito che è il Papa, ma può pure aspettare, che c'ho da aprire una nuova sede a Dubai prima di pranzo, va bene?!?
        + YOU: Ma perché mi ostino a parlare con questo?
        -
    ilDivo: Ma ciao splendore! Ci conosciamo?
        + {day_one_lounge.il_divo_choice} YOU: Abbiamo parlato ieri assieme, tipo. Oprah, la bamba, lo zafferano?
        + {not day_one_lounge.il_divo_choice} YOU: Non ho ancora avuto la sfortuna, no.
        -
    ilDivo: Mi chiamano il Divo, ma è un eufemismo. Pensa che alla Casa Bianca hanno un mio ritratto, così per dire.
    ilDivo: Sulla Treccani c'è la mia foto sotto la definizione di "In", non come la preposizione ovvio ma che te lo dico che forse non hai fatto le medie ma te l'ho già chiesto, sei single?
        + YOU: Sì, e ogni volta che incontro un uomo mi ricordo perché.
        + YOU: No, ho la gatta che mi aspetta a casa, ma non so come tornarci!
        + YOU: Credo di avere una cotta per una delle persone qui in studio.
        -
    ilDivo: Ovvio che poi ti innamori di me, ovvio. Bella Hadid ha deciso di non <b>specchiarsi</b> più dopo che mi ha visto.
        ~ dialogue_ingredients_of_the_day += Specchiarsi
    ilDivo: Però poi la vita è difficile.
    ilDivo: Perché ti dicono "Ehi, che fortuna essere una specie con 23000 generi sessuali diversi, deve essere una gran bazza", ma poi anche da noi ci sono cose binarie, e finisce che io mi innamoro, e...
    ilDivo: Ma che ti sto a dire? Io sono roba che <b>scotta</b> baby, mica mi puoi agguantare così! E ora devo lavorare, lavorare, produrre, riempire il vuoto! Vattene!
        ~ dialogue_ingredients_of_the_day += Scottare

    ->->
    
    
=== day_two_kitchen

-> kitchen_loop(3, (Braciola, Arrosticino, Costina, Osso, Grigliare, Crocchette, Versare, Riempire), -> day_three_lounge, 0)