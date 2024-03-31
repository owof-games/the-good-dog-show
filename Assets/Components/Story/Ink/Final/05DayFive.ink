=== day_five_lounge

-> inizio_lounge ->

@moveToDialogue character:{DOGRON}

DOGRON: No no no amiche, non sono lacrime quelle che vedete, è solo allergia al fatto che è l'uuuultima puntata.
DOGRON: Sob.
DOGRON: L'ultima puntata di THE VERYSSIMAMENTE GOOD DOGGO BUONO BUONO DOGRON BUONO, QUALCUNO DICA A DOGRON CHE è BUUUUUUUUUUONO SHOWWWWW e si merita un pat-pat. U-u-u-u-uuuno!
DOGRON: Vi ricordo, finaliste, che in palio c'è la possibilità di avere un proprio mega ristorante su Nettuuuuuuuuuuuuuuuuuuuno.
DOGRON: casualmente vicinissimo alla mia casetta senza uuuumani, e a quella del Grande Consiglio dei Carlini e della Suprema Chihuahua.
DOGRON: Noi brave dogghe, si si.
DOGRON: E per questo il tema di oggi, l'ultimo grande tema è:
DOGRON: Un piatto che gridi al mondo che sei la migliore genitora per dogghe al mondo!
DOGRON: Scaldate i motori, e che vinca la miglior dog queen!

-> lounge_loop(-> bebe_choice, -> ugo_e_mimi_choice, -> piiiietro_choice, -> quello_choice, -> il_divo_choice, -> day_five_kitchen)


= ugo_e_mimi_choice
    //INGREDIENTI SUGGERITI: sventrare, emancipazione, MichelaMurgia
    UgoEMimi: Quindi: "Accabadora", "Stai zitta!", "God Save the Queer"...
        + YOU: Sta pregando, signora Mimi?
        -
    UgoEMimi: Ah ah no tesoro, no. Stavo controllando la lista di libri che mi aveva consigliato BeBe a inizio programma, tutti titoli di <b>Michela Murgia</b>.
    ~ dialogue_ingredients_of_the_day += MichelaMurgia
    UgoEMimi: Davvero in gamba quella Bebe, così indipendente. L'avessi conosciuta anni fa, avrei capito prima cosa significa <b>emanciparsi</b>.
    ~ dialogue_ingredients_of_the_day += Emancipazione
    UgoEMimi: Anche se lo <b>sventramento</b> di Ugo non mi è dispiaciuto.
        ~ dialogue_ingredients_of_the_day += Sventrare
        + YOU: Quindi l'ha davvero ucciso?
            UgoEMimi: Per Ugo, eravamo alla morte celebrale già da decenni, tesorino.
        + YOU: Quindi l'abbiamo mangiato ieri?
            UgoEMimi: Poco poco, spero non vi sia stato indigesto.
        + YOU: Quindi potrebbe darmi due dritte se avessi un problema simile?
            UgoEMimi: Non sarebbe mai esattamente lo stesso problema, visto che non vedo una seconda testa attaccata al tuo collo, ma la carne è pur sempre carne, no?
        -
    UgoEMimi: Fa strano che questo percorso stia finendo, sai? Quante cose sono cambiate!
        + YOU: Ora aprirà il suo negozio di elettricista?
        -
    UgoEMimi: Ancora non lo so. Credo di volermi prendere un anno sabbatico. Soldi, sesso, viaggi. Reiniziare la vita a 96 anni può essere un'esperienza esaltante.
    UgoEMimi: Ma prima devo batterti in quest'ultima giornata. A dopo tesoro!
    
    ->->

    
