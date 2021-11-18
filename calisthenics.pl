% Factorial
factorial(0, 1).
factorial(X, Y) :-
    X > 0,
    W is X-1, 
    factorial(W, Z), 
    Y is Z*X.

% ? factorial(Y, 6).


numberx(1).
numberx(3).
numberx(4).
realx(3, 4).

sumx(0, 0).
sumx(1, 1).
sumx(2, 3).
sumx(X, Y) :- 
    W is X - 1,
    sumx(W, Z),
    Y is X + Z.
/*
CS 4700 Prolog Calisthenics
 
Assume the following collection of facts.
 number(1).
 number(3).
 number(4).
 real(3, 4).
 list([1, 2, 3]).
State if the following goals succeed or fail, and what bindings are produced?
1)         ?- number(1).
succeeds

2)         ?- real(X, 4).
succes, X = 3

3)         ?- number(X), number(Y).
succeeds, X = 1 and Y = 1

4)         ?- number(W), number(Z), W is Z+1.
succeeds, W = 4 and Z = 3

5)         ?- number(X), number(Y), real(X, Y).
succeeds, X = 3 and Y = 4

6)         ?- list([H|_]).
succeeds, H = 1

7)         ?- list([H|T]).
succeeds, H = 1 and T = [2, 3]

8)         ?- list([H|_]), number(X), X is H+2.
succeeds, H = 1 and X = 3

*/

% Express the following functions in Prolog.
% 1)         f(x) = x + 3.  
f(X, Y) :- Y is X + 3. 

% 2)        f(x,y) = x + y.
  f(X, Y, Z) :- Z is X + Y.
 
% 3)         f(x) = x + (x – 1) + (x – 2) + … + 0.
   Prolog: 
f(0,0).
f(X,Y) :- W is X - 1, f(W, Z), Y is X + Z.
 
Give Prolog rules for the following.
% 1)    Find out if a value is the member of a list, e.g, memberOf(1, [1, 2, 3]) would succeed, while memberOf(4, [1, 2, 3]) would fail.
% Case for Empty List
memberOf(_, []) :- fail.
% Note, \== is !=
memberOf(X, [X | _]).
memberOf(X, [H | T]) :- X \== H, memberOf(X, T). 
 
 
% 2)  Peek at the value at the end of the list, e.g., peek([1, 2, 3], Y) would bind Y=3.
peek([], Num) :- fail.
peek([H], H).
peek([_|T], X) :- peek(T, X).
 
% 3)  Push a value on the end of the list, e.g., push(0, [1, 2, 3], Y) would bind Y=[1, 2, 3, 0].
push(X, [], [X]).
push(X, [H | T], [H | W]) :- push(X, T, W).  
  
% 4)  Append a list to a list, e.g., app([1, 2, 3], [4, 5], Y) would bind Y=[1,2,3,4,5].

app([], [], []).
app([], Y, Y).
app(Y, [], Y).
app([H | T], Y, [H | F]) :- app(T, Y, F). 
 
% 5)  Compute the transitive closure of a graph to exactly a given cost.  Let there be a collection of edge facts of the form, edge(From, To, Cost), for example,
edge(slc, lax, 4).
edge(lax, sfo, 1).
edge(slc, sea, 2).
edge(sea, sfo, 1).
edge(sea, lax, 2).
edge(lax, sea, 2).
 
then tc(From, To, Cost), given a goal of ?- tc(slc, To, 3) would bind of To=sfo since there is a flight through sea to sfo that costs 3 total.


tc( From, To, Cost) :- tcWithCost( From, To, Cost).
      tcWithCost(From, To, Cost) :- edge(From, To, Cost).
tcWithCost(From, To, Cost) :- edge(From, Y, CostX), tcWithCost(Y, To, CostY), Cost is CostX + CostY.




