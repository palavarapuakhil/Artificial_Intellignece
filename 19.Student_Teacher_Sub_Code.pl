% Define teacher-student-subject relationships
teaches_subject(teacher1, math).
teaches_subject(teacher2, physics).
teaches_subject(teacher3, chemistry).

% Define student-subject relationships
enrolled_in_subject(student1, math).
enrolled_in_subject(student1, physics).
enrolled_in_subject(student2, chemistry).
enrolled_in_subject(student3, math).

% Define subject codes
subject_code(math, 101).
subject_code(physics, 102).
subject_code(chemistry, 103).

% Define rules to get teacher and subject code for a given student and subject
teacher_for_student_subject(Student, Subject, Teacher) :-
    teaches_subject(Teacher, Subject),
    enrolled_in_subject(Student, Subject).

subject_code_for_subject(Subject, Code) :-
    subject_code(Subject, Code).

% Example queries:
% 1. Find the teacher for student1 and math.
%    Query: teacher_for_student_subject(student1, math, Teacher).
%
% 2. Find the subject code for physics.
%    Query: subject_code_for_subject(physics, Code).
