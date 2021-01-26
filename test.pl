%:- use_module(library(pce)).

comed :- hypothese(Maladie), write("Votre maladie est "), write(Maladie), write("."), annuler.

hypothese('le coronavirus') :- covid.
hypothese('la grippe') :- grippe.
hypothese('la angine') :- angine.
hypothese('le rhume') :- rhume.
hypothese(inconnue) :- write("Vous êtes malade, mais on a pas pu vous diagnoster.").

covid :- verifier(fievre),
		 verifier(toux),
		 verifier('des difficultés respiratoires'),
		 verifier('la fatigue'),
		 verifier('perdu d\'odorat'),
		 verifier('perdu du gout'),
		 verifier('congestion nasale'),
		 verifier('mal de gorge'),
		 verifier(diarrhée),
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

demander(Symptome) :- write('Vous avez de '), write(Symptome), write('? '),
					  read(Reponse),
					  nl,
         			  ( (Reponse == oui) -> assert(yes(Symptome)) ; assert(no(Symptome)), fail ).

:- dynamic yes/1, no/1.

annuler :- retract(yes(_)), fail.
annuler :- retract(no(_)), fail.
annuler.
