% FINDROUTE Helper Function
% Base case, if youve reached the exit, return a list with the exit included
findRoute(Castle, Location, [Location|[exit|[]]]) :-
	room(Castle, Location, exit, _).
% Typical case, if there is a connection than follow it.
findRoute(Castle, Location, [Location|Route]) :- 
	room(castle, Location, Next, _),
	findRoute(castle, Next, Route).