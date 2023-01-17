/* (a) */
my_arg(Index, Term, Elem) :-
    Term =.. List,
    ((number(Index),
    Index > 0,
    length(List, L),
    Index < L) ; (\+number(Index))),
    nth0(Index, List, Elem).

my_functor(Term, Name, Arity) :-
    Term =.. List,
    length(List, L),
    nth0(0, List, Name),
    Arity is L-1.

/* (b) -- as 3 pancadas */

getArgs(_, F, N, F, Arity) :- N is Arity+1.

getArgs(Term, Args, Index, Final, Arity) :-
    arg(Index, Term, L),
    append(Args, [L], List),
    New is Index+1,
    getArgs(Term, List, New, Final, Arity).

univ(Term, Args) :-
    functor(Term, Name, Arity),
    getArgs(Term, [], 1, Final, Arity),
    append([Name], Final, Args).

/* (c) */

op(500, yfx, univ).
