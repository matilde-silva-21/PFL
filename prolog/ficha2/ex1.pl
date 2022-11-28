/* (a) */
fatorial(1, 1).

fatorial(N, F) :-
    N > 1,
    N1 is N-1,
    fatorial(N1, F1),
    F is N*F1.

/* (b) */
somaRec(0, 0).
somaRec(N, S) :-
    N > 0,
    N1 is N-1,
    somaRec(N1, S1),
    S is N+S1.

/* (c) */
fibonacci(1, 1).
fibonacci(2, 1).

fibonacci(N, F):-
    N>2,
    N1 is N-1,
    N2 is N-2, 
    fibonacci(N1, F1), 
    fibonacci(N2, F2),
    F is F1+F2. 

/* (d) -- copiado do stack overflow */
divisible(X,Y) :- 0 is X mod Y, !.

divisible(X,Y) :- X > Y+1, divisible(X, Y+1).

isPrime(2) :- true,!.
isPrime(X) :- X < 2,!,false.
isPrime(X) :- \+(divisible(X, 2)).


