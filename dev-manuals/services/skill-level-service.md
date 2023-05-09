# Skill level service

This service handles the analysis of the students.
This is the central part of the “intelligent tutor”.
The system analyses the student with the “Bloom taxonomy” so it evaluates their ability to remember, understand, apply, and analyze.
Each taxonomy is a “skill” and exists for every chapter of a course independently.
The calculated skill level is a score between 0-100.
Depending on solved quizzes, repetition of content, flashcard learning, or any other activity of a student on the platform, this service calculates the skill level of the student.
The service provides an API to external services to get skill level improvements in IT-REX (e.g an exercise in another platform is solved and it will also contribute to the skill level system of IT-REX). 
It is also possible for lecturers and tutors to provide manual input into the skill level system for physical exercises and assignments.
The service acts as an analyzer of the individual learning paths of the student. Depending on the score and progress of the student in the course, it suggests content to continue and to improve.