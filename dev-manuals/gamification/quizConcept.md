# Quizzes

In GITS, we have multiple types of quizzes, see [here](https://gits-enpro.readthedocs.io/en/latest/dev-manuals/services/quiz-service.html).

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

