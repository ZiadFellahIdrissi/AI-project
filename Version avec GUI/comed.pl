:- include('bf.pl').
:- use_module(library(pce)).
:- pce_image_directory('./images').
:- use_module(library(pce_style_item)).
:- dynamic color/2.

resource(inter, image, image('acceuil.jpg')).
resource(img_principal, image, image('comed.jpg')).
resource(loading, image, image('reflexion.jpg')).
resource(out, image, image('resultat.jpg')).
resource('La COVID-19', image, image('covid.jpg')).
resource('La grippe', image, image('grippe.jpg')).
resource('La angine', image, image('angine.jpg')).
resource('Le rhume', image, image('rhume.jpg')).
resource('q1', image, image('fievre.jpg')).
resource('q2', image, image('toux.jpg')).
resource('q1', image, image('fievre.jpg')).
resource('q3', image, image('maux de tete.jpg')).
resource('q4', image, image('fatigue.jpg')).
resource('q5', image, image('diarrhee.jpg')).
resource('q6', image, image('difficultes respiratoires.jpg')).
resource('q7', image, image('douleurs musculaires.jpg')).
resource('q8', image, image('red tonsils.jpg')).



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

imagen_quest(Fenetre, Imagen) :-new(Figure, figure),
                              new(Bitmap, bitmap(resource(Imagen),@on)),
                              send(Bitmap, name, 1),
                              send(Figure, display, Bitmap),
                              send(Figure, status, 1),
                              send(Fenetre, display,Figure,point(500,60)).


boutons:-free(@maladie),
        free(@quitter),
        free(@conseil),
        new(@quitter,button('Quitter',and(message(@main,destroy),message(@main,free)))),
        new(@maladie, label(nombre,'',font('georgia','roman',28))),
        effacer,
        send(@debut, free),
        hypothese(Maladie),
        nouv_imagen(@main, loading),
        sleep(1.5),
        nouv_imagen(@main, out),
        send(@main, display, @maladie, point(240,380)),
        send(@maladie, selection(Maladie)),
        new(@conseil, button('Conseils', message(@prolog, resultat, Maladie))),
        send(@main, display, @conseil, point(25, 620)),
        new(@debut, button('Recommencer', message(@prolog, boutons))),
        send(@main, display, @debut, point(290, 620)),
        send(@main, display, @quitter, point(390, 620)),
        annuler.

demander(Symptome,Img):-new(Di,dialog('Questions:')),
                    new(L2,label(texto,'Repondez aux Questions')),
                    new(La,label(prob,Symptome)),
                    imagen_quest(Di,Img),
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

resultat(Msg) :- new(@conseil_g, dialog('Conseils pour votre maladie')),
                nouv_imagen(@conseil_g, Msg),
                send(@conseil_g, open_centered).

interface_principal:-new(@main,dialog('CoMed: Consultation médicale')),
                    new(@quitter,button('QUITTER',and(message(@main,destroy),message(@main,free)))),
                    new(@debut, button('COMMENCER LE TEST',message(@prolog, boutons))),
                    nouv_imagen(@main, img_principal),
                    send(@main, append(@debut)),
                    send(@main, append(@quitter)),
                    send(@main, open_centered).

creer_interface :- new(@interface,dialog('CoMed: Consultation médicale')),
                    affich-image(@interface, inter),
                    new(BoutonComencer,button('COMMENCER',and(message(@prolog,interface_principal) ,
                    and(message(@interface,destroy),message(@interface,free)) ))),
                    new(BoutonQuitter,button('QUITTER',and(message(@interface,destroy),message(@interface,free)))),
                    send(@interface,append(BoutonComencer)),
                    send(@interface,append(BoutonQuitter)),
                    send(@interface,open_centered).

effacer:- send(@maladie, selection('')).

:-creer_interface.

verifier(Symptome,Img) :- ( yes(Symptome) -> true ; (no(Symptome) -> fail ; demander(Symptome,Img)) ).

:- dynamic yes/1, no/1.

annuler :- retract(yes(_)), fail.
annuler :- retract(no(_)), fail.
annuler.