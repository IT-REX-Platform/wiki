# Quizzes

In GITS, we have multiple types of quizzes:

- **Multiple choice quiz**: The user has to answer a number of questions. Each question has multiple answers, of which
  one or
  more are correct. The user has to select all correct answers.
- **Cloze**: The user has to fill in the blanks in a text.
- **Self-assessment**: The user has to answer questions with free text. The user can then compare their answers with the
  correct answers and assess if they answered correctly, similar to flashcards.

However, a single quiz will not have just one type of question. For example, a quiz may have multiple choice questions,
then a cloze question and then a self-assessment question.

## The general interface

### Structure of the quiz

The quiz has a list of questions and a threshold.
The threshold is the number of questions the user has to answer correctly to pass the quiz.

```graphql

type Quiz {
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

### Question interface

The questions are generic superclass of all question types.

```graphql
interface Question {
  """
  Unique identifier of the question.
  """
  id: UUID!

  """
  Type of the question.
  """
  type: QuestionType!

  """
  Optional hint for the question, can be markdown.
  """
  hint: String
}

enum QuestionType {
  MULTIPLE_CHOICE
  CLOZE
  SELF_ASSESSMENT
}
```

### Structure of the questions

We focus first on multiple choice questions.
Each question has a list of answers. Each answer has a text and a boolean whether it is correct or not.
Additionally, each question has a hint, which is shown to the user if they request it.

```graphql
type MultipleChoiceQuestion implements Question {
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
  answers: [MultipleChoiceAnswer!]!
  """
  How many answers the user has to select.
  """
  numberOfCorrectAnswers: Int!
  """
  Optional hint for the question, can be markdown.
  """
  hint: String
}

type MultipleChoiceAnswer {
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


### Content type

Quizzes are a subclass of Assessment.
There will be a new content type "QUIZ".

```graphql
type QuizAssessment {
  quiz: Quiz!

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

To log that a quiz is completed, we provide the following mutation:

```graphql

type Mutation {
  """
  Log that a multiple choice quiz is completed.
  """
  logQuizCompleted(input: QuizCompletedInput!): Quiz!
}

input QuizCompletedInput {
  """
  ID of the quiz.
  """
  quizId: UUID!

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

### Querying quizzes

We provide the following queries to get quizzes:

```graphql
type Query {
  """
  Get quiz by assessment ID.
  """
  quizByAssessmentId(id: UUID!): Quiz!
  """
  Get all quizzes.
  """
  quizzes: [Quiz!]!
}
```

### Creating quizzes

We provide the following mutations to create quizzes:

```graphql
type Mutation {
  """
  Create a quiz.
  """
  createQuiz(input: CreateQuizInput!): Quiz!

  """
  Update a quiz.
  """
  updateQuiz(input: UpdateQuizInput!): Quiz!

  """
  Delete a quiz.
  """
  deleteQuiz(id: UUID!): UUID!
}

input CreateQuizInput {
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

input UpdateQuizInput {
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