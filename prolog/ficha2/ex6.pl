/* (a) ???*/
invert(Xs, Rev):- invert(Xs, [], Rev).

invert([], Rev, Rev).
invert([X|Xs], Acc, Rev):-
    invert(Xs, [X|Acc], Rev).


/* (b) */


    