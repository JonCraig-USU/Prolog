% function for printing a list line by line for each element
% Base case, empty list, do nothing
printList([]).
% many ways to do, Format vs Writeln are just 2 of them, both work
% printList([H|T]) :- format('~w ~n', [H]), printList(T).
printList([H|T]) :- writeln(H), printList(T).

% push an answer onto the end of a list
push(X, [], [X]).                             % base case
push(X, [H | T], [H | W]) :- push(X, T, W).   % common case/recursion

% find a solution that includes a given set of rooms
solveRooms(Castle, L) :- 
  routes(Castle, enter, NL),
  contains_all(L, NL),
  printList(NL).

% helper function to get all possible routes in the castle
% base case for if the room found leads to the exit
routes(Castle, Location, [Location|[exit|[]]]) :- 
  room(Castle, Location, exit, _).

% Typical case/ recursion on all available connections
routes(Castle, Location, [Location|Route]) :- 
  room(Castle, Location, Next, _),
  routes(Castle, Next, Route).

% check the required rooms are in the returned route
% iterates through the first list checking each element(H) is a member of L
contains_all([], _). 
contains_all([H|T], L) :- contains_all(T, L), member(H, L).


% Find a route that has a cost within the given limit
solveRoomsWithinCost(Castle, Limit) :- 
  routeCost(Castle, enter, Limit, NL),
  printList(NL).

% Helper function for getting the limit to check
% base case
routeCost(Castle, Location, RemainingLim, [Location|[exit|[]]]) :-
  room(Castle, Location, exit, Cost),
  RemainingLim - Cost >= 0,
  room(Castle, Location, exit, _).

% recursive case/step
routeCost(Castle, Location, RemainingLim, [Location|Route]) :- 
  room(Castle, Location, Next, Cost),
  NewLim = RemainingLim - Cost,
  routeCost(Castle, Next, NewLim, Route).
