# Reward service

This service handles the reward system of IT-REX.
Depending on solved quizzes, watched lectures, repetition of content, flashcard learning, or any other activity of a student on the platform, this service calculates rewards and saves them in the 4 databases (Growth, Health, Fitness, and Power).
These values will be presented visually to the student on the platform.
The “power” value is a combined value and will be ranked on a scoreboard of students within a course.
The service also provides an API to external services to get rewards in IT-REX (e.g an exercise in another plaeorm is solved and it will also contribute to the reward system of IT-REX).