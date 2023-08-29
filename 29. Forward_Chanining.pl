% Define initial facts

% Fact 1: Birds lay eggs
lays_eggs(bird).

% Fact 2: Mammals give birth to live young
gives_birth_to_live_young(mammal).

% Rule 1: If an animal lays eggs, it's a bird.
bird(X) :- lays_eggs(X).

% Rule 2: If an animal gives birth to live young, it's a mammal.
mammal(X) :- gives_birth_to_live_young(X).

% Rule 3: If an animal is a bird, it can fly.
can_fly(X) :- bird(X).

% Initialize the knowledge base with initial facts
initial_fact(X) :- lays_eggs(X).
initial_fact(X) :- gives_birth_to_live_young(X).

% Perform forward chaining to derive conclusions
derive_conclusions :-
    initial_fact(X),
    (bird(X) -> assert(bird(X)); true),
    (mammal(X) -> assert(mammal(X)); true),
    (can_fly(X) -> assert(can_fly(X)); true),
    fail.

% Run forward chaining to derive conclusions
:- derive_conclusions.

% Query 1: Is a dog a mammal?
?- mammal(dog).

% Query 2: Can a penguin fly?
?- can_fly(penguin).

% Query 3: Is a sparrow a bird?
?- bird(sparrow).
