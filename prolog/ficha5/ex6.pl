/* (a) */

exists_in(Elem, List) :- member(Elem, List).
:-op(500, xfx, exists_in).

/* (b) */

:-op(500, xf, append).