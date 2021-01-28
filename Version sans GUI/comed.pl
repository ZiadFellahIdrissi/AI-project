comed :- hypothese(Maladie), annuler.

hypothese('le coronavirus') :- covid.
hypothese('la grippe') :- grippe.
hypothese('la angine') :- angine.
hypothese('le rhume') :- rhume.
hypothese(inconnue) :- annuler.

covid :- verifier(fievre),
		 verifier(toux),
		 verifier('des difficultés respiratoires'),
		 verifier('la fatigue'),
		 verifier('perdu d\'odorat'),
		 verifier('perdu du gout'),
		 verifier('congestion nasale'),
		 verifier('mal de gorge'),
		 verifier('diarrhée'),
		 verifier('maux de tête'),
		 verifier('douleurs musculaires'),
		 writeln("Vos symptomes nous dites que vous avez la COVID-19."),
		 writeln("On vous conseille de visiter votre institut medicale locale le plutot possible.").
covid :- verifier(fievre),
		 verifier(toux),
		 verifier('des difficultés respiratoires'),
		 verifier('la fatigue'),
		 verifier('perdu d\'odorat'),
		 verifier('perdu du gout'),
		 writeln("Il est forte probable que vous avez la COVID-19."),
		 writeln("On vous conseille de vous vous confinez chez vous pendant 14 jours,"),
		 writeln("et prendre des medicaments contre la COVID-19.").
covid :- verifier(fievre),
		 verifier('perdu d\'odorat'),
		 verifier('perdu du gout'),
		 writeln("Il est probable que vous avez la COVID-19."),
		 writeln("On vous conseille de vous vous confinez chez vous pendant 14 jours."),
		 writeln("vous vous lavez les mains régulièrement pour ne pas transmettre le virus aux autres.").
grippe :- verifier(fievre),
		  verifier(toux),
		  verifier('congestion nasale'),
		  verifier('mal de gorge'),
		  verifier('des difficultes respiratoires'),
		  verifier('maux de tête'),
		  verifier('douleurs musculaires'),
		  writeln("Vous avez la grippe."),
		  writeln("On vous conseille de vous vous reposez,"),
		  writeln("bien buvez de l'eau,"),
		  writeln("prenez un medicament contre la fievre (nous vous recommandons le Paracetamol),"),
		  writeln("vous vous lavez les mains regulièrement et ne prenez pas d'antibiotiques.").
angine :- verifier(fievre),
		  verifier('mal de gorge'),
		  verifier('maux de tete'),
		  verifier('amygdales rouges'),
		  writeln("Vous avez l'angine."),
		  writeln("On vous conseille que vous consommez de la vitamine C,"),
		  writeln("buvez beaucoup d'eau"),
		  writeln("evitez les climatiseurs et radiateurs trop chauds,"),
		  writeln("arretez de fumer si vous etes fumeux,"),
		  writeln("mangez du miel et dormez suffisament.").
rhume :- verifier(fievre),
		 verifier(toux),
		 verifier('congestion nasale'),
		 verifier('mal de gorge'),
		 writeln("Vous avez le rhume."),
		 writeln("On vous conseille que vous utiliez du serum physiologique pour laver le nez,"),
		 writeln("mangez du miel,"),
		 writeln("stoppez l'ecoulement du nez avec l'homeopathie,"),
		 writeln("apaisez les irritations nasales avec une pommade a base de vaseline,"),
		 writeln("desinfectez le nez avec de gouttes nasales antiseptiques,"),
		 writeln("prenez un medicament contre la fievre (nous vous recommandons le Paracetamol).").

verifier(Symptome) :- ( yes(Symptome) -> true ; (no(Symptome) -> fail ; demander(Symptome)) ).

demander(Symptome) :- write('Vous avez de '), write(Symptome), write('? '),
					  read(Reponse),
					  nl,
         			  ( (Reponse == oui) -> assert(yes(Symptome)) ; assert(no(Symptome)), fail ).

:- dynamic yes/1, no/1.

annuler :- retract(yes(_)), fail.
annuler :- retract(no(_)), fail.
annuler.
