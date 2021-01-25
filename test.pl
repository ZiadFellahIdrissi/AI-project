male(ahmed).
male(ali).
male(oussama).
male(omar).
female(sara).
female(hajar).
parent(sara,hajar).
parent(sara,omar).
parent(ahmed,ali).
parent(ahmed,sara).
parent(ali,oussama).
father(X,Y):- parent(X,Y),male(X).
mother(X,Y):- parent(X,Y),female(X).
siblings(X,Y):- parent(Z,X),parent(Z,Y),X\==Y.
uncle(X,Y):-parent(Z,Y), siblings(Z,X).
grandfather(X,Y):- parent(X,Z),parent(Z,Y),male(X).
son(X,Y):-parent(Y,X),male(X).
sister(X,Y):- parent(Z,X),parent(Z,Y),female(X),female(Y).
