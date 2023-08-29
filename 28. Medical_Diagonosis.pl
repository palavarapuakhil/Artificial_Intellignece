% Define symptoms
symptom(fever).
symptom(cough).
symptom(headache).
symptom(sore_throat).
symptom(runny_nose).

% Define diseases and their symptoms
disease(cold, [fever, cough, runny_nose]).
disease(flu, [fever, cough, headache, sore_throat]).
disease(allergy, [runny_nose]).

% Define dynamic predicates for storing user responses
:- dynamic yes/2, no/2.

% Define a rule for diagnosing diseases based on symptoms
diagnose(Disease) :-
    symptom(S),
    ask_symptom(S, Disease),
    not(ask_more_symptoms(Disease)).

ask_symptom(S, Disease) :-
    write('Do you have '), write(S), write('? (yes/no): '),
    read(Answer),
    assert_response(Answer, S, Disease).

assert_response(yes, Symptom, Disease) :- assert(yes(Symptom, Disease)).
assert_response(no, Symptom, Disease) :- assert(no(Symptom, Disease)).
assert_response(_, Symptom, Disease) :-
    write('Please answer with yes or no.'), nl,
    ask_symptom(Symptom, Disease).

ask_more_symptoms(Disease) :-
    disease(Disease, Symptoms),
    not(missing_symptoms(Symptoms)).

missing_symptoms([]).
missing_symptoms([Symptom | Rest]) :-
    (yes(Symptom, _) -> missing_symptoms(Rest); no(Symptom, _), !).

% Clear the knowledge base after diagnosis
clear :-
    retractall(yes(_, _)),
    retractall(no(_, _)).

% Main diagnosis predicate
main :-
    write('Welcome to the Medical Diagnosis System'), nl,
    write('Please answer the following questions with yes/no.'), nl,
    diagnose(Disease),
    clear,
    write('Based on the symptoms, you might have '), write(Disease), nl.

% Start the diagnosis by calling the main predicate.
