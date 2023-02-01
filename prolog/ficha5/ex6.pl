/* (a) */

exists_in(Elem, List) :- member(Elem, List).
:-op(500, xfx, exists_in).

/* (b) */

_Y as _X:- true.

:-op(550, xfx, de).
:-op(500, fx, aula).
:-op(550, xfy, pelas).
:-op(550, xfx, e).
:-op(600, xfx, as).


dfs(S, F, Nodes):-
    dfs(S, F, [S], Help),
    reverse(Help, Nodes).

dfs(F, F, H, H).
dfs(S, F, Nodes, H):-
    edge(S, Next),
    \+(member(Next, Nodes)),
    dfs(Next, F, [Next|Nodes], H).
