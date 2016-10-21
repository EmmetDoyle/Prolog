man(jim).
man(mary).
mortal(X) :- man(X).
likes(X,A) :- man(X), dog(A).

dog(rex).
dog(lassie).

cat(tiger).
cat(pebbles).
hates(X,Y) :- cat(X), dog(Y).
chases(X,Y) :- dog(X), cat(Y).