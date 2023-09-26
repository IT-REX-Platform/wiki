# Add content to courses

Latest Update: 25.09.2023

This file contains the testing plans for the lecturer view and functionalites on course content.

A general prerequisite for all tests is that the user has a stable internet connection to the site.
A general fail condition for all tests is that the view is not updated or data is not shown even after a manual refresh.

## Media content

### Lecturer wants to add a pdf/video conent to a section

**Test Item** The `MediaContentModal.tsx` file and the `AddContentModal.tsx` in the `component` folder is to be tested.

**Prerequisites** In the course there is at least one chapter with a section that has a stage.

**Step 1** The lecturer clicks the add content button within the stage of a section, which is in a chapter &rarr;  pop-up is shown to select content to be added

**Step 2** The lecturer clicks on "Add media" &rarr; "Add media" pop-up to input media metadata and selecting a file is shown

**Step 3** Lecturer enters the required content metadata and clicks on "Add file" &rarr; file upload and selection pop-up is shown

**Step 4** Lecturer uploads a content from the harddrive or selects an already existing one in the memory and clicks on "ok" &rarr; media is added and add media pop-up is shown again

**Step 5** Lecturer clicks on add &rarr; select content pop-up is shown again

**Step 6** Lecturer selects the content he wants to add and whether it is required and clicks "ok" &rarr; content with given metadata is added

**Successful Postconditions** The new content is added and shown in the section correctly as the media type it is. The content is shown within a reasonable timeframe *(< 60s)*.

**Failed Postcondition** The content is not added correctly (e.g. wrong name or media type) or the content is not shown within a reasonable timeframe *(> 60s)*. Another fail condition is that the content is not shown in the section at all or the is shown as a invalid media type.

## Flashcards

### Lecturer wants to create and add a new set of flashcards

**Test Item** The `AddFlashcardSetModal.tsx` file and the `AddContentModal.tsx` in the `component` folder is to be tested.

**Prerequisites** In the course there is at least one chapter with a section that has a stage.

**Step 1** The lecturer clicks the add content button within the stage of a section, which is in a chapter &rarr;  pop-up is shown to select content to be added

**Step 2** The lecturer clicks on "Add flashcards" &rarr; "Add flashcards" pop-up to input flashcards metadata is shown

**Step 3** Lecturer enters the required flashcards metadata and clicks on "Add" &rarr; flashcards set is added and select content pop-up is shown again

**Step 4** Lecturer selects the flashcards set he wants to add to the section and whether it is required and submits &rarr; flashcards set with given metadata is added to stage

**Successful Postconditions** The new flashcards set is added and shown in the stage correctly. The flashcards set is shown within a reasonable timeframe *(< 60s)*. The flashcard set it empty and can be edited. The flashcard set is shown as content of the type flashcards.

**Failed Postcondition** The flashcards set is not added correctly (e.g. wrong name or media type) or the flashcards set is not shown within a reasonable timeframe *(> 60s)*. Another fail condition is that the flashcards set is not shown in the stage at all and was not added to the stage in the backend.

### Lecturer wants to edit a set of flashcards

**Test Item** The `lecturer.tsx` file in the `app/course/[courseId]/flashcards/[flashcardSetId]` folder, as well as the `EditFlashcardSetModal.tsx` in the `component` folder, are to be tested.

**Prerequisites** The lecturer is on the page of a flashcard set that he has the permission to edit.

**Step 1** The lecturer clicks the edit button in top right corner &rarr; editing pop-up shows up

**Step 2** The lecturer changes the flashcard set information and at the end submits the updated data &rarr; pop-up goes away

**Successful postconditions** The flashcard set information is saved successfully and when the edit pop-up is opened again it displays the updated values.

**Failed postcondition** The flashcard set information is not saved and the lecturer is shown an error message or the flashcard set information is saved incorrect (e.g. wrong name or description).

### Lecturer wants to delete a flashcard set

**Test Item** The `lecturer.tsx` file in the `app/course/[courseId]/flashcards/[flashcardSetId]` folder is to be tested.

**Prerequisites** The lecturer is on the page of a flashcard set that he has the permission to edit.

**Step 1** The lecturer clicks the delete button in top right corner &rarr; deletion pop-up shows up

**Step 2** The lecturer accepts the deletion pop-up &rarr; pop-up goes away

**Successful postconditions** The flashcard set is deleted successfully in the UI and the database and the lecturer is redirected to the course page within a reasonable timeframe *(< 60s)*.

**Failed postcondition** The flashcard set is not deleted correctly (from database or UI) and the lecturer is shown an error message or the flashcard set is deleted but the lecturer is not redirected to the course page.

### Lecturer wants to create and add a new flashcard

