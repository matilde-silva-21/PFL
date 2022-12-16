/* (a) */
invert(Xs, Rev):- invert(Xs, [], Rev).

invert([], Rev, Rev).
invert([X|Xs], Acc, Rev):-
    invert(Xs, [X|Acc], Rev).


/* (b) */

del_one(_, [], []).
del_one(Elem, [Elem|T1], T1).
del_one(Elem, [H|T1], [H|T2]) :- H \= Elem, del_one(Elem, T1, T2).

/* (c) */

del_all(_, [], []).
del_all(Elem, [Elem|T1], T2) :- del_all(Elem, T1, T2).
del_all(Elem, [H|T1], [H|T2]) :- H \= Elem, del_all(Elem, T1, T2).

/* (d) */

part_of_list(Elem, [Elem|_]).
part_of_list(Elem, [H|T]):- H\=Elem, part_of_list(Elem, T).


del_all_list(_, [], []).

del_all_list(L1, [H|T1], T2) :- 
    part_of_list(H, L1), 
    del_all_list(L1, T1, T2).

del_all_list(L1, [H|T1], [H|T2]) :-
    \+ part_of_list(H, L1),
    del_all_list(L1, T1, T2).

/* (e) ????*/

del_dups_helper([], []).

del_dups_helper([H1|T1], [H1|T2]) :-
    \+ part_of_list(H1, T1),
    del_dups_helper(T1, T2).

del_dups_helper([H1|T1], L2) :-
    part_of_list(H1, T1),
    del_dups_helper(T1, L2).


del_dups([],[]).

del_dups([H],[H]).

del_dups([H ,H| T], List) :- del_dups_helper( [H|T], List).

del_dups([H, Y | T], [H|T1]):- Y \= H, del_dups_helper([Y|T], T1).



/* (f) ???? nao sei o que e uma permutaçao */


/* (g) */


replicate(Amount, Elem, L1) :- replicate_helper(Amount, Elem, [], L1).

replicate_helper(0, _, L1, L1).
replicate_helper(Amount, Elem, L1, L2) :-
    N is Amount-1,
    replicate_helper(N, Elem, [Elem|L1], L2).


/* (h) */

intersperse(Elem, L1, L2) :-
    intersperse_helper(Elem, L1, L2, 0).

intersperse_helper(_, [], [], _).

intersperse_helper(Elem, [H|T1], [H|T2], Count) :-
    Count = 0,
    intersperse_helper(Elem, T1, T2, 1).

intersperse_helper(Elem, [H|T1], [Elem | [H | T2]], Count) :-
    Count = 1,
    intersperse_helper(Elem, T1, T2, 0).


/* (i) */

insert_elem(Index, [H|L1], Elem, [H|L2]) :-
    Index \= 0,
    New is Index - 1, 
    insert_elem(New, L1, Elem, L2).

insert_elem(Index, L1, Elem, [Elem | L1]) :-
    Index = 0.

/* (j) */

delete_elem(Index, [H|L1], H, L1) :-
    Index = 0.

delete_elem(Index, [H|L1], Elem, [H|L2]) :-
    Index \= 0,
    New is Index - 1, 
    delete_elem(New, L1, Elem, L2).

/* (k) */

replace([H|L1], Index, Old, New, [H|L2]) :-
    Index\=0,
    Ind is Index-1,
    replace(L1, Ind, Old, New, L2).

replace([Old|L1], Index, Old, New, [New|L1]) :-
    Index = 0.
