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

part_of_list(Elem, [Elem|_]).
part_of_list(Elem, [H|T]):- H\=Elem, part_of_list(Elem, T).

find_flights(Origin, Destination, Flights) :-
    setof(Dest, (C, D, E, F)^flight(Origin, Dest, C, D, E, F), Answer).

find_flights_helper(Origin, Destination, Trip) :-
    
