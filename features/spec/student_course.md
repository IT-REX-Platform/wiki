# Student course tests

Latest Update: 24.09.2023

This file contains the testing plans for the student view and functionalites on courses.

A general prerequisite for all tests is that the user has a stable internet connection to the site.
A general fail condition for all tests is that the view is not updated or data is not shown even after a manual refresh.

## Student enters the application for the first time

**Test Item** The `student.tsx` file in the `app/(dashboard)` folder is to be tested.

**Prerequisites** The student entered the sites URL and sees the login page.

**Step 1** The student enters his credentials and clicks on "Login" &rarr; student is redirected to the dashboard

**Successful Postconditions** The student is redirected to the dashboard and sees the dashboard page, where the student sees the message "*You have not joined any courses yet. Visit the Course Catalog to join courses.*".

**Failed postcondition** The student is not redirected to the dashboard and is shown an error message or the student is not shown the dashboard page or the student is not shown the message.

## Student joins a course

**Test Item** The `page.tsx` file in the `app/courses` folder is to be tested.

**Prerequisites** A positive number of course exists in the database that the student did not join yet.

**Step 1** the students goes to the course catalog page by clicking "Course catalog" in the navbar &rarr; course catalog page is shown

**Step 2** Student see the catalog page and has too options:

- **Option 1** student scrolls through all courses in the catalog and clicks on the "Join course" button of the course he wants to join &rarr; course page opens and student is now part of the course
- **Option 2** student uses the search bar to search for a course and clicks on the "Join course" button of the course he wants to join &rarr; course page opens and student is now part of the course

**Successful Postconditions** Student has a membership of the course now and is shown the course page. The course is shown in the navbar on the left and in the students dashboard, as well as in the course catalog under the category "My courses".

**Failed postcondition** Student is not shown the course page and is shown an error message or the course is not added to the students courses or the student is not shown the course in the navbar or the course is not shown in the course catalog under the category "My courses" or the membership is not properly saved.

## Student interactions on the dashboard

**Test Item** The `CourseCard.tsx` and the `Suggestion.tsx` files in the `component` folder are to be tested.

**Prerequisites** The student is logged in and on the dashboard page, where he can see the courses he has a membership for.

**Step 1** The student sees the course cards and the suggestions for each course

**Step 2** The student clicks on one of the 2 options:

- **Option 1** student clicks on the "Title" button &rarr; student is redirected to the course page
- **Option 2** student clicks on a suggestion &rarr; student is redirected the assignment corresponding to the suggestion
  - **Option 2.1** student completes the suggested assignment &rarr; student is redirected to the course page

**Successful Postconditions** Student is redirected to the course page after fullfilling all conditions (if a suggestion was selected) and can see all visibile course information.

**Failed postcondition** Student is not redirected to the course page or the student is not shown the accessible course information or the student is not shown the suggestions or shown wrongly. Another fail condition is the student is shown an error message, despite having membership.

## Student course page display

**Test Item** The `student.tsx` file in the `app/courses/[courseId]` folder is to be tested.

**Prerequisites** The student is logged in and on the course page.

**Expected display** The student sees the course page with all the information that is visible to him. That includes his personal reward scores, the scoreboard for the course and the chapters that are visible to him.

## Student accessing the scoreboard

**Test Item** The `page.tsx` file in the `app/courses/[courseId]/scoreboard` folder is to be tested.

**Prerequisites** The student is logged in and on the course page.

**Step 1** The student clicks on the scoreboard button in on the course page &rarr; the user is redirected to the scoreboard page

**Step 2** The student sees the scoreboard page and can interact with it &rarr; the student can increase the size of the number of entries shown and navigate through the pages

**Successful Postconditions** The student is shown the scoreboard page and can interact with it. Power score and user names are shown correctly and the student can navigate through the pages and increase the number of entries shown. The time until the scoreboard is shown is within a reasonable timeframe *(< 60s)*. The scoreboard has not to be updated in real time. The navigation back to the course page is working correctly.

