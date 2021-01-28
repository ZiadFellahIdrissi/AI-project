hypothese('La COVID-19') :- covid,!.
hypothese('La grippe') :- grippe,!.
hypothese('La angine') :- angine,!.
hypothese('Le rhume') :- rhume,!.
hypothese(inconnue) :- annuler.

covid :- verifier(fievre,'q1'),
         verifier(toux,'q2'),
         verifier('des difficultés respiratoires','q6'),
         verifier('la fatigue','q4'),
         verifier('perdu d\'odorat','q1'),
         verifier('perdu du gout','q1'),
         verifier('congestion nasale','q1'),
         verifier('mal de gorge','q1'),
         verifier(diarrhee,'q5'),
         verifier('maux de tête','q3'),
         verifier('douleurs musculaires','q7').
                

covid :- verifier(fievre,'q1'),
         verifier(toux,'q2'),
         verifier('des difficultés respiratoires','q6'),
         verifier('la fatigue','q4'),
         verifier('perdu d\'odorat','q1'),
         verifier('perdu du gout','q1').

covid :- verifier('perdu d\'odorat' , 'q1'),
         verifier('perdu du gout','q1').

grippe :- verifier(fievre,'q1'),
          verifier(toux , 'q2'),
          verifier('congestion nasale' , 'q1'),
          verifier('mal de gorge' , 'q1'),
          verifier('des difficultés respiratoires' , 'q6'),
          verifier('maux de tête' , 'q3'),
          verifier('douleurs musculaires', 'q7').

angine :- verifier(fievre , 'q1'),
          verifier('mal de gorge' , 'q1'),
          verifier('maux de tête' , 'q3'),
          verifier('amygdales rouges' , 'q8').

rhume :- verifier(fievre , 'q1'),
         verifier(toux , 'q2'),
         verifier('congestion nasale', 'q1'),
         verifier('mal de gorge' , 'q1').