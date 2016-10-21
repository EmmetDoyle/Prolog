%Knowlege Base 5a from Learn Prolog Now Chapter 1

wizard(ron). 
hasWand(harry). 
quidditchPlayer(harry). 
wizard(X):-  hasBroom(X),  hasWand(X). 
hasBroom(X):-  quidditchPlayer(X).