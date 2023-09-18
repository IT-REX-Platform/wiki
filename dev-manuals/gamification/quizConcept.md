# Quizzes

In GITS, we have multiple types of quizzes:

### Multiple Choice Quiz

In a Multiple Choice Quiz, users must answer a set of questions. Each question presents multiple answers, with one or more being correct. Users are required to select all correct answers.

### Cloze Quiz

The Cloze Quiz prompts users to fill in the blanks within a given text, testing their understanding of the content.

### Self-Assessment Quiz

The Self-Assessment Quiz presents users with questions that require free-text responses. Users can later compare their answers with correct solutions, similar to flashcards.

### AssociationQuestion

In an Association Question, users are tasked with establishing associations between different elements. This type of quiz challenges users to match items from two or more columns, identifying correct pairings.

### ExactAnswerQuestion

The Exact Answer Question presents users with questions that require precise, specific responses. Users need to provide answers that precisely match predefined correct solutions.

### NumericQuestion

In a Numeric Question, users must respond with numerical values. This quiz type is used for questions that demand numeric answers, such as mathematical calculations or numerical data input.

However, a single quiz will not have just one type of question. For example, a quiz may have multiple choice questions,
then a cloze question and then a self-assessment question.

## The general interface

### Structure of the quiz

The quiz has a list of questions and a threshold.
The threshold is the number of questions the user has to answer correctly to pass the quiz.
See also the [API docs](https://github.com/IT-REX-Platform/quiz_service/blob/main/api.md#question) 

### Question interface

The questions are generic superclass of all question types.
[See API docs](https://github.com/IT-REX-Platform/quiz_service/blob/main/api.md#question).

### Content type

Quizzes are a subclass of Assessment.
There is a content type "QUIZ".

### Progress data

We don't track the progress of where exactly the user is in the quiz, i.e., which question they are currently answering
in the backend.
This has the disadvantage that the user can't continue a quiz where they left off.
Also, they could technically stop the quiz if they see that they are going to fail and start it again.
However, we start with the simpler approach and see if this is a problem in the future.

To log that a quiz is completed, we provide [a graphQL mutation](https://github.com/IT-REX-Platform/quiz_service/blob/main/api.md#mutation).

