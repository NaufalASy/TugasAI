pria(david).
pria(jack).
pria(john).
pria(ray).
pria(peter).

wanita(amy).
wanita(karen).
wanita(liza).
wanita(susan).
wanita(mary).

menikah(david, amy).
menikah(jack, karen).
menikah(john, susan).

bapaknya(david, liza).
bapaknya(david, john).
bapaknya(jack, susan).
bapaknya(jack, ray).
bapaknya(john, peter).
bapaknya(john, mary).

ibunya(amy, liza).
ibunya(amy, john).
ibunya(karen, susan).
ibunya(karen, ray).
ibunya(susan, peter).
ibunya(susan, mary).

bapaknya(X, Y) :- 
  bapaknya(X, Y).

ibunya(X, Y) :- 
  ibunya(X, Y). 

pasangannya(X, Y) :- 
  (menikah(X, Y) ; menikah(Y, X)).

orangtuanya(X, Y) :- 
  (bapaknya(X, Y) ; ibunya(X, Y)).

anaknya(X, Y) :- 
  (bapaknya(Y, X) ; ibunya(Y, X)).

saudaranya(Y, Z) :- 
  orangtuanya(X, Y), orangtuanya(X, Z).

iparnya(X, Y) :- 
  not(pasangannya(X,Y)),
  ((saudaranya(X, W),pasangannya(W, V)) ; pasangannya(X, V)),
  saudaranya(V, Y).

kakeknya(X, Z) :-
  bapaknya(X, Y), 
  anaknya(Z, Y).

neneknya(X, Z) :- 
  ibunya(X, Y), 
  anaknya(Z, Y).

cucuknya(X, Y) :- 
  (kakeknya(Y, X) ; neneknya(Y, X)).

omnya(X, Y) :- 
  pria(X), 
  saudaranya(X, Z), 
  anaknya(Y, Z).

tantenya(X, Y) :- 
  wanita(X), 
  saudaranya(X, Z), 
  anaknya(Y, Z).
