% Define the predicate hanoi/3 for solving Towers of Hanoi.
hanoi(1, Source, Target, _) :-
    write('Move disk 1 from '), write(Source), write(' to '), write(Target), nl.
hanoi(N, Source, Target, Auxiliary) :-
    N > 1,
    M is N - 1,
    hanoi(M, Source, Auxiliary, Target),
    write('Move disk '), write(N), write(' from '), write(Source), write(' to '), write(Target), nl,
    hanoi(M, Auxiliary, Target, Source).

% Define a predicate to start the Towers of Hanoi with N disks.
start_hanoi(N) :-
    hanoi(N, 'Source', 'Target', 'Auxiliary').

% Example usage:
% To solve the Towers of Hanoi problem with 3 disks, run:
% ?- start_hanoi(3).
