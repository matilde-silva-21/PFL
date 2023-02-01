:- dynamic round/4.

% round(RoundNumber, DanceStyle, Minutes, [Dancer1-Dancer2 | DancerPairs])
% round/4 indica, para cada ronda, o estilo de dança, a sua duração, e os pares de dançarinos participantes.
round(1, waltz, 8, [eugene-fernanda]).
round(2, quickstep, 4, [asdrubal-bruna,cathy-dennis,eugene-fernanda]).
round(3, foxtrot, 6, [bruna-dennis,eugene-fernanda]).
round(4, samba, 4, [cathy-asdrubal,bruna-dennis,eugene-fernanda]).
round(5, rhumba, 5, [bruna-asdrubal,eugene-fernanda]).

% tempo(DanceStyle, Speed).
% tempo/2 indica a velocidade de cada estilo de dança.
tempo(waltz, slow).
tempo(quickstep, fast).
tempo(foxtrot, slow).
tempo(samba, fast).
tempo(rhumba, slow).

%1
style_round_number(DanceStyle, RoundNumber):-
    round(RoundNumber, DanceStyle, _, _).

%2
n_dancers(RoundNumber, NDancers):-
    round(RoundNumber, _, _, Dancers),
    length(Dancers, NDancers).

%3 

getDancers([], F, F).

getDancers([D1-D2|Dancers], Isolated, Final):-
    append(Isolated, [D1], L1),
    append(L1, [D2], New),
    getDancers(Dancers, New, Final).

danced_in_round(RoundNumber, Dancer):-
    round(RoundNumber, _, _, Dancers),
    getDancers(Dancers, [], Final), 
    member(Dancer, Final).

%4 ?

n_helper(Index, F):-
    \+round(Index, _, _, _),
    F is Index-1.

n_helper(Index, F):-
    round(Index, _, _, _),
    New is Index+1,
    n_helper(New, F).

n_rounds(NRounds):-
    n_helper(1, NRounds).

%5

add_dancer_pair(RoundNumber, Dancer1, Dancer2):-
    round(RoundNumber, A, B, Dancers),
    \+ member(Dancer1-Dancer2, Dancers),
    append(Dancers, [Dancer1-Dancer2], New),
    retract(round(RoundNumber, A, B, Dancers)),
    assert(round(RoundNumber, A, B, New)).

%6

getRoundMinutes(RoundNumber, Dancer, Minutes):-
    round(RoundNumber, _, _, Dancers),
    getDancers(Dancers, [], Final),
    ((member(Dancer, Final),
    round(RoundNumber, _, Minutes, _));
    (\+member(Dancer, Final),
    Minutes is 0)).

getRounds(RoundN, _, T, T) :-
    \+round(RoundN, _, _, _).

getRounds(RoundN, Dancer, TotalMin, T):-
    round(RoundN, _, _, _),
    getRoundMinutes(RoundN, Dancer, Minutes),
    New is TotalMin+Minutes,
    NewRound is RoundN+1,
    getRounds(NewRound, Dancer, New, T).

total_dance_time(Dancer, Time):-
    getRounds(1, Dancer, 0, Time), !.

%7

print_program :-
    helper(1).

helper(Round):-
    \+round(Round, _, _, _).

helper(Round):-
    round(Round, Style, Min, Dan),
    length(Dan, L),
    format('~w (~w) - ~w', [Style, Min, L]), nl,
    New is Round+1,
    helper(New), !.

%8

dancer_n_dances(Dancer, NDances):-
    findall(Round, (round(Round, _, _, Dancers), getDancers(Dancers, [], Final), member(Dancer, Final)), L1),
    length(L1, NDances).


%9

getAllDancers(RoundN, D, Final) :-
    \+round(RoundN, _, _, _),
    sort(D, Final).

getAllDancers(RoundN, All, D):-
    round(RoundN, _, _, Dancers),
    getDancers(Dancers, [], Final),
    append(All, Final, New),
    NewRound is RoundN+1,
    getAllDancers(NewRound, New, D).

getList(J):-
    getAllDancers(1, [], Final),
    setof(Time-D, (member(D, Final), total_dance_time(D, Time)), T),
    sort(T, K),
    reverse(K, J).

getDancer([_Min-Dancer|_], Dancer).

most_tireless_dancer(Dancer):-
    getList(J),
    getDancer(J, Dancer).




edge(a,b).
edge(a,c).
edge(a,d).
edge(b,e).
edge(b,f).
edge(c,b).
edge(c,d).
edge(c,e).
edge(d,a).
edge(d,e).
edge(d,f).
edge(e,f).


dfs(S, F, Nodes):-
    dfs(S, F, [S], L1),
    reverse(L1, Nodes).

dfs(S, F, Nodes, H):-
    edge(S, Next),
    not(member(Next, Nodes)),
    dfs(Next, F, [Next|Nodes], H).

dfs(F, F, H, H).

lists_intersect([], _):- false.

lists_intersect([Node|ProhibitedNodes], All):-
    member(Node, All);
    (\+member(Node, All),
    lists_intersect(ProhibitedNodes, All)).

getAllPaths(Origin, Destination, ProhibitedNodes, All):-
    setof(Nodes, (Origin, Destination, Nodes, ProhibitedNodes)^(dfs(Origin, Destination, Nodes), \+lists_intersect(ProhibitedNodes, Nodes)), All).


findSmallestList([], FinalSize, FinalSize).

findSmallestList([List|All], CurSize, FinalSize):-
    length(List, L),
    ((L < CurSize,
    NewSize is L) ; (NewSize is L)),
    findSmallestList(All, NewSize, FinalSize), !.

shortest_safe_path(Origin, Destination, ProhibitedNodes, Path):-
    all_shortest_safe_paths(Origin, Destination, ProhibitedNodes, All),
    nth0(0, All, Path).


all_shortest_safe_paths(Origin, Destination, ProhibitedNodes, Path):-
    getAllPaths(Origin, Destination, ProhibitedNodes, All),
    findSmallestList(All, 1000, Filter),
    setof(Nodes, (Origin, Destination, Nodes, ProhibitedNodes)^(dfs(Origin, Destination, Nodes), \+lists_intersect(ProhibitedNodes, Nodes), length(Nodes, L), L =:= Filter), Path).
    