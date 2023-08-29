% Define some facts and rules

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

% Backward chaining goal 1: Is a dog a mammal?
is_mammal(dog) :- mammal(dog).

% Backward chaining goal 2: Can a penguin fly?
can_penguin_fly(penguin) :- can_fly(penguin).

% Backward chaining goal 3: Is a sparrow a bird?
is_bird(sparrow) :- bird(sparrow).
