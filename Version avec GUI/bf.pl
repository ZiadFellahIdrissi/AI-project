hypothese('La COVID-19') :- covid,!.
hypothese('La grippe') :- grippe,!.
hypothese('La angine') :- angine,!.
hypothese('Le rhume') :- rhume,!.
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