% state(me,ce,mw,cw,b)

%safe(Me,Ce,MW,CW) :- Me >= Ce, MW >= CW.

unsafe(Me,Ce,MW,CW, B) :- Me > 0, Ce > Me.
unsafe(Me,Ce,MW,CW, B) :- MW > 0, CW > MW.


%%%%%	East to West %%%%%%%
% move 2 missionaries from east to west
move(state(Me,Ce, Mw, Cw, 1), state(ME,CE,MW,CW, -1)) :-
        Me > 1, 
        ME is Me-2, 
        MW is Mw+2, 
        CW = Cw, 
        CE = Ce,
        not(unsafe(ME,CE,MW,CW,-1)).

% move 1 missionaries from east to west
move(state(Me,Ce, Mw, Cw, 1), state(ME,CE,MW,CW, -1)) :-
        Me > 0, 
        ME is Me-1, 
        MW is Mw+1, 
        CW = Cw, 
        CE = Ce,
        not(unsafe(ME,CE,MW,CW,-1)).

% move 1 missionarie and 1 cannibal from east to west
move(state(Me,Ce, Mw, Cw, 1), state(ME,CE,MW,CW, -1)) :-
        Me > 0,
        Ce > 0, 
        ME is Me-1, 
        MW is Mw+1, 
        CW is Cw+1, 
        CE is Ce-1,
        not(unsafe(ME,CE,MW,CW,-1)).

% move 2 cannibals from east to west
move(state(Me,Ce, Mw, Cw, 1), state(ME,CE,MW,CW, -1)) :-
        Ce > 1, 
        ME = Me, 
        MW = Mw, 
        CW is Cw + 2, 
        CE is Ce - 2, 
        not(unsafe(ME,CE,MW,CW,-1)).

% move 1 cannibals from east to west
move(state(Me,Ce, Mw, Cw, 1), state(ME,CE,MW,CW, -1)) :-
        Ce > 0, 
        ME is Me, 
        MW is Mw, 
        CW is Cw+1, 
        CE is Ce-1,
        not(unsafe(ME,CE,MW,CW,-1)).

%%%%%		West to East 		%%%%%

% move 2 missionaries from west to east
move(state(Me,Ce, Mw, Cw, -1), state(ME,CE,MW,CW, 1)) :-
        Mw > 1, 
        ME is Me+2, 
        MW is Mw-2, 
        CW = Cw, 
        CE = Ce,
        not(unsafe(ME,CE,MW,CW,1)).

% move 1 missionaries from west to east
move(state(Me,Ce, Mw, Cw, -1), state(ME,CE,MW,CW, 1)) :-
        Mw > 0, 
        ME is Me+1, 
        MW is Mw-1, 
        CW = Cw, 
        CE = Ce,
        not(unsafe(ME,CE,MW,CW,1)).

% move 1 missionary and 1 cannibal from west to east
move(state(Me,Ce, Mw, Cw, -1), state(ME,CE,MW,CW, 1)) :-
        Mw > 0,
        Cw > 0, 
        ME is Me+1, 
        MW is Mw-1, 
        CW is Cw-1, 
        CE is Ce+1,
        not(unsafe(ME,CE,MW,CW,1)).

% move 2 cannibals from west to east
move(state(Me,Ce, Mw, Cw, -1), state(ME,CE,MW,CW, 1)) :-
        Cw > 1, 
        ME = Me, 
        MW = Mw, 
        CW is Cw - 2, 
        CE is Ce + 2, 
        not(unsafe(ME,CE,MW,CW,1)).

% move 1 cannibals from east to west
move(state(Me,Ce, Mw, Cw, -1), state(ME,CE,MW,CW, 1)) :-
        Cw > 0, 
        ME is Me, 
        MW is Mw, 
        CW is Cw-1, 
        CE is Ce+1,
        not(unsafe(ME,CE,MW,CW,1)).



start(state(3,3,0,0,1)).
goal(state(0,0,3,3,-1)).

solve(X,Soln):-
	solve(X,[],Sol),
	reverse(Sol,Soln).

solve(State,Path,[State|Path]):-
	goal(State).

solve(State,Path,Sol):-
	move(State,NewState),
	not(member(NewState,Path)),
	solve(NewState,[State|Path],Sol).

go :- solve(state(3,3,0,0,1), X), showSol(X).

showState(S) :-
    showWest(S), write('|~~~~~~~|'), showEast(S), nl.

showWest(state(Me, Ce, Mw, Cw, B)) :-
    (write(Mw), write(' '), !; write('  ')),
    (write(Cw), write(' '), !; write('  ')),
    (write('W'), !; write(' ')).

showEast(state(Me, Ce, Mw, Cw, B)) :-
    (write(Me), write(' '), !; write('  ')),
    (write(Ce), write(' '), !; write('  ')),
    (write('E'), !; write(' ')).

showSol([]).
showSol([H|T]) :- showState(H), showSol(T).