**Test Item** The `lecturer.tsx` file in the `app/course/[courseId]/flashcards/[flashcardSetId]` folder is to be tested.

**Prerequisites** The lecturer is on the page of a flashcard set that he has the permission to edit.

**Step 1** The lecturer clicks the "Add flashcard" button below the title of the flashcard set &rarr; provisional flashcard is added to the flashcard set

**Step 2** The lecturer clicks the "Add side" button of the provisional flashcard &rarr; pop-up for a flashcard side is shown

**Step 3** After the lecturer met all requirements and the flashcard sides are in order he clicks on "save" &rarr; flashcard is added to the flashcard set

**Successful postconditions** The flashcard is added to the flashcard set and shown in the flashcard set page correctly. The flashcard is shown within a reasonable timeframe *(< 60s)*.

**Failed postcondition** The flashcard is not added correctly (e.g. wrong number of sides) or the flashcard is not shown within a reasonable timeframe *(> 60s)*. Another fail condition is that the flashcard is not shown in the flashcard set at all and was not added to the flashcard set in the backend, because of an error.

### Lecturer wants to edit a flashcard

**Test Item** The `lecturer.tsx` file in the `app/course/[courseId]/flashcards/[flashcardSetId]` folder is to be tested.

**Prerequisites** The lecturer is on the page of a flashcard set that he has the permission to edit.

**Step 1** The lecturer clicks the edit button symbolized by a pen near the flashcard &rarr; flashcard is shown in provisional state

**Step 2** The lecturer changes the flashcard sides and at the end submits the updated data &rarr; flashcard is shown in the flashcard set page again

**Successful postconditions** The flashcard is updated successfully and shown in the flashcard set page correctly. The flashcard is shown within a reasonable timeframe *(< 60s)*.

**Failed postcondition** The flashcard is not updated correctly (e.g. wrong number of sides) or the flashcard is not shown within a reasonable timeframe *(> 60s)*. Another fail condition is that the flashcard is not shown in the flashcard set at all and was not updated in the backend, because of an error.

### Lecturer wants to delete a flashcard

**Test Item** The `lecturer.tsx` file in the `app/course/[courseId]/flashcards/[flashcardSetId]` folder is to be tested.

**Prerequisites** The lecturer is on the page of a flashcard set that he has the permission to edit.

**Step 1** The lecturer clicks the delete button symbolized by a trash bin near the flashcard

**Successful postconditions** The flashcard is deleted successfully in the UI and the database and the flashcard set page is shown updated within a reasonable timeframe *(< 60s)*.

**Failed postcondition** The flashcard is not deleted correctly (from database or UI) and the lecturer is shown an error message or the flashcard is deleted but the flashcard set page is not updated.

### Lecturer wants to add a new side to a flashcard

**Test Item** The `lecturer.tsx` file in the `app/course/[courseId]/flashcards/[flashcardSetId]` folder is to be tested.

**Prerequisites** The lecturer is on the page of a flashcard set that he has the permission to edit. He already is in the mode after creating a new flashcard or editing a flashcard.

**Step 1** The lecturer clicks the "Add side" button in the provisional flashcard mode &rarr; pop-up for a flashcard side is shown

**Step 2** The lecturer puts in all the needed information (Text, correctness, is it a question or an answer or both) and when done he clicks on "Save" &rarr; flashcard is added to the flashcard set

**Successful postconditions** The flashcard side is added to the provisional flashcard and shown in the flashcard set page correctly. The flashcard side is shown within a reasonable timeframe *(< 60s)*. After the save of the flashcard it persists or an notification is shown that the flashcard is not saved with the information why.

**Failed postcondition** The flashcard side is not added correctly (e.g. wrong information) or the flashcard side is not shown within a reasonable timeframe *(> 60s)*. Another fail condition is that the flashcard side is not shown in the flashcard set at all and was not added to the flashcard set in the backend, because of an error without a notification of why it was not added.

## Quizzes

### Lecturer wants to create a new quiz

**Test Item** The `QuizModal.tsx` file and the `AddContentModal.tsx` in the `component` folder is to be tested.

**Prerequisites** In the course there is at least one chapter with a section that has a stage.

**Step 1** The lecturer clicks the add content button within the stage of a section of a chapter &rarr; select content pop-up is shown

**Step 2** The lecturer clicks on "Add quiz" &rarr; add quiz pop-up to input quiz metadata

**Step 3** Lecturer enters quiz metadata and clicks on "add" &rarr; quiz is added and select content pop-up is shown again

**Step 4** lecturer selects the quiz he wants to add to the section and whether it is required and clicks "ok" &rarr; quiz with given metadata is added