**Failed postcondition** The student is not shown the scoreboard page or the student is not shown the correct information or the student is not able to interact with the scoreboard or the student is not able to navigate through the pages or increase the number of entries shown or the time until the scoreboard is shown is too long *(> 60s)*. Another fail condition is that the students user name is not shown on the scoreboard, despite having a membership.

## Student accessing the statistics

**Test Item** The `student.tsx` file in the `app/courses/[courseId]/statistics` folder is to be tested.

**Prerequisites** The student is logged in and on the course page.

**Step 1** The student hovers over any of his reward scores &rarr; the user is shown his recent history for that reward score

**Step 2** The student clicks on the button below the reward score summary &rarr; the user is redirected to the statistics page

**Step 3** The student sees the statistics page and can interact with it &rarr; the student can set filters for the statistics and the graphs and history are updated accordingly

**Successful Postconditions** The student is shown the statistics page and can interact with it. The graphs and history are updated accordingly and the student can set filters for the statistics. The time until the statistics are shown is within a reasonable timeframe *(< 60s)*. The statistics have not to be updated in real time. The navigation back to the course page is working correctly.

**Failed postcondition** The student is not shown the statistics page or the student is not able to interact with the statistics or the student is not able to set filters or the time until the statistics are shown is too long *(> 60s)*. Another fail condition is that the students history is not shown despite having completed assignments and having viewed required media.

## Student accessing the media

**Test Item** The `student.tsx` file in the `app/courses/[courseId]/media/[mediaId]` folder, as well as some component files, are to be tested.

**Prerequisites** The student is logged in and on the course page, where a chapter with accessible media is present.

**Step 1** The student clicks on the media button in the navbar &rarr; the user is redirected to a page with the corresponding media

**Step 2** The student sees the media page and can interact with it &rarr; the student can navigate through the media and see the corresponding metadata

**Step 3** The student marks a media as completed &rarr; the media is marked as completed and the student is shown a notification, also an message is send to the backend

**Step 4** The student clicks the download button &rarr; the media is downloaded and the media is marked as completed (see step 3)

**Successful Postconditions** The student is shown the media page and can interact with it. The media can be marked as completed and the student is shown a notification if marked. The media is downloadable and the media is marked as completed if downloaded. The time until the media is shown is within a reasonable timeframe *(< 60s)*. The navigation back to the course page is working correctly.

**Failed postcondition** The student is not shown the media page or the student is not able to interact with the media or the student is not able to mark the media as completed or the student is not able to download the media or the time until the media is shown is too long *(> 60s)*. Another fail condition is that the students media is not marked as completed, despite having viewed it.

## Student accessing normal flashcards

**Test Item** The `student.tsx` file in the `app/courses/[courseId]/flashcards/[flashcardId]` folder, as well as related component files, are to be tested.

**Prerequisites** The student is logged in and on the course page, where a chapter with accessible flashcards is present.

**Step 1** The student clicks on the flashcards in a stage of section of a chapter &rarr; the user is redirected to a page with the corresponding flashcards

**Step 2** The student sees the flashcards page &rarr; a flashcard card is shown with the question and the answer is hidden

**Step 3** The student clicks on the flashcard card &rarr; the answer is shown

**Step 4** The student gives feedback on the flashcard card concerning the fact, if they answered correctly or not &rarr; the feedback is saved and the flashcard card is marked as completed

**Step 5** The student clicks on the next flashcard card &rarr; the next flashcard card is shown

**Step 6** When all flashcards are done the student finishes the flashcard by clicking "finish" &rarr; the student is redirected to the course page and the progress is sent to the backend

**Successful Postconditions** The student is shown the flashcards page and can interact with it. The flashcards can be answered and the feedback is saved. The flashcards are marked as completed and the progress is sent to the backend at the end. The time until the flashcards are shown is within a reasonable timeframe *(< 60s)*. The navigation back to the course page is working correctly.

