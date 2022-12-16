/* (a) */


list_to(N, L1) :- list_to_helper(N, [], L1).

list_to_helper(0, L2, L2).

list_to_helper(N, L1, L2) :-
    N \= 0,
    append([N], L1, L3),
    New is N - 1,
    getList(New, L3, L2).

/* (b) / (d) */

list_from_to(Inf, Sup, L1) :-
    Inf < Sup,
    list_from_to_helper(Inf, Sup, L1, []).


list_from_to(Inf, Sup, L1) :-
    Sup < Inf,
    list_from_to_helper(Sup, Inf, L1, []).

list_from_to_helper(Inf, Sup, L3, L3) :-
    Inf >= Sup+1.


list_from_to_helper(Inf, Sup, L2, L1) :-
    Inf < Sup+1,
    append(L1, [Inf], L3),
    New is Inf+1,
    list_from_to_helper(New, Sup, L2, L3).

/* (c) / (d) */

list_from_to_step(Inf, Step, Sup, L1) :-
    Sup > Inf,
    list_from_to_step_helper(Inf, Step, Sup, L1, []).

list_from_to_step(Inf, Step, Sup, L1) :-
    Sup < Inf,
    list_from_to_step_helper(Sup, Step, Inf, L1, []).

list_from_to_step_helper(Inf, _, Sup, L3, L3) :-
    Inf >= Sup+1.

list_from_to_step_helper(Inf, Step, Sup, L2, L1) :-
    Inf < Sup+1,
    append(L1, [Inf], L3),
    New is Inf+Step,
    list_from_to_step_helper(New, Step, Sup, L2, L3).



