/* (a) */
leciona(adalberto, algoritmos).
leciona(bernadete, bd).
leciona(capitolino, compiladores).
leciona(diogenes, estatistica).
leciona(ermelinda, redes).

frequenta(alberto, algoritmos).
frequenta(bruna, algoritmos).
frequenta(cristina, algoritmos).
frequenta(diogo, algoritmos).
frequenta(eduarda, algoritmos).

frequenta(antonio, bd).
frequenta(bruno, bd).
frequenta(cristina, bd).
frequenta(duarte, bd).
frequenta(eduardo, bd).

frequenta(alberto, compiladores).
frequenta(bernardo, compiladores).
frequenta(clara, compiladores).
frequenta(diana, compiladores).
frequenta(eurico, compiladores).

frequenta(antonio, estatistica).
frequenta(bruna, estatistica).
frequenta(claudio, estatistica).
frequenta(duarte, estatistica).
frequenta(eva, estatistica).

frequenta(alvaro, redes).
frequenta(beatriz, redes).
frequenta(claudio, redes).
frequenta(diana, redes).
frequenta(eduardo, redes).

/* (b) */
/*
i. leciona(diogenes, X).
ii. leciona(felismina, X).
iii. frequenta(claudio, X).
iv. frequenta(dalmindo, X).
v. frequenta(eduarda, X), leciona(bernardete,X).
vi. frequenta(alberto, X), frequenta(alvaro, X).
*/

/* (c) */

/*i.*/
aluno(X,Y) :- leciona(Y, Z), frequenta(X, Z).
/*ii.*/
alunos(X, Z) :- leciona(X, Y), frequenta(Z, Y).
/*iii.*/
professores(X, Z) :- leciona(Z, Y), frequenta(X, Y).
/*iv.*/
dois_prof(X, Y, W) :- professores(X, W), professores(Y, W).
/*v.*/

/*vi.*/


