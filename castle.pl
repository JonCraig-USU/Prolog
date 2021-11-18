% Base case, empty list, do nothing
printList([]).
printList([H|T]) :- format('~w ~n', [H]), printList(T).

push(X, [], [X]).
push(X, [H | T], [H | W]) :- push(X, T, W).  

% Add your comments here
solveRooms(Castle, L) :- 
  tc(enter, exit),
  printList(NL).

% tc(X,Y,L,[X|[Y|L]]) :- room(Castle,X,Y,Z).
% tc(X,Y,L,NL) :- room(Castle,X,Y,Z), tc(W, Y, [X|L], NL).

tc(X,Y) :- room(X,Y).
tc(X,Y) :- room(X,W), tc(W, Y).

% 
% Add your comments here
solveRoomsWithinCost(Castle, Limit) :- 
  printList(NL).
% 

% tc( From, To, Cost) :- tcWithCost( From, To, Cost).
      tcWithCost(From, To, Cost) :- edge(From, To, Cost).
tcWithCost(From, To, Cost) :- edge(From, Y, CostX), tcWithCost(Y, To, CostY), Cost is CostX + CostY.

% appears that a depth first and retreat will be important
% are built ina


% First castle for testing
% The castle is a set of room facts of the form
% room(Castle, FromRoom, ToRoom, cost).
room(dunstanburgh, enter, foyer, 1).
room(dunstanburgh, foyer, livingRoom, 1).
room(dunstanburgh, foyer, hall, 2).
room(dunstanburgh, hall, kitchen, 4).
room(dunstanburgh, hall, garage, 3).
room(dunstanburgh, kitchen, exit, 1).

% % Second castle for testing
% room(windsor, enter, foyer, 1).
% room(windsor, foyer, hall, 2).
% room(windsor, foyer, dungeon, 1).
% room(windsor, hall, throne, 1).
% room(windsor, hall, stairs, 4).
% room(windsor, stairs, dungeon, 3).
% room(windsor, throne, stairs, 1).
% room(windsor, dungeon, escape, 5).
% room(windsor, escape, exit, 1).

% % Third castle for testing
% room(alnwick, enter, foyer, 1).
% room(alnwick, foyer, hall, 2).
% room(alnwick, hall, throne, 1).
% room(alnwick, hall, stairs, 4).
% room(alnwick, stairs, dungeon, 3).
% room(alnwick, dungeon, foundry, 5).
% room(alnwick, foyer, passage, 1).
% room(alnwick, passage, foundry, 1).
% room(alnwick, foundry, exit, 4).

