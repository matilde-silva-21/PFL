/* (a) */
piloto(lamb).
piloto(besenyei).
piloto(chambliss).
piloto(macLean).
piloto(mangold).
piloto(jones).
piloto(bonhomme).

equipa(lamb, breitling).
equipa(besenyei, redBull).
equipa(chambliss, redBull).
equipa(macLean, mediterranean).
equipa(mangold, cobra).
equipa(jones, matador).
equipa(bonhomme, matador).

aviao(lamb, mx2).
aviao(besenyei, edge540).
aviao(chambliss, edge540).
aviao(macLean, edge540).
aviao(mangold, edge540).
aviao(jones, edge540).
aviao(bonhomme, edge540).

circuito(istanbul).
circuito(budapest).
circuito(porto).

venceu(jones, porto).
venceu(mangold, budapest).
venceu(mangold, istanbul).

gates(istanbul, 9).
gates(budapest, 6).
gates(porto, 5).

equipa_venceu(X, W) :- equipa(Y, X), venceu(Y, W).

/* (b) */

/*

i. venceu(X, porto).
ii. equipa_venceu(X, porto).
iii. gates(X, N), N>8.
iv. aviao(X, Y), Y\=edge540.
v. venceu(X, Y), venceu(X, Z), Y\=Z.
vi. aviao(X, Y), venceu(X, porto).

*/
