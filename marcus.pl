man(marcus, 40).
pompeain(marcus).
man(calpurnia, 45).
roman(calpurnia).

mortal(X) :- man(X, _).
dead(X) :- pompeain(X).

now(2016).

dead(X) :- man(X,Y), Z is Y+150, now(W), Z<W.