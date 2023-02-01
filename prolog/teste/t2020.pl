%jogo(nJornada, EquipaCasa, EquipaVis, Res).

jogo(1, sporting, porto, 1-2). 
jogo(1, maritimo, benfica, 2-0). 
jogo(2, sporting, benfica, 0-2). 
jogo(2, porto, maritimo, 1-0). 
jogo(3, maritimo, sporting, 1-1).
jogo(3, benfica, porto, 0-2).

%treinadores(Equipa, [[JornadaInicial-JornadaFinal]-NomeTreinador]).

treinadores(porto, [[1-3]-sergio_conceicao]).
treinadores(sporting, [[1-2]-silas, [3-3]-ruben_amorim]). 
treinadores(benfica, [[1-3]-bruno_lage]).
treinadores(maritimo, [[1-3]-jose_gomes]).

% 1

n_treinadores(Equipa, Numero):-
    treinadores(Equipa, List),
    length(List, Numero).


% 2

getNumberJornadas([[JornadaInicial-JornadaFinal]-Nome | Treinadores], Treinador, Jornadas) :-
    (Nome = Treinador,
    Jornadas is JornadaFinal-JornadaInicial+1) ;
    (Nome \= Treinador,
    getNumberJornadas(Treinadores, Treinador, Jornadas)).

n_jornadas_treinador(Treinador, NumeroJornadas):-
    treinadores(_, Pessoas),
    getNumberJornadas(Pessoas, Treinador, NumeroJornadas).

% 3

ganhou(Jornada, Venc, Der):-
    jogo(Jornada, Venc, Der, _).


% 4 -- (f) porque o valor de Precedencia é mais alto e ha mais espaço de margem
% 5 -- (c)


% 8 

getJornadas([[JornadaInicial-JornadaFinal]-Nome | Treinadores], Treinador, Inicial, Final) :-
    (Nome = Treinador,
    Inicial is JornadaInicial,
    Final is JornadaFinal) ;
    (Nome \= Treinador,
    getNumberJornadas(Treinadores, Treinador, Inicial, Final)).

treinador_bom(Treinador) :-
    treinadores(Equipa, Pessoas),
    getJornadas(Pessoas, Treinador, Inicial, Final),
    
    


    