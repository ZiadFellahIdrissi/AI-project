/*
choufe hnaa //     // choufe hna 
choufe hnaa //     // choufe hna 
choufe hnaa //     // choufe hna 
                |
                |
                |
                |
                |
                v 
*/

/*ila bghity tjarbe gui rahe 5dame sf mzyan 5ase ghire nzido chi l3ibat 
emmm mais nta ila kanty baghi tzide fl prolog mane ahsan zide fl comed.pl 
ou 5alihe liya ana ghadi njam3o m3a gui ou fla5er nrado like tmodifier tsawer ou les text*/



:- use_module(library(pce)).
:- pce_image_directory('./images').
:- use_module(library(pce_style_item)).
:- dynamic color/2.

resource(inter, image, image('2.jpg')).
resource(img_principal, image, image('second.jpg')).
resource(out, image, image('b.jpg')).
resource(loading, image, image('a.jpg')).


affich-image(Affichage, Imagen) :- new(Figure, figure),
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figure, display, Bitmap),
                                     send(Figure, status, 1),
                                     send(Affichage, display,Figure,point(100,80)).


nouv_imagen(Fenetre, Imagen) :-new(Figure, figure),
                                new(Bitmap, bitmap(resource(Imagen),@on)),
                                send(Bitmap, name, 1),
                                send(Figure, display, Bitmap),
                                send(Figure, status, 1),
                                send(Fenetre, display,Figure,point(0,0)).

                                

boutons:-effacer,
        send(@debut, free),
        hypothese(Maladie),
        nouv_imagen(@main, loading),
        sleep(2),
        nouv_imagen(@main, out),
        send(@maladie, selection(Maladie)),
        new(@debut, button('RECOMMENCER',message(@prolog, boutons))),
        send(@main, display,@debut,point(20,450)),annuler.


demander(Symptome):-new(Di,dialog('Questions:')),
                    new(L2,label(texto,'Repondez aux Questions')),
                    new(La,label(prob,Symptome)),
                    new(B1,button('OUI',and(message(Di,return,oui)))),
                    new(B2,button('NO',and(message(Di,return,non)))),
                    send(Di, gap, size(25,25)),
                    send(Di,append(L2)),
                    send(Di,append(La)),
                    send(Di,append(B1)),
                    send(Di,append(B2)),
                    send(Di,default_button,'OUI'),
                    send(Di,open_centered),get(Di,confirm,Reponse),
                    ( (Reponse == oui) -> assert(yes(Symptome)) ; assert(no(Symptome)), free(Di),fail ),
                    free(Di).                 


resultat(Msg) :- new(@Dii,dialog('information sur kda...'),size(500,500)),
                    new(L2,label(texto,'a hna hna')),
                    new(La,label(prob,Msg)),
                    new(qu,button('Fermer',and(message(@Dii,destroy),message(@Dii,free)))),
                    send(@Dii, gap, size(25,25)),
                    send(@Dii,append(L2)),
                    send(@Dii,append(La)),
                    send(@Dii,append(qu)),
                    send(@Dii,open_centered).                 




interface_principal:-new(@main,dialog('System de reflexion du maladies',size(1000,1000))),
                    new(@maladie, label(nombre,'ziad',font('georgia','roman',25))), 
                    new(@quitter,button('QUITTER',and(message(@main,destroy),message(@main,free)))),
                    new(@debut, button('COMMENCER LE TEST',message(@prolog, boutons))),

                    new(@btntraitement,button('¿traiter?')),

                    nouv_imagen(@main, img_principal),
                    send(@main, append(@debut)),
                    send(@main, append(@quitter)),
                    send(@main, display,@maladie,point(320,500)),
                    send(@main,open_centered).



creer_interface :- new(@interface,dialog('Bienvenue dans votre application CoMed',size(1000,1000))),
                    affich-image(@interface, inter),
                    new(BoutonComencer,button('COMMENCER',and(message(@prolog,interface_principal) ,
                    and(message(@interface,destroy),message(@interface,free)) ))),
                    new(BoutonQuitter,button('QUITTER',and(message(@interface,destroy),message(@interface,free)))),
                    send(@interface,append(BoutonComencer)),
                    send(@interface,append(BoutonQuitter)),
                    send(@interface,open_centered).

effacer:- send(@maladie, selection('')).

:-creer_interface.



hypothese('le coronavirus') :- covid,!.
hypothese('la grippe') :- grippe,!.
hypothese('la angine') :- angine,!.
hypothese('le rhume') :- rhume,!.
hypothese(inconnue) :- annuler.

covid :- verifier(fievre),
                verifier(toux),
                verifier('des difficultés respiratoires'),
                verifier('la fatigue'),
                verifier('perdu d\'odorat'),
                verifier('perdu du gout'),
                verifier('congestion nasale'),
                verifier('mal de gorge'),
                verifier(diarrhee),
                verifier('maux de tête'),
                verifier('douleurs musculaires').
                

covid :- verifier(fievre),
        verifier(toux),
        verifier('des difficultés respiratoires'),
        verifier('la fatigue'),
        verifier('perdu d\'odorat'),
        verifier('perdu du gout').

covid :- verifier('perdu d\'odorat'),
         verifier('perdu du gout').

grippe :- verifier(fievre),
                verifier(toux),
                verifier('congestion nasale'),
                verifier('mal de gorge'),
                verifier('des difficultés respiratoires'),
                verifier('maux de tête'),
                verifier('douleurs musculaires').

angine :- verifier(fievre),
                verifier('mal de gorge'),
                verifier('maux de tête'),
                verifier('amygdales rouges').

rhume :- verifier(fievre),
                verifier(toux),
                verifier('congestion nasale'),
                verifier('mal de gorge').



verifier(Symptome) :- ( yes(Symptome) -> true ; (no(Symptome) -> fail ; demander(Symptome)) ).

:- dynamic yes/1, no/1.



annuler :- retract(yes(_)), fail.
annuler :- retract(no(_)), fail.
annuler.