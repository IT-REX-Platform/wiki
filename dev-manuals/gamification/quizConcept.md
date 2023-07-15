# Quizzes

In GITS, we have multiple types of quizzes:

- **Multiple choice quiz**: The user has to answer a number of questions. Each question has multiple answers, of which
  one or
  more are correct. The user has to select all correct answers.
- **Cloze**: The user has to fill in the blanks in a text.
- **Self-assessment**: The user has to answer questions with free text. The user can then compare their answers with the
  correct answers and assess if they answered correctly, similar to flashcards.

## Multiple choice quiz

### Structure of the questions

Each question has a list of answers. Each answer has a text and a boolean whether it is correct or not.
Additionally, each question has a hint, which is shown to the user if they request it.

```graphql
type Question {
    """
    Unique identifier of the question.
    """
    id: UUID!
    """
    Text of the question, can be markdown.
    """
    text: String!
    """
    List of answers.
    """
    answers: [Answer!]!
    """
    How many answers the user has to select.
    """
    numberOfCorrectAnswers: Int!
    """
    Optional hint for the question, can be markdown.
    """
    hint: String
}

type Answer {
    """
    Text of the answer, can be markdown.
    """
    text: String!
    """
    Whether the answer is correct or not.
    """
    correct: Boolean!
}
```

### Structure of the quiz

The quiz has a list of questions and a threshold.
The threshold is the number of questions the user has to answer correctly to pass the quiz.

```graphql

type MultipleChoiceQuiz {
    """
    Identifier of the quiz, same as the identifier of the assessment.
    """
    assessmentId: UUID!
    """
    List of questions.
    """
    questions: [Question!]!
    """
    Threshold of the quiz, i.e., how many questions the user has to answer correctly to pass the quiz.
    """
    threshold: Int!
}
```

### Content type

Multiple choice quizzes are a subclass of Assessment.
There will be a new content type "MULTIPLE_CHOICE_QUIZ".

```graphql
type MultipleChoiceAssessment {
    multipleChoiceQuiz: MultipleChoiceQuiz!

    # inherited fields
    """
    Assessment metadata
    """
    assessmentMetadata: AssessmentMetadata!
    """
    ID of the content
    """
    id: UUID!
    """
    Metadata of the content
    """
    metadata: ContentMetadata!

    """
    Progress data of the content for the current user.
    """
    userProgressData: UserProgressData!
    """
    Progress data of the specified user.
    """
    progressDataForUser(userId: UUID!): UserProgressData!
}
```

### Progress data

We don't track the progress of where exactly the user is in the quiz, i.e., which question they are currently answering
in the backend.
This has the disadvantage that the user can't continue a quiz where they left off.
Also, they could technically stop the quiz if they see that they are going to fail and start it again.
However, we start with the simpler approach and see if this is a problem in the future.

To log that a multiple choice quiz is completed, we provide the following mutation:

```graphql

type Mutation {
    """
    Log that a multiple choice quiz is completed.
    """
    logMultipleChoiceQuizCompleted(input: MultipleChoiceQuizCompletedInput!): MultipleChoiceQuiz!
}

input MultipleChoiceQuizCompletedInput {
    """
    ID of the multiple choice quiz.
    """
    multipleChoiceQuizId: UUID!

    """
    Number of questions the user answered correctly.
    """
    numberOfCorrectAnswers: Int!

    """
    Number of hints the user requested.
    """
    numberOfHintsUsed: Int!
}
```

### Querying multiple choice quizzes

We provide the following queries to get multiple choice quizzes:

```graphql
type Query {
    """
    Get multiple choice quiz by assessment ID.
    """
    multipleChoiceQuizByAssessmentId(id: UUID!): MultipleChoiceQuiz!
    """
    Get all multiple choice quizzes.
    """
    multipleChoiceQuizzes: [MultipleChoiceQuiz!]!
}
```

### Creating multiple choice quizzes

We provide the following mutations to create multiple choice quizzes:

```graphql
type Mutation {
    """
    Create a multiple choice quiz.
    """
    createMultipleChoiceQuiz(input: CreateMultipleChoiceQuizInput!): MultipleChoiceQuiz!

    """
    Update a multiple choice quiz.
    """
    updateMultipleChoiceQuiz(input: UpdateMultipleChoiceQuizInput!): MultipleChoiceQuiz!

    """
    Delete a multiple choice quiz.
    """
    deleteMultipleChoiceQuiz(id: UUID!): UUID!
}

input CreateMultipleChoiceQuizInput {
    """
    Assessment ID of the quiz.
    """
    assessmentId: UUID!
    """
    List of questions.
    """
    questions: [QuestionInput!]!
    """
    Threshold of the quiz, i.e., how many questions the user has to answer correctly to pass the quiz.
    """
    threshold: Int!
}

input QuestionInput {
    """
    Text of the question, can be markdown.
    """
    text: String!
    """
    List of answers.
    """
    answers: [AnswerInput!]!
    """
    Optional hint for the question, can be markdown.
    """
    hint: String
}

input UpdateMultipleChoiceQuizInput {
    """
    Assessment ID of the quiz.
    """
    assessmentId: UUID!
    """
    List of questions.
    """
    questions: [QuestionInput!]!
    """
    Threshold of the quiz, i.e., how many questions the user has to answer correctly to pass the quiz.
    """
    threshold: Int!
}
```