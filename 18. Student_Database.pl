% Define facts for individuals with their names and dates of birth.
person(john, '2000-05-15').
person(susan, '1995-11-20').
person(mary, '1988-03-10').
person(mark, '1990-09-30').
person(lisa, '2005-07-25').

% Query to find the age of a person based on their date of birth.
 age(Name, Age) :-
    person(Name, DOB),
    get_year(DOB, YearOfBirth),
    get_current_year(CurrentYear),
    Age is CurrentYear - YearOfBirth.

% Define predicates to get the current year and extract the year from a date.
get_current_year(CurrentYear) :-
    get_time(TimeStamp),
    stamp_date_time(TimeStamp, DateTime, local),
    date_time_value(year, DateTime, CurrentYear).

get_year(DOB, YearOfBirth) :-
    atom_chars(DOB, Chars),
    append(_, [Year1, Year2, Year3, Year4 | _], Chars),
    atom_chars(YearAtom, [Year1, Year2, Year3, Year4]),
    atom_number(YearAtom, YearOfBirth).