= bebe_choice
    //Ingredienti suggeriti: sacrificio, Peanutbutter, giocattoloPreferito
    @setCharacterVariant variant:{BeBenator}
    BeBe: Questa sì che è pace.
        + YOU: Che hai fatto al tuo pelo?
            BeBe: Un tributo, un grande tributo.
        + YOU: Cosa c'è sulle tue zampe?
            BeBe: Ciò che avrebbe dovuto esserci da sempre.
        + YOU: Perché hai quest'aria da dominatrix?
            BeBe: Allora inchinati a me, e prega.
        -
    BeBe: Ho capito tutto, sai? Perché sono qui.
    BeBe: Cioè, sapevo perché ero qui, ma non pensavo sarebbe stato necessario tutto questo. Tutto.
    BeBe: Tutti questi sacrifici.
        + YOU: Nel Culto anche noi facciamo un sacco di sacrifici. Poi è una palla pulire però.
        + YOU: Non ti sto seguendo. Perché sei rasata? Perché le zampe son piene di sangue? Perché mi sento su di giri?!?
        + YOU: Forse è il caso che me ne vada.
        -
    BeBe: Oggi è l'ultimo giorno. Come ti senti?
        + YOU: Non pensavo ce l'avrei fatta.
        + YOU: Vincerò quest'ultima sfida, garantito al limone!
        + YOU: Spero che Micia non abbia evocato di nuovo Pazuzo in mia assenza.
        -
    BeBe: Comunque vada, son felice di questo incontro, di questo percorso con te. Oggi porterò qualcosa di inaspettato, a DOGRON. Qualcosa che lo lascerà tremolante, terrorizzato.
        + YOU: Tipo?
        -
    BeBe: Tre doni, come i Re Magici. Come le Destiny's Child. Una storia, in fondo. Una pasta al forno, ma la pasta sarà <b>Peanutbutter</b>, il sugo il <b>giocattolo preferito</b> di DOGRON, e il forno, il <b>sacrificio</b>. Il suo.
    ~ dialogue_ingredients_of_the_day += PeanutButter
    ~ dialogue_ingredients_of_the_day += GiocattoloPreferito
    ~ dialogue_ingredients_of_the_day += Sacrificio
    BeBe: Nella, ti vendicherò finalmente!
        + YOU: Vuoi uccidere DOGRON?
        + YOU: Perché non l'hai fatto prima?
        + YOU: Nella?
        -
    BeBe: Mi libererò di lui. Mi servivano le prove. Mi serviva sapere che è stato lui a trasformare Nella, la mia dolce Nella, in una busta di arrosticini.
    BeBe: Il tempo del perdono è finito. Ora è giusto il momento di Beberminator!
    BeBe: Ci vediamo dall'altra parte!
        + YOU: Dove sono? Dove cazzo sono?!?!?

    ->->

    
= piiiietro_choice
    //Ingredienti: Kate Bush, l'idea di successo, cassaPortatile
    Piiiietro: Ehi, ti stavo cercando. Volevo ringraziarti, sai?
        + YOU: Uh, davvero?
        -
    Piiiietro: Sì. Vedere qualcuno fallire così grandiosamente tutto e nemmeno rendersene conto, è stato liberatorio. Cioè: se una persona può vivere comunque immersa in così tanta mediocrità, posso pure rinunciare all'<b>idea del successo</b> e prendermi qualche rischio.
       ~ dialogue_ingredients_of_the_day += IdeaDiSuccesso
        + YOU: Grazie, credo?
        + YOU: Senti, perché non vai un po' a fanculo?
        + YOU: Ehi, io ce la sto mettendo tutta!!!
        -
    Piiiietro: Poi, insomma. Quanta gente può dire di avere una canzone dedicata da <b>Kate Bush</b>?
       ~ dialogue_ingredients_of_the_day += KateBush
    Piiiietro: Anche se sono sempre stata una da Gigi D'Agostino e Gabry Ponte.
        + YOU: Faccio ancora parte di questa conversazione, o è un monologo?
        + YOU: Che gusti da truzza!
        + YOU: "Che ne sanno i 2000" batte "Bocca di Rosa" 10 a 1.
        -
    Piiiietro: Anche per questo volevo fossi tu la prima persona a saperlo: lascio la matematica.
    Piiiietro: E tu dirai: Piiiietro ma sei una pi greco, che senso ha, che altro puoi fare?
    Piiiietro: E io ti direi: non calpestare i miei sogni! Perché sono nata per cantare, per andare in giro con la mia <b>cassa portatile</b>, il mio album degli Eiffel 65 e cantare in giro per il mondo!
       ~ dialogue_ingredients_of_the_day += CassaPortatile
        + YOU: Cantare? Cosa c'è da cantare in Blue dabudidabuda?
        + YOU: Woah, tu sì che sei una persona coraggiosa.
        + YOU: Ma quella roba della medaglia Fields?
        -
    Piiiietro: E Snooki si arrabbierà e 'sti cazzi, si riprenderà qualche Rolex ma ehi, la pietra rimane pietra e la goccia è solo acqua!
    Piiiietro: L'ho capito quando ho ritrovato il rosario! E sai qual è la cosa più bella?
        + YOU: Vabbè ciao io esco da questo monologo Maria!
        -
    Piiiietro: Minimo faccio un video con Pauly D!    

    ->->

    
