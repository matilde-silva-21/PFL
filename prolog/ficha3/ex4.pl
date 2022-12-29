/* (a) */

print_n(_, 0).

print_n(S, N) :-
    N > 0,
    write(S),
    New is N-1,
    print_n(S, New).

/* (b) */

print_text(Text, Symbol, Padding) :-
    write(Symbol),
    print_n(' ', Padding),
    write(Text),
    print_n(' ', Padding),
    write(Symbol).

/* (...) */
