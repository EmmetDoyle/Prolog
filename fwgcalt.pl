change(w,e).
change(e,w).

unsafe(F,X,X,C) :-
	change(F,X).
unsafe(F,W,X,X) :-
	change(F,X).

%move(currState, newState)

%move wolf
move(state(X,X,G,C), state(Y,Y,G,C)) :-
	change(X,Y), not(unsafe(Y,Y,G,C)).

%move goat
move(state(X,W,X,C), state(Y,W,Y,C)) :-
	change(X,Y), not(unsafe(Y,W,Y,C)).

%move cabbage
move(state(X,W,G,X), state(Y,W,G,Y)) :-
	change(X,Y), not(unsafe(Y,W,G,Y)).

%move farmer alone
move(state(X,W,G,C), state(Y,W,G,C)) :-
	change(X,Y), not(unsafe(Y,W,G,C)).

start(state(w,w,w,w)).
goal(state(e,e,e,e)).

solve(X,Soln):-
	solve(X,[],Sol),
	reverse(Sol,Soln).

solve(State,Path,[State|Path]):-
	goal(State).

solve(State,Path,Sol):-
	move(State,NewState),
	not(member(NewState,Path)),
	solve(NewState,[State|Path],Sol).

showState(S) :-
    showWest(S), write('|~~~~~~~|'), showEast(S),nl.

showWest(state(F,W,G,C)) :-
    (F == w, write('F'), !; write(' ')),
    (W == w, write('W'), !; write(' ')),
    (G == w, write('G'), !; write(' ')),
    (C == w, write('C'), !; write(' ')).

showEast(state(F,W,G,C)) :-
    (F == e, write('F'), !; true),
    (W == e, write('W'), !; true),
    (G == e, write('G'), !; true),
    (C == e, write('C'), !; true).

go :- solve(state(w,w,w,w), X), showSol(X).

showSol([]).
showSol([H|T]) :- showState(H), showSol(T).
