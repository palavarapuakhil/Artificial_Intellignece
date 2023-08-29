% Base case: The sum of integers from 1 to 1 is 1.
sum(1, 1).

% Recursive rule: The sum of integers from 1 to n is Sum if the sum of integers from 1 to n-1 is Sum1,
% and Sum is Sum1 plus n.
sum(N, Sum) :-
    N > 1,
    N1 is N - 1,
    sum(N1, Sum1),
    Sum is Sum1 + N.

