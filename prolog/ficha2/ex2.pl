ancestor(X, Y) :-
    (parent(X, Y)) ;
    ancestor(X, parent(Z, Y)).

descendant(X, Y) :- ancestor(Y, X).

% nao verifiquei se esta certo