**Successful Postconditions** The new quiz is added and shown in the stage with the correct name and content type. The quiz is shown within a reasonable timeframe *(< 60s)*.

**Failed Postcondition** The quiz is not added correctly (e.g. wrong name or media type) or the quiz is not shown within a reasonable timeframe *(> 60s)*. Another fail condition is that the quiz is not shown in the stage at all and was not added to the stage in the backend.

### Lecturer wants to edit a quiz

**Test Item** The `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder, as well as the `EditQuizModal.tsx` in the `component` folder, are to be tested.

**Prerequisites** The lecturer is on the page of a quiz that he has the permission to edit.

**Step 1** The lecturer clicks the edit button in top right corner &rarr; editing pop-up shows up

**Step 2** The lecturer changes the quiz information and at the end submits the updated data &rarr; pop-up goes away

**Successful postconditions** The quiz information is saved successfully and when the edit pop-up is opened again it displays the updated values.

**Failed postcondition** The quiz information is not saved and the lecturer is shown an error message or the quiz information is saved incorrect (e.g. wrong name or description).

### Lecturer wants to delete a quiz

**Test Item** The `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder is to be tested, as well as the `DeleteQuizButton.tsx` file in the `component` folder.

**Prerequisites** The lecturer is on the page of a quiz that he has the permission to edit.

**Step 1** The lecturer clicks the delete button in top right corner &rarr; deletion pop-up shows up

**Step 2** The lecturer accepts the deletion pop-up &rarr; pop-up goes away

**Successful postconditions** The quiz is deleted successfully in the UI and the database and the lecturer is redirected to the course page within a reasonable timeframe *(< 60s)*.

**Failed postcondition** The quiz is not deleted correctly (from database or UI) and the lecturer is shown an error message or the quiz is deleted but the lecturer is not redirected to the course page.

### Lecturer wants to create and add a new multiple choice question

**Test Item** The `AddMultipleChoiceQuestionModal.tsx` file in the `component` folder is to be tested, as well as the `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder.

**Prerequisites** The lecturer is on the page of the selected quiz.

**Step 1** The lecturer clicks on the quiz  he wants to add a question to &rarr; quiz page is shown

**Step 2** The lecturer clicks on "Add question" and selects multiple choice question &rarr; add multiple choice question pop-up is shown

**Step 3** Lecturer enters questions, answers, hints and feedback and clicks on "Save" &rarr; page of the quiz is shown again

**Successful Postcondition** The new question is added to the quiz and shown on the quiz page with the correct information.

**Failed postcondition** The question is not added correctly (e.g. wrong name or information). Another fail condition is that the question is not shown on the quiz page at all and was not added to the quiz in the backend.

### Lecturer wants to edit a multiple choice quiz

**Test Item** The `EditMultipleChoiceQuestionModal.tsx` file in the `component` folder is to be tested, as well as the `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder.

**Prerequisites** The lecturer is on the page of the selected quiz and a multiple choice question exists.

**Step 1** The lecturer clicks on the edit button symbolized by a pen near the question &rarr; edit multiple choice question pop-up is shown

**Step 2** The lecturer edits the question and clicks on "Save" &rarr; page of the quiz set is shown again

**Successful Postconditions** The question has been changed correctly and the changes are shown on the quiz page.

**Failed postcondition** The question has not been changed correctly or the changes are not shown on the quiz page. The lecturer is not notified of the error.

### Lecturer wants to delete a multiple choice question

**Test Item** The `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder is to be tested, as well as the `DeleteQuestionButton.tsx` file in the `component` folder.

**Prerequisites** The lecturer is on the page of the selected quiz and a multiple choice question exists.

**Step 1** The lecturer clicks on the delete button symbolized by a trash bin near the question

**Successful Postconditions** The question has been deleted correctly and the changes are shown on the quiz page.

**Failed postcondition** The question has not been deleted correctly and question is still shown on the quiz page. The lecturer is not notified of the error.

### Lecturer wants to create and add a new cloze question with free text

**Test Item** The `AddClozeQuestionModal.tsx` file in the `component` folder is to be tested, as well as the `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder.

**Prerequisites** The lecturer is on the page of the selected quiz.

**Step 1** The lecturer clicks on the quiz  he wants to add a question to &rarr; quiz page is shown

**Step 2** The lecturer clicks on "Add question" and selects cloze question &rarr; add cloze question pop-up is shown

**Step 3** Lecturer enters questions, answers, hints and feedback and clicks on "Save" without entering wrong anwsers &rarr; page of the quiz is shown again

**Successful Postcondition** The new cloze question is added to the quiz and shown on the quiz page with the correct information and the as the correct type.

