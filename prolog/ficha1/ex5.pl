cargo(tecnico, eleuterio).
cargo(tecnico, juvenaldo).
cargo(analista, leonilde).
cargo(analista, marciliano).
cargo(engenheiro, osvaldo).
cargo(engenheiro, porfirio).
cargo(engenheiro, reginaldo).
cargo(supervisor, sisnando).
cargo(supervisor_chefe, gertrudes).
cargo(secretaria_exec, felismina).
cargo(diretor, asdrubal).
chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, diretor).
chefiado_por(secretaria_exec, diretor).

/* (a) */
/*
i. O cargo do Sisnando que é chefiado por um analista.
ii. Todos os cargos que sejam chefiados e simultaneamente chefiam um técnico
iii. Todas as pessoas chefiadas por um supervisor
iv. Todos as pessoas chefiadas por um diretor exceto a Felismina.
*/

/* (b) */
/*
i. X = supervisor ?
ii. X = engenheiro,
    Y = supervisor ?
iii. J = engenheiro,
    P = osvaldo ?
iv. P = supervisor_chefe ?
*/

/* (c) */

/* i. */
chefe(X, Y) :- cargo(B, Y), chefiado_por(B, A), cargo(A, X).

/* ii. */
mesmo_cargo_chefe(X, Y) :- cargo(B, X), cargo(C, Y), chefiado_por(B, A), chefiado_por(C, A).

/* iii. */
cargo_sem_chefe(X) :- cargo(X, Y), (\+ chefe(_, Y)).

/* iv. */
nao_chefiadas(X) :- cargo(Y, X), cargo_sem_chefe(Y).