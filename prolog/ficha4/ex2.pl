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

/* (c) */

invert(Xs, Rev):- invert(Xs, [], Rev).

invert([], Rev, Rev).
invert([X|Xs], Acc, Rev):-
    invert(Xs, [X|Acc], Rev).


part_of_list(Elem, [Elem|_]).
part_of_list(Elem, [H|T]):- H\=Elem, part_of_list(Elem, T).


connects_dfs(S, F, List, Cities):-
    connects_dfs(S, F, [S], [], Codes, Path),
    invert(Codes, List),
    invert(Path, Cities).

connects_dfs(F, F, Path, Codes, Codes, Path).

connects_dfs(S, F, T, Codes, C, P):-
    flight(S, N, _, Code, _, _),
    not( part_of_list(N, T) ),
    connects_dfs(N, F, [N|T], [Code|Codes], C, P).

find_flights(Origin, Destination, Flights) :-
    connects_dfs(Origin, Destination, Flights, _Cities), !.


/* (d) - ???? */

connects_bfs(S, F):-
    connects_bfs([S], F, [S]).

connects_bfs([F|_], F, _).
connects_bfs([S|R], F, V):-
    findall(N,
    (flight(S, N, _, _, _, _),
        not(member(N, V)),
        not(member(N, [S|R]))), L),
    append(R, L, NR),
    connects_bfs(NR, F, [S|V]).

/* (e) */

find_all_flights(Origin, Destination, Flights) :-
    setof(Copy, (Copy, Cities)^connects_dfs(Origin, Destination, Copy, Cities), Flights).

/* (f) */

smallestFlight([], _, A, A).

smallestFlight([H|ListOfFlights], Length, Flight, Small):-
    length(H, L),
    ((L < Length,
    NewFlight = H,
    NewLength is L,
    smallestFlight(ListOfFlights, NewLength, NewFlight, Small)) ; 
    (
    smallestFlight(ListOfFlights, Length, Flight, Small)
    )).


filter_flights([H|ListOfFlights], List):-
    length(H, L),
    smallestFlight([H|ListOfFlights], L, _A, SmallestFlight), !,
    length(SmallestFlight, L1),
    setof(Flight, (member(Flight, [H|ListOfFlights]), length(Flight, L2), L1 =:= L2), List).


find_flights_least_stops(Origin, Destination, ListOfFlights) :-
    find_all_flights(Origin, Destination, List1),
    filter_flights(List1, ListOfFlights), !.

/* (g) */

contains_all_elements(_, []).
contains_all_elements(OriginalList, [H|ElemList]) :-
    member(H, OriginalList),
    contains_all_elements(OriginalList, ElemList).


find_flights_stops(Origin, Destination, Stops, ListFlights) :-
    setof(Codes, (Codes, Cities)^(connects_dfs(Origin, Destination, Codes, Cities), contains_all_elements(Cities, Stops)), ListFlights).


/* (h) */

connects_dfs_cycle(S, F, List, Cities):-
    connects_dfs_cycle(S, F, [S], [], Codes, Path, S),
    invert(Codes, List),
    invert(Path, Cities).

connects_dfs_cycle(F, F, Path, Codes, Codes, Path, _Start) :-
    (length(Codes, L) , L > 0).

connects_dfs_cycle(S, F, T, Codes, C, P, Start):-
    flight(S, N, _, Code, _, _),
    ((not( part_of_list(N, T) )) ; (N == Start)),
    connects_dfs_cycle(N, F, [N|T], [Code|Codes], C, P, Start).


find_circular_trip(MaxSize, Origin, Cycle) :-
    connects_dfs_cycle(Origin, Origin, Codes, _), 
    length(Codes, L), L < MaxSize, !,
    Cycle = Codes.


/* (i) */

find_circular_trips(MaxSize, Origin, Cycle) :-
    findall(Codes, (connects_dfs_cycle(Origin, Origin, Codes, _), length(Codes, L), L < MaxSize), L1), !,
    sort(L1, Cycle).    


