superior(X, Y) :- 
    chefiado_por(Y, X) ;
    superior(X, chefiado_por(Y, J)) .

% nao testei