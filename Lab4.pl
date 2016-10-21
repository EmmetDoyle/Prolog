% Factorial predicate
% fac(N, X) which established the factorial of N and unifies X with this

% Factorial using cut
fac(0, 1) :- !.
fac(N, X) :-  M is N-1, fac(M,Y), X is N*Y.

% Second version of factorial with extra condition in 2nd line
fac1(0, 1).
fac1(N, X) :-  N >0, M is N-1, fac1(M,Y), X is N*Y.

fac2(0, 1).
fac2(N, X) :-  M is N-1, fac2(M,Y), X is N*Y.


% List processing function which iterated recursively over a list
% count(X, L, N) counts the number of occurences of X in L and
% unifies N with the result.   3 versions

count1(X, [], 0).
count1(X, [X|T], M) :-  count1(X,T,N), M is N+1.
count1(X, [_|T], M) :-   count1(X,T,M).

count2(X, [], 0).
count2(X, [X|T], M) :-  count2(X,T,N), M is N+1.
count2(X, [H|T], M) :-   H \== X, count2(X,T,M).

count(_, [], 0).
count(X, [X|T], M) :-  count(X,T,N), M is N+1, !.
count(X, [_|T], M) :-   count(X,T,M).


% what is the differences between the 3 versions?

fib(0,0).
fib(1,1).
fib(F,N) :- 
    N>1,
    N1 is N-1,
    N2 is N-2,
    fib(F1,N1),
    fib(F2,N2),
    F is F1+F2.