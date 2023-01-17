/* (a) */

double(X, Y):- Y is X*2.

map(Predicate, Args, L):-
    map_helper(Predicate, Args, [], L).

map_helper(_, [], L, L).
map_helper(Predicate, [H|Arguments], L, List) :-
    call(Predicate, H, A),
    append(L, [A], L2),
    map_helper(Predicate, Arguments, L2, List).

/* (b) */

fold(_, El, [], El).

fold(Predicate, StartVal, [A | Args], F):-
    call(Predicate, StartVal, A, NewVal),
    fold(Predicate, NewVal, Args, F).

/* (c) */

even(X):- 0 =:= X mod 2.

separate_helper([], _, Y, N, Y, N).

separate_helper([H|List], Pred, Yes, No, Y, N):-
    ((call(Pred, H), append(Yes, [H], Ny), separate_helper(List, Pred, Ny, No, Y, N)) ;
    (not(call(Pred, H)), append(No, [H], Nn), separate_helper(List, Pred, Yes, Nn, Y, N))).

separate(List, Pred, Y, N):-
    separate_helper(List, Pred, [],[], Y, N).

/* (d) */

ask_execute:-
    write('Insira o que deseja executar'), nl,
    read(Request),
    call(Request).
