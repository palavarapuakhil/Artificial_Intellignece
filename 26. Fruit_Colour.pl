% Define facts about fruits and their colors
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(strawberry, red).
fruit_color(blueberry, blue).

% Define a rule to find the color of a fruit
find_color(Fruit, Color) :- fruit_color(Fruit, Color).

% Define a rule to find all fruits of a given color using backtracking
find_fruit(Color, Fruit) :- fruit_color(Fruit, Color).

% Example queries:
% 1. Find the color of a specific fruit (e.g., apple).
% ?- find_color(apple, Color).
%
% 2. Find all fruits of a specific color (e.g., red).
% ?- find_fruit(red, Fruit).
