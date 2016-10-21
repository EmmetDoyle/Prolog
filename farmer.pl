opp(e,w).
opp(w,e).

unsafe(F,X,X,C) :- opp(F,X).
unsafe(F,W,X,X) :- opp(F,X).

% move(CurState, NewState)
% move the wolf
move(state(X,X,G,C), state(Y,Y,G,C)) :- opp(X,Y), not(unsafe(Y,Y,G,C)).

% move the goat
move(state(X,W,X,C), state(Y,W,Y,C)) :- opp(X,Y), not(unsafe(Y,W,Y,C)).

% move the cabbage
move(state(X,W,G,X), state(Y,W,G,Y)) :- opp(X,Y), not(unsafe(Y,W,G,Y)).

% move self only
move(state(X,W,G,C), state(Y,W,G,C)) :- opp(X,Y), not(unsafe(Y,W,G,C)).