**Failed postcondition** The student is not shown the flashcards page or the student is not able to interact with the flashcards or the student is not able to answer the flashcards or the feedback is not saved or the flashcards are not marked as completed or the progress is not sent to the backend at the end or the time until the flashcards are shown is too long *(> 60s)*. Another fail condition is that the students flashcards are not marked as completed, despite having answered them.

## Student accessing populated quizzes

**Test Item** The `student.tsx` file in the `app/courses/[courseId]/quizzes/[quizId]` folder, as well as related component files, are to be tested.

**Prerequisites** The student is logged in and on the course page, where a chapter with accessible quizzes is present.

**Step 1** The student clicks on the quizzes in a stage of a section of a chapter &rarr; the user is redirected to a page with the corresponding quizzes

**Step 2** The student sees the quizzes page &rarr; a question is shown, depending on the type of quiz the student has different ways to answer the question

- **Option 1** In a multiple choice question, the student clicks on the correct answers &rarr; the answer is marked as worked on and the student is shown the feedback
- **Option 2** In a cloze question, the student either types the correct answer or drag'n'drops it &rarr; the answer is marked as worked on and the student is shown the feedback
- **Option 3** In a association question, the student clicks the correct answers pairs &rarr; the answer is marked as worked on and the student is shown the feedback

**Step 3 (optional)** The student clicks on the hint button &rarr; the hint is shown, if available

**Step 4** The student clicks on the next question &rarr; the next question is shown

**Step 5** When all questions are done the student finishes the quiz by clicking "finish" &rarr; the student is redirected to the course page and the progress is sent to the backend

**Successful Postconditions** The student is shown the quizzes page and can interact with it. The quizzes can be answered and the feedback is shown. The quizzes are marked as completed and the progress is sent to the backend at the end. The time until the quizzes are shown is within a reasonable timeframe *(< 60s)*. The navigation back to the course page is working correctly.

**Failed postcondition** The student is not shown the quizzes page or the student is not able to interact with the quizzes or the student is not able to answer the quizzes or the feedback is not shown or the quizzes are not marked as completed or the progress is not sent to the backend at the end or the time until the quizzes are shown is too long *(> 60s)*. Another fail condition is that the students quizzes are not marked as completed, despite having answered them.

## Student accessing empty assessments (quizzes and flashcards)

**Test Item** The `student.tsx` file in the `app/courses/[courseId]/quizzes/[quizId]` and `app/courses/[courseId]/flashcards/[flashcardId]` folders, as well as related component files, are to be tested.

**Prerequisites** The student is logged in and on the course page, where a chapter with accessible empty quizzes or flashcards is present.

**Step 1** The student clicks on the quizzes or flashcards in a stage of a section of a chapter &rarr; the user is redirected to a page with the corresponding quizzes or flashcards

**Step 2** The student sees the quizzes or flashcards page &rarr; a message is shown, that there are no quizzes or flashcards available

**Successful Postconditions** The student is shown ehe message for empty quizzes or flashcards. The time until the quizzes or flashcards are shown is within a reasonable timeframe *(< 10s)*. The navigation back to the course page is possible and working correctly.

**Failed postcondition** The student is not shown the message for empty quizzes or flashcards, but an error, or the time until the quizzes or flashcards are shown is too long *(> 10s)*.

## Student accessing an incorrect URL (e.g. course, media, quiz, flashcard)

**Test Item** The `student.tsx` file for the corresponding case, as well as related component files, are to be tested.

**Prerequisites** The student is logged in and typing the wrong ID for a course, media or assessment. This simulates a URL for non existing courses, media or assessments.

**Step 1** The student enters the URL &rarr; the user is redirected a page informing him that the course, media or assessment does not exist

**Successful Postconditions** The student is shown the message for non existing courses, media or assessments. The time until the message is shown is within a reasonable timeframe *(< 10s)*. The navigation back to the course page is possible and working correctly.

**Failed postcondition** The student is not shown the message for non existing courses, media or assessments, but an error, or the time until the message is shown is too long *(> 10s)*.
