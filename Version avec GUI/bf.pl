hypothese('La COVID-19') :- covid,!.
hypothese('La grippe') :- grippe,!.
hypothese('La angine') :- angine,!.
hypothese('Le rhume') :- rhume,!.
hypothese(inconnue) :- annuler.

covid :- verifier('Est ce que vous avez une temperature superieure a 38 degre celsius?','q1'),
         verifier('Est ce que vous toussez?','q2'),
         verifier('Avez vous des difficultes respiratoires?','q6'),
         verifier('Est ce que vous etes fatigue?','q4'),
         verifier('Votre odorat est il perdu?','q9'),
         verifier('Avez vous perdu le gout?','q1'),
         verifier('Est ce que vous avez une congestion nasale?','q10'),
         verifier('Avez vous du mal a la gorge?','q1'),
         verifier('Avez vous eu la diarrhee?','q5'),
         verifier('Vous souffrez de maux de tete?','q3'),
         verifier('Vous souffrez de douleurs musculaires','q7').
                

covid :- verifier('Est ce que vous avez une temperature superieure a 38 degre celsius?','q1'),
         verifier('Est ce que vous toussez?','q2'),
         verifier('Avez vous des difficultes respiratoires?','q6'),
         verifier('Est ce que vous etes fatigue?','q4'),
         verifier('Votre odorat est il perdu?','q9'),
         verifier('Avez vous perdu le gout?','q1').

covid :- verifier('Votre odorat est il perdu?' , 'q9'),
         verifier('Avez vous perdu le gout?','q1').

grippe :- verifier('Est ce que vous avez une temperature superieure a 38 degre celsius?','q1'),
          verifier('Est ce que vous toussez?' , 'q2'),
          verifier('Est ce que vous avez une congestion nasale?' , 'q10'),
          verifier('Avez vous du mal a la gorge?' , 'q1'),
          verifier('Avez vous des difficultes respiratoires?' , 'q6'),
          verifier('Vous souffrez de maux de tete?' , 'q3'),
          verifier('Vous souffrez de douleurs musculaires', 'q7').

angine :- verifier('Est ce que vous avez une temperature superieure a 38 degre celsius?' , 'q1'),
          verifier('Avez vous du mal a la gorge?' , 'q1'),
          verifier('Vous souffrez de maux de tete?' , 'q3'),
          verifier('Vous avez des amygdales rouges?' , 'q8').

rhume :- verifier('Est ce que vous avez une temperature superieure a 38 degre celsius?' , 'q1'),
         verifier('Est ce que vous toussez?' , 'q2'),
         verifier('Est ce que vous avez une congestion nasale?', 'q10'),
         verifier('Avez vous du mal a la gorge?' , 'q1').