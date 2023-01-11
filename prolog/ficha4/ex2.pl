%flight(Origin, Destination, Company, Code, Hour, Duration)
flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).


/* (a) */

get_all_nodes(ListOfAirports) :-
    setof(Origin, (Destination, Company, Code, Hour, Duration)^flight(Origin, Destination, Company, Code, Hour, Duration), L1),
    setof(Destination, (Origin, Company, Code, Hour, Duration)^flight(Origin, Destination, Company, Code, Hour, Duration), L2),
    append(L1, L2, L3),
    sort(L3, ListOfAirports).

/* (b) */

countCompany([], BestValue, BestComp, BestValue, BestComp).
countCompany([[H, T | [] ] | Tail], BestValue, BestComp, CurValue, CurComp) :-
    length(T, Leg),
    ((Leg > CurValue,
    NewCurValue is Leg,
    NewCurComp = H,
    countCompany(Tail, BestValue, BestComp, NewCurValue, NewCurComp)) ;
    (Leg =< CurValue,
    countCompany(Tail, BestValue, BestComp, CurValue, CurComp))).


most_diversified(Company) :-
    setof([Comp, Flights], setof(Destination, (Origin, Code, Hour, Duration)^flight(Origin, Destination, Comp, Code, Hour, Duration), Flights), Array),
    countCompany(Array, _B, Company, 0, _A).

/* (e) */

invert(Xs, Rev):- invert(Xs, [], Rev).

invert([], Rev, Rev).
invert([X|Xs], Acc, Rev):-
    invert(Xs, [X|Acc], Rev).


part_of_list(Elem, [Elem|_]).
part_of_list(Elem, [H|T]):- H\=Elem, part_of_list(Elem, T).


connects_dfs(S, F, List):-
    connects_dfs(S, F, [S], [], Codes),
    invert(Codes, List).

connects_dfs(F, F, _Path, Codes, Codes).

connects_dfs(S, F, T, Codes, C):-
    flight(S, N, _, Code, _, _),
    not( part_of_list(N, T) ),
    connects_dfs(N, F, [N|T], [Code|Codes], C).

find_flights(Origin, Destination, Flights) :-
    connects_dfs(Origin, Destination, Flights), !.


/* (d) - ???? */

connects_bfs(S, F):-
    connects_bfs([S], F, [S]).

connects_bfs([F|_], F, _V).
connects_bfs([S|R], F, V):-
    findall(N,
    (flight(S, N, _, _, _, _),
        not(part_of_list(N, V)),
        not(part_of_list(N, [S|R]))), L),
    append(R, L, NR),
    connects_bfs(NR, F, [S|V]).

/* (e) */

find_all_flights(Origin, Destination, Flights) :-
    setof(Copy, connects_dfs(Origin, Destination, Copy), Flights).

/* (f) -- WIP */

filter_flights()

find_flights_least_stops(Origin, Destination, ListOfFlights, Elem) :-
    find_all_flights(Origin, Destination, Flights).

