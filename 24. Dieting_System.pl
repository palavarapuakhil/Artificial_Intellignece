% Dynamic predicates to store dietary restrictions
:- dynamic diet_restriction/2.

% Initial dietary restrictions
diet_restriction(diabetes, [sugar, sweets, sugary_beverages, white_bread]).
diet_restriction(hypertension, [high_sodium_foods, processed_meats, fatty_foods]).
diet_restriction(celiac_disease, [gluten_containing_foods, wheat, barley, rye]).
diet_restriction(cholesterol, [trans_fats, fried_foods, fatty_cuts_of_meat]).

% Rules to suggest diets based on disease
suggest_diet(Patient, Disease, RecommendedDiet) :-
    retractall(checked(_)),
    diet_restriction(Disease, RestrictedFoods),
    suggest_foods(Patient, RestrictedFoods, RecommendedDiet).

suggest_foods(_, [], []).
suggest_foods(Patient, [Food | Rest], [Food | RecommendedDiet]) :-
    \+ checked(Food),
    ask_patient(Patient, Food, Answer),
    Answer = yes,
    assert(checked(Food)),
    suggest_foods(Patient, Rest, RecommendedDiet).
suggest_foods(Patient, [_ | Rest], RecommendedDiet) :-
    suggest_foods(Patient, Rest, RecommendedDiet).

ask_patient(Patient, Food, Answer) :-
    format('Is ~w allowed for ~w? (yes/no): ', [Food, Patient]),
    read(Answer),
    Answer = yes; Answer = no.

% Example queries:
% ?- suggest_diet(john, diabetes, RecommendedDiet).
% ?- suggest_diet(emma, hypertension, RecommendedDiet).
% ?- suggest_diet(mike, celiac_disease, RecommendedDiet).
% ?- suggest_diet(susan, cholesterol, RecommendedDiet).