**Failed postcondition** The question is not added correctly (e.g. wrong name or information). Another fail condition is that the question is not shown on the quiz page at all and was not added to the quiz in the backend.

### Lecturer wants to create and add a new cloze question with drag and drop

**Test Item** The `AddClozeQuestionModal.tsx` file in the `component` folder is to be tested, as well as the `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder.

**Prerequisites** The lecturer is on the page of the selected quiz.

**Step 1** The lecturer clicks on the quiz  he wants to add a question to &rarr; quiz page is shown

**Step 2** The lecturer clicks on "Add question" and selects cloze question &rarr; add cloze question pop-up is shown

**Step 3** Lecturer enters questions, correct answers and wrong answer options, hints and feedback and clicks on "Save" &rarr; page of the quiz is shown again

**Successful Postcondition** The new cloze question is added to the quiz and shown on the quiz page with the correct information and the as the correct type.

**Failed postcondition** The question is not added correctly (e.g. wrong name or information). Another fail condition is that the question is not shown on the quiz page at all and was not added to the quiz in the backend.

### Lecturer wants to edit a cloze question

**Test Item** The `ClozeQuestionModal.tsx` file, `EditClozeQuestionButton.tsx` file and `ClozeQuestionPreview.tsx` file in the `component` folder are to be tested, as well as the `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder.

**Prerequisites** The lecturer is on the page of the selected quiz and a cloze question exists.

**Step 1** The lecturer clicks on the edit button symbolized by a pen near the question &rarr; edit cloze question pop-up is shown

**Step 2** The lecturer edits the question and clicks on "Save" &rarr; page of the quiz set is shown again

**Successful Postconditions** The cloze question has been changed correctly and the changes are shown on the quiz page.

**Failed postcondition** The question has not been changed correctly or the changes are not shown on the quiz page. The lecturer is not notified of the error.

### Lecturer wants to delete a cloze question

**Test Item** The `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder is to be tested, as well as the `DeleteQuestionButton.tsx` file and `ClozeQuestionPreview.tsx` file in the `component` folder.

**Prerequisites** The lecturer is on the page of the selected quiz and a cloze question exists.

**Step 1** The lecturer clicks on the delete button symbolized by a trash bin near the question

**Successful Postconditions** The question has been deleted correctly and the changes are shown on the quiz page.

**Failed postcondition** The question has not been deleted correctly and question is still shown on the quiz page. The lecturer is not notified of the error.

### Lecturer wants to create and add a new association question

**Test Item** The `AddAssociationQuestionModal.tsx` file in the `component` folder is to be tested, as well as the `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder.

**Prerequisites** The lecturer is on the page of the selected quiz.

**Step 1** The lecturer clicks on the quiz  he wants to add a question to &rarr; quiz page is shown

**Step 2** The lecturer clicks on "Add question" and selects cloze question &rarr; add cloze question pop-up is shown

**Step 3** Lecturer enters questions, answers pairs, hints and feedback and clicks on "Save" &rarr; page of the quiz is shown again

**Successful Postcondition** The new association question is added to the quiz and shown on the quiz page with the correct information and the as the correct type.

**Failed postcondition** The question is not added correctly (e.g. wrong name or information). Another fail condition is that the question is not shown on the quiz page at all and was not added to the quiz in the backend.

### Lecturer wants to edit a association question

**Test Item** The `AssociationQuestionModal.tsx` file, `EditAssociationQuestionButton.tsx` file and `AssociationQuestionPreview.tsx` file in the `component` folder are to be tested, as well as the `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder.

**Prerequisites** The lecturer is on the page of the selected quiz and a association question exists.

**Step 1** The lecturer clicks on the edit button symbolized by a pen near the question &rarr; edit association question pop-up is shown

**Step 2** The lecturer edits the question and clicks on "Save" &rarr; page of the quiz set is shown again

**Successful Postconditions** The association question has been changed correctly and the changes are shown on the quiz page.

**Failed postcondition** The question has not been changed correctly or the changes are not shown on the quiz page. The lecturer is not notified of the error.

### Lecturer wants to delete a association question

**Test Item** The `lecturer.tsx` file in the `app/course/[courseId]/quiz/[quizId]` folder is to be tested, as well as the `DeleteQuestionButton.tsx` file and `AssociationQuestionPreview.tsx` file in the `component` folder.

**Prerequisites** The lecturer is on the page of the selected quiz and a association question exists.

**Step 1** The lecturer clicks on the delete button symbolized by a trash bin near the question

**Successful Postconditions** The question has been deleted correctly and the changes are shown on the quiz page.

**Failed postcondition** The question has not been deleted correctly and question is still shown on the quiz page. The lecturer is not notified of the error.
