%%
% Les maladies.
 
hypothese('La COVID-19') :- covid, !.
hypothese('La grippe') :- grippe, !.
hypothese('La angine') :- angine, !.
hypothese('Le rhume') :- rhume, !.
hypothese(inconnue) :- annuler.

%%%%%%%%%%
% Les symptômes.

covid :- fievre,
         toux,
         difficultes_respiratoires,
         fatigue,
         perte_odorat,
         perte_gout,
         congestion_nasale,
         mal_gorge,
         diarrhee,
         maux_tete,
         douleurs_musculaires.

covid :- fievre,
         toux,
         difficultes_respiratoires,
         fatigue,
         perte_odorat,
         perte_gout.

covid :- fievre,
         perte_odorat,
         perte_gout.

grippe :- fievre,
          toux,
          congestion_nasale,
          mal_gorge,
          difficultes_respiratoires,
          maux_tete,
          douleurs_musculaires.

angine :- fievre,
          mal_gorge,
          maux_tete,
          amygdales_rouge.

rhume :- fievre,
         congestion_nasale,
         mal_gorge.

%%
% Les questions des symptômes à verifier par l utilisateur.
% La variable 'img#' va nous aider à savoir quelle image pertinent du symptôme que le système doit afficher.

fievre                    :- verifier('Est ce que vous avez une temperature superieure a 38 degre celsius?', img1).
toux                      :- verifier('Est ce que vous toussez?', img2).
difficultes_respiratoires :- verifier('Avez vous des difficultes respiratoires?', img6).
fatigue                   :- verifier('Est ce que vous etes fatigue?', img4).
perte_odorat              :- verifier('Votre odorat est il perdu?', img9).
perte_gout                :- verifier('Avez vous perdu le gout?', img10).
congestion_nasale         :- verifier('Est ce que vous avez une congestion nasale?', img11).
mal_gorge                 :- verifier('Avez vous du mal a la gorge?', img1).
maux_tete                 :- verifier('Vous souffrez de maux de tete?', img3).
diarrhee                  :- verifier('Avez vous eu la diarrhee?', img5).
douleurs_musculaires      :- verifier('Vous souffrez de douleurs musculaires', img7).
amygdales_rouge           :- verifier('Vous avez des amygdales rouges?', img8).