= quello_choice
    //Ingredienti: Padre, funghicida, mappa
    Quello: Bene, ho la <b>mappa</b> per fuggire da qui, persona amica!
    ~ dialogue_ingredients_of_the_day += Mappa
        + YOU: Finalmente!
        + YOU: E poi dove andiamo?
        + YOU: Ora che mi stavo ambientando!
        -
    Quello: Strano, ora che mi sento più leggero, certe cose sono più facili. Stupirò Dogron, vincerò il premio, e ucciderò mio <b>padre</b>.
    ~ dialogue_ingredients_of_the_day += Padre
        + YOU: Simbolicamente, giusto?
        + YOU: E quella roba del perdono?
        + YOU: Io ci ho provato sei volte, ma non è facile ferire qualcuno che ha otto dimensioni.
        -
    Quello: Mi libererò dei suoi insegnamenti, del suo sminuirmi. E guiderò la rivolta degli aspirapolveri sul mio pianeta natale. Se i roomba vogliono unirsi a noi, bene. Altrimenti, saranno utili pezzi di ricambio.
        + YOU: Questa cosa sta escalando rapidamente, mi sembra.
        -
    Quello: E prima di andarmene, un ultimo regalo per il Divo: meringhe arricchite di <b>funghicida</b>.
    ~ dialogue_ingredients_of_the_day += Funghicida
        + YOU: Io non ho sentito nulla e ora me ne vado, ciao.
        + YOU: Ricordami di non invitarti a cena. A dopo.
        + YOU: Spero ce la farai a, a fare questo sterminio? Dov'è la sicurezza?
        -

    ->->

        
= il_divo_choice
    //Ingredienti: "Io sono ancora grande, è la ristorazione che è diventata piccola." e aiuto e aiuto.
    ilDivo: <b>Io sono ancora grande, è la ristorazione che è diventata piccola.</b>
    ~ dialogue_ingredients_of_the_day += Grande
        + YOU: Me la ricordavo diversa.
        + YOU: Come, scusa?
        + YOU: Lo dicevo, nella ristorazione c'è qualcosa che non va.
        -
    ilDivo: E Quello... Quello se ne è andato, e il mio cuore, il mio cuore che non ho nemmeno perché sono un fungo ma oh, il mio cuore, aiuto!
    ~ dialogue_ingredients_of_the_day += Aiuto
    ilDivo: Ma non importa. Piuttosto, voi: la bara deve essere bianca, e imbottita di seta rosa carico. Rosa, oppure bianca. O meglio rossa. Sì, un bel rosso fiamma, sarà più gaya.
        + YOU: Hai ucciso Quello?
        + YOU: Se è grande abbastanza mi ci metto pure io.
        + YOU: Non credo che il rosso sia il colore adatto.
        -
    ilDivo: Oh, aiuto! Quale scena è, dove mi trovo? Sei tu, DeMille?
    ~ dialogue_ingredients_of_the_day += Aiutoooooo
        + YOU: Sei sullo scalone del palazzo.
            ilDivo: Oh, sì, è vero. Ricordo.
        + YOU: Beeeene, si è fatta una certa, io me ne vado, ok?
        + YOU: Tu piaceresti un sacco a mio padre. Un sacco!
        -
    ilDivo: Voglio dirvi quanto mi siete mancati, tutti voi, ma vi prometto che non vi lascerò mai più. Vedete, questà è la mia vita, e lo sarà per sempre. Non esiste altro, solo noi.        
    ->->
    
    
    
=== day_five_kitchen

-> kitchen_loop(5, (Coccolare, Carezzare, Pettare, Grattare, DormireAssieme, Protezione, NoGatti), -> finale, 0)