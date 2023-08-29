% Facts about planets
planet(mercury, 0.39, 0.24).
planet(venus, 0.72, 0.62).
planet(earth, 1.0, 1.0).
planet(mars, 1.52, 0.11).
planet(jupiter, 5.20, 1898).
planet(saturn, 9.58, 568).
planet(uranus, 19.22, 86.8).
planet(neptune, 30.05, 102).

% Rules to classify planets
inner_planet(Planet) :- planet(Planet, Distance, _), Distance < 1.0.
outer_planet(Planet) :- planet(Planet, Distance, _), Distance >= 1.0.

% Rule to calculate the gravity of a planet
gravity(Planet, Gravity) :- planet(Planet, Distance, Mass), Gravity is Mass / (Distance^2).

% Rule to display planet information
planet_info(Planet) :-
    planet(Planet, Distance, Mass),
    gravity(Planet, Gravity),
    format('Planet: ~w~n', [Planet]),
    format('Distance from the Sun: ~w AU~n', [Distance]),
    format('Mass relative to Earth: ~w~n', [Mass]),
    format('Gravity: ~w m/s^2~n', [Gravity]).

% Example queries:
% ?- inner_planet(Planet).
% ?- outer_planet(Planet).
% ?- planet_info(earth).
