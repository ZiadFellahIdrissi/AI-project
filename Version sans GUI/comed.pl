comed :- hypothese(Maladie), annuler.

hypothese('le coronavirus') :- covid, !.
hypothese('la grippe') :- grippe, !.
hypothese('la angine') :- angine, !.
hypothese('le rhume') :- rhume, !.
hypothese(inconnue) :- annuler.


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
         douleurs_musculaires,
		 writeln("Vos symptomes nous dites que vous avez la COVID-19."),
		 writeln("On vous conseille de visiter votre institut medicale locale le plutot possible.").

covid :- fievre,
         toux,
         difficultes_respiratoires,
         fatigue,
         perte_odorat,
         perte_gout,
		 writeln("Il est forte probable que vous avez la COVID-19."),
		 writeln("On vous conseille de vous vous confinez chez vous pendant 14 jours,"),
		 writeln("et prendre des medicaments contre la COVID-19.").

covid :- fievre,
		 perte_odorat,
         perte_gout,
		 writeln("Il est probable que vous avez la COVID-19."),
		 writeln("On vous conseille de vous vous confinez chez vous pendant 14 jours."),
		 writeln("vous vous lavez les mains régulièrement pour ne pas transmettre le virus aux autres.").

grippe :- fievre,
          toux,
          congestion_nasale,
          mal_gorge,
          difficultes_respiratoires,
          maux_tete,
          douleurs_musculaires,
		  writeln("Vous avez la grippe."),
		  writeln("On vous conseille de vous vous reposez,"),
		  writeln("bien buvez de l'eau,"),
		  writeln("prenez un medicament contre la fievre (nous vous recommandons le Paracetamol),"),
		  writeln("vous vous lavez les mains regulierement et ne prenez pas d'antibiotiques.").

angine :- fievre,
          mal_gorge,
          maux_tete,
          amygdales_rouge,
		  writeln("Vous avez l'angine."),
		  writeln("On vous conseille que vous consommez de la vitamine C,"),
		  writeln("buvez beaucoup d'eau"),
		  writeln("evitez les climatiseurs et radiateurs trop chauds,"),
		  writeln("arretez de fumer si vous etes fumeux,"),
		  writeln("mangez du miel et dormez suffisament.").

rhume :- fievre,
         congestion_nasale,
         mal_gorge,
		 writeln("Vous avez le rhume."),
		 writeln("On vous conseille que vous utiliez du serum physiologique pour laver le nez,"),
		 writeln("mangez du miel,"),
		 writeln("stoppez l'ecoulement du nez avec l'homeopathie,"),
		 writeln("apaisez les irritations nasales avec une pommade a base de vaseline,"),
		 writeln("desinfectez le nez avec de gouttes nasales antiseptiques,"),
		 writeln("prenez un medicament contre la fievre (nous vous recommandons le Paracetamol).").
%%
% Les questions des symptômes à verifier par l utilisateur.

fievre                    :- verifier('Est ce que vous avez une temperature superieure a 38 degre celsius? ').
toux                      :- verifier('Est ce que vous toussez? ').
difficultes_respiratoires :- verifier('Avez vous des difficultes respiratoires? ').
fatigue                   :- verifier('Est ce que vous etes fatigue? ').
perte_odorat              :- verifier('Votre odorat est il perdu? ').
perte_gout                :- verifier('Avez vous perdu le gout? ').
congestion_nasale         :- verifier('Est ce que vous avez une congestion nasale? ').
mal_gorge                 :- verifier('Avez vous du mal a la gorge? ').
maux_tete                 :- verifier('Vous souffrez de maux de tete? ').
diarrhee                  :- verifier('Avez vous eu la diarrhee? ').
douleurs_musculaires      :- verifier('Vous souffrez de douleurs musculaires? ').
amygdales_rouge           :- verifier('Vous avez des amygdales rouges? ').

%%
%

verifier(Symptome) :- ( yes(Symptome) -> true ; (no(Symptome) -> fail ; demander(Symptome)) ).

demander(Symptome) :- write(Symptome),
					  read(Reponse),
					  nl,
         			  ( (Reponse == oui) -> assert(yes(Symptome)) ; assert(no(Symptome)), fail ).

:- dynamic yes/1, no/1.

annuler :- retract(yes(_)), fail.
annuler :- retract(no(_)), fail.
annuler.
