% Define the initial state of the problem
initial_state(state(at_door, on_floor, at_window, has_not_banana)).

% Define the goal state where the monkey has the banana
goal_state(state(_, _, _, has_banana)).

% Define the actions the monkey can take
% The first argument of each action represents the preconditions,
% and the second argument represents the resulting state.
% The third argument provides a textual description of the action.

% Action 1: Walk from the door to the window
move(state(at_door, on_floor, at_window, H), state(at_window, on_floor, at_window, H), walk_to_window) :-
    write('Walk to the window from the door.').

% Action 2: Climb onto the chair
move(state(P, on_floor, P, H), state(P, on_chair, P, H), climb_on_chair) :-
    write('Climb onto the chair.').

% Action 3: Grasp the banana when on the chair
move(state(P, on_chair, P, has_not_banana), state(P, on_chair, P, has_banana), grasp_banana) :-
    write('Grasp the banana while on the chair.').

% Recursive rule to achieve a sequence of actions
% Base case: If the goal state is reached, we're done.
find_solution(State, State, []).
% Recursive case: Find a sequence of actions to reach the goal.
find_solution(State1, State2, [Action|Rest]) :-
    move(State1, IntermediateState, Action),
    find_solution(IntermediateState, State2, Rest).

% Define the main predicate to solve the problem
solve :-
    initial_state(InitialState),
    goal_state(GoalState),
    find_solution(InitialState, GoalState, Actions),
    nl,
    write('Solution:'),
    nl,
    print_actions(Actions).

% Helper predicate to print the list of actions
print_actions([]).
print_actions([Action|Rest]) :-
    write(Action), nl,
    print_actions(Rest).

% Run the solve predicate to find the solution
:- solve.
