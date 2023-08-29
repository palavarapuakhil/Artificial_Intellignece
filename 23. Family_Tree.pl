% Define family relationships

% Facts: Parent-child relationships
parent(john, mary).
parent(john, ann).
parent(paul, john).
parent(lisa, mary).
parent(george, paul).
parent(george, lisa).

% Define rules to infer other relationships
father(Father, Child) :-
    parent(Father, Child),
    male(Father).

mother(Mother, Child) :-
    parent(Mother, Child),
    female(Mother).

grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

sibling(Sibling1, Sibling2) :-
    parent(Parent, Sibling1),
    parent(Parent, Sibling2),
    Sibling1 \= Sibling2.

% Define gender information
male(john).
male(paul).
male(george).

female(mary).
female(ann).
female(lisa).

% Define rules for spouse relationships (assuming monogamy)
spouse(Person1, Person2) :-
    parent(Person1, Child),
    parent(Person2, Child),
    Person1 \= Person2.

% Example queries:
% ?- father(john, mary). % Is John the father of Mary?
% ?- mother(lisa, ann). % Is Lisa the mother of Ann?
% ?- grandparent(george, ann). % Is George the grandfather of Ann?
% ?- sibling(john, paul). % Are John and Paul siblings?
% ?- spouse(john, lisa). % Are John and Lisa married?
