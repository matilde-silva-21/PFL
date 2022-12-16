/* (a) */

list_append([H|L1], L2, [H|L3]) :-
    list_append(L1, L2, L3).
list_append([], L2, L2).

/* (b) -- nao percebi o que é suposto fazer com o append */

list_member(Elem, [H|L1]) :-
    Elem \= H,
    list_member(Elem, L1) ;
    Elem = H.

/* (c) -- fazer enunciados compreensiveis deve ser muito dificil */

list_last([Last|[]], Last).

list_last([_|L1], Last) :-
    L1 \= [],
    list_last(L1, Last).


/* (e) */


list_of_list_append(L1, L2) :- list_of_list_append_helper(L1, [], L2).

list_of_list_append_helper([], L2, L2).

list_of_list_append_helper([L1 | Lists], L2, L3) :-
    append(L2, L1, L4),
    list_of_list_append_helper(Lists, L4, L3).

/* (j) */

list_slice(L1, Index, Size, L2) :-
    list_slice_helper(L1, Index, Size, L2, []).

list_slice_helper(_, 0, 0, L2, L2).

list_slice_helper([H|L1], Index, Size, L2, L3) :-
    Index \= 0,
    Size \= 0,
    New is Index-1,
    list_slice_helper(L1, New, Size, L2, []) ;
    Index = 0,
    Size \= 0,
    New is Size-1,
    append(L3, [H], L4),
    list_slice_helper(L1, Index, New, L2, L4).

/* (k) */ 

list_shift_rotate(L1, N, L2) :-
    list_slice(L1, 0, N, L3),
    length(L1, T),
    list_slice(L1, N, T-N, L4),
    append(L4, L3, L2).


