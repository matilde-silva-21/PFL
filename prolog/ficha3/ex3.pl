immature(X):- adult(X), !, fail. % Red Cut
immature(X). % Green Cut

adult(X):- person(X), !, age(X, N), N >=18. % Red Cut
adult(X):- turtle(X), !, age(X, N), N >=50. % Red Cut
adult(X):- spider(X), !, age(X, N), N>=1.  % Red Cut
adult(X):- bat(X), !, age(X, N), N >=5.  % Red Cut

