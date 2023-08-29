% Facts about birds
bird(canary).
bird(ostrich).
bird(hawk).
bird(penguin).

% Define which birds can fly (facts)
can_fly(canary).
can_fly(hawk).

% Define which birds cannot fly (rules)
cannot_fly(Bird) :- bird(Bird), \+ can_fly(Bird).

% Queries to check if a specific bird can fly or not
% Example query 1: Can a canary fly?
% ?- can_fly(canary).
% Output: true

% Example query 2: Can an ostrich fly?
% ?- can_fly(ostrich).
% Output: false

% Example query 3: Which birds cannot fly?
% ?- cannot_fly(Bird).
% Output: ostrich, penguin
