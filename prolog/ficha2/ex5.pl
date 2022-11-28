/* (a) */
list_size([], 0).

list_size([_ | Tail], Size) :- 
    list_size(Tail, N),
    Size is N+1.

/* (b) */

list_sum([], 0).
list_sum([H|T], S):-
    list_sum(T, N1),
    S is N1 + H.


/* (c) */

list_prod([], 0).
list_prod([H|T], S):-
    list_sum(T, N1),
    S is N1 * H.

/* (d) */

list_prod([], 0).
list_prod([H|T], S):-
    list_sum(T, N1),
    S is N1 * H.



/* (d) */

inner_product([], [], 0).
inner_product([H1|T1], [H2|T2], R) :-
    inner_product(T1, T2, N),
    R is H1*H2 + N.

/* (e) */
count(_, [], 0).
count(Elem, [H|T], R) :-
    (Elem = H,
    count(Elem, T, N),
    R is 1+N)
    ; 
    (Elem \= H,
    count(Elem, T, N),
    R is N).

