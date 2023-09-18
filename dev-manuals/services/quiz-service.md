# Quiz service

Quizzes are one type of assessment content a user can consume while being part of a course.
The quiz service stores all quizzes and also takes care of any creation, modification and deletion of quizzes. This service can also evaluate and provide feedback for a user's progress for each quiz.

A more technical description of the flashcard service and its GraphQL endpoints can be found in our [Github Repository README](https://github.com/IT-REX-Platform/quiz_service#readme).

## Quiz types
Currently, the quiz service provides support for 6 different types of quizzes:

| Quiz Type             | Description                                                                                                                                                                                                                                                                     |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Multiple Choice Quiz  | In a Multiple Choice Quiz, users must answer a set of questions. Each question presents multiple answers, with one or more being correct. Users are required to select all correct answers.                                                                                     |
| Cloze Quiz            | The Cloze Quiz prompts users to fill in the blanks within a given text, testing their understanding of the content. For all blanks, a set of answers is presented for the user to choose from. In this answer set answers can be included that do not fit in any of the blanks. |
| Self-Assessment Quiz  | The Self-Assessment Quiz presents users with questions that require free-text responses. Users can later compare their answers with the correct solutions and track if their response was correct.                                                                              |
| Association-Question  | In an Association Question, users are tasked with establishing associations between different elements. This type of quiz challenges users to match items from two or more columns, identifying correct pairings.                                                               |
| Exact-Answer-Question | The Exact Answer Question presents users with questions that require precise, specific responses. Users need to provide answers that precisely match predefined correct solutions.                                                                                              |
| Numeric-Question      | In a numeric Question, users must respond with numerical values. This quiz type is used for questions that demand numeric answers, such as mathematical calculations or numerical data input.                                                                                   |

## Tracking a user's progress
Next to handling quizzes, the quiz service can also track the progress of individual users for quizzes.
Unlike other other services handling different kinds of content (such as the [flashcard service](./flashcard-service.md)) this service does not save any user progress in this service. Instead it evaluates logged progress by checking result data against constraints defined in the quiz, such as a minimum of correct answers. The results of this evaluation (including Meta data such as number of hints used in the quiz) are then passed on to the [content service](./content-service.md) that are used for the reward score calculation in the [reward service](./reward-service.md)).
For more information on user progress tracking in our application we recommend reading our [documentation on user progress](../gamification/userProgress.md).
