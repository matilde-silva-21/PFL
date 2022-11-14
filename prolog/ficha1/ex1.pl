/* (a) */

male(frank). female(grace). female(dede). male(jay). female(gloria). male(javier). female(barb). male(merle).
male(phil). female(claire). male(mitchell). male(joe). male(manny). male(cameron). female(pameron). male(bo).
male(dylan). female(haley). female(alex). male(luke). female(lily). male(rexford). male(calhoun).
male(george). female(poppy).

parent(grace, phil). parent(frank, phil).
parent(dede, claire). parent(jay, claire). parent(dede, mitchell). parent(jay, mitchell).
parent(gloria, joe). parent(jay, joe). 
parent(gloria, manny). parent(javier, manny). 
parent(barb, cameron). parent(merle, cameron). parent(barb, pameron). parent(merle, pameron).
parent(claire, hailey). parent(phil, hailey). parent(claire, alex). parent(phil, alex). parent(claire, luke). parent(phil, luke).
parent(cameron, lily). parent(mitchell, lily). parent(cameron, rexford). parent(mitchell, rexford).
parent(pameron, calhoun). parent(bo, calhoun).
parent(hailey, george). parent(dylan, george). parent(hailey, poppy). parent(dylan, poppy).

/* (b) */

/*
i. female(haley).
ii. male(gil).
iii. parent(frank,phil).
iv. parent(X,claire).
v. parent(gloria, X).
vi. parent(jay, X), parent(X, Y).
vii. parent(X, lily), parent(Y, X).
viii. parent(alex, _).
ix. parent(jay, X), \+ parent(gloria, X).
*/

/* (d) */

/*
i. cousins(hailey, lily).
ii. father(X, luke).
iii. uncle(X, lily).
iv. grandParent(X,Y) :-
    parent(Z, X),
    parent(X, Y).
*/


