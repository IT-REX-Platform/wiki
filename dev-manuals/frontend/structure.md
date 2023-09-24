# Project Structure

## Overview

The structure of the frontend repository is mainly divided into 2 parts: the `app` folder and the `components` folder.

The `app` folder contains the pages and the routing of the application. The `components` folder contains all components that are used in the application.

### App

The `app` folder contains the following things:

- `courses` folder
- `(dashboard)` folder
- `layout.tsx` file
- `loading.tsx` file

Let's take a look at the files first.
The `layout.tsx` file is the root layout of the application. It was created by setting up the project with Next.js. For more information on how to use the layout, please refer to the [Next.js layout documentation](https://nextjs.org/docs/app/building-your-application/routing/pages-and-layouts).
The `loading.tsx` file is a component that is used to show a loading screen while the application is loading. It is used in the `layout.tsx` file. It is the standard loading screen of Next.js. For more information on how to use the loading screen, please refer to the [Next.js loading documentation](https://nextjs.org/docs/app/building-your-application/routing/loading-ui-and-streaming). All further `loading.tsx` files in the other folders are the same as this one.

The `(dashboard)` folder contains the dashboard page for students and lecturers. It is the first page that is shown to the user after logging in. It contains the following files:

- `loading.tsx` file
- `student.tsx` file: The student view of the dashboard.
- `lecturer.tsx` file: The lecturer view of the dashboard. Here the lecturer can also create a new course, by pressing the "+ New course"-button.
- `page.tsx` file: Depending on the view that is selected, the corresponding page is shown. The page is either the `student.tsx` file or the `lecturer.tsx` file.

From the dashboard the user can navigate to the `courses` folder. The `courses` folder contains the following files and folders:

- `page.tsx` file: this file shows the course list to the user. In the application it is called "Course Catalog".
- `create` folder: This folder contains 2 files. The `page.tsx` file handles the view when creating a new course. Students are shown a 403 error page, because they are not allowed to create courses. The `lecturer.tsx` file handles the view when creating a new course. It contains a form to create a new course.
- `[courseId]` folder: This folder contains all files for a course. Be it for quizzes, flashcard, media, scoreboard or statics. Naturally the course view page is also present here in form of the `page.tsx`, `loading.tsx`, `lecturer.tsx` and `student.tsx` files.

In the [courseId] folder the quizzes, flashcards and media folders are present and all contain the same file structure. All of those 3 folders have a corresponding folder with square brackets (e.g. [quizId]) that contains the files for the corresponding quiz, flashcard or media. The files in those folders are: a `page.tsx`, `loading.tsx`, `lecturer.tsx` and `student.tsx` file. The `page.tsx` file is the main file for the corresponding page. The `loading.tsx` file is the loading screen for the corresponding page. The `lecturer.tsx` file is the lecturer view of the corresponding page. The `student.tsx` file is the student view of the corresponding page.
The `scoreboard` and `statistics` folder are only for students and contain a `loading,tsx` and file for the student view.

The general structure of the `app` folder is as follows:

```bash
app
├── courses
│   ├── create
│   │   ├── page.tsx
│   │   └── lecturer.tsx
│   ├── [courseId]
│   │   ├── flashcards
│   │   │   └── [flashcardId]
│   │   │       ├── page.tsx
│   │   │       ├── loading.tsx
│   │   │       ├── lecturer.tsx
│   │   │       └── student.tsx
│   │   ├── media
│   │   │   └── [mediaId]
│   │   │       ├── page.tsx
│   │   │       ├── loading.tsx
│   │   │       ├── lecturer.tsx
│   │   │       └── student.tsx
│   │   ├── quizzes
│   │   │   └── [quizId]
│   │   │       ├── page.tsx
│   │   │       ├── loading.tsx
│   │   │       ├── lecturer.tsx
│   │   │       └── student.tsx
│   │   ├── scoreboard
│   │   │   ├── loading.tsx
│   │   │   └── page.tsx
│   │   ├── statistics
│   │   │   ├── loading.tsx
│   │   │   ├── page.tsx
│   │   │   └── student.tsx
│   │   ├── loading.tsx
│   │   ├── lecturer.tsx
│   │   ├── page.tsx
│   │   └── student.tsx
│   ├── loading.tsx
│   └── page.tsx
├── (dashboard)
│   ├── loading.tsx
│   ├── lecturer.tsx
│   ├── page.tsx
│   └── student.tsx
├── layout.tsx
└── loading.tsx
```

### Components

The `components` folder contains all sorts of components that are used in the application. If you refactor code and extract components or you create new components that should not clutter the app files, please put them in this folder. The folder structure is as follows:

```bash
components
├── dialogs
│   ├── chapter-dialog.ts
│   └── sectionDialog.ts
├── quiz
│   ├── AddAssociationQuestionModal.tsx
│   ├── AddClozeQuestionModal.tsx
│   ├── AddQuestionButton.tsx
│   ├── AssociationQuestion.tsx
│   ├── AssociationQuestionModal.tsx
│   ├── AssociationQuestionPreview.tsx
│   ├── ClozeQuestion.tsx
│   ├── ClozeQuestionModal.tsx
│   ├── ClozeQuestionPreview.tsx
│   ├── DeleteQuestionButton.tsx
│   ├── DeleteQuizButton.tsx
│   ├── EditAssociationQuestionButton.tsx
│   ├── EditClozeQuestionButton.tsx
│   ├── EditRichTextButton.tsx
│   ├── FeedbackTooltip.tsx
│   ├── HintFormSection.tsx
│   ├── MultipleChoiceQuestion.tsx
│   ├── MultipleChoiceQuestionPreview.tsx
│   └── QuestionDivider.tsx
├── Accordion.tsx
├── AddChapterModal.tsx
├── AddContentModal.tsx
├── AddFlashcardSetModal.tsx
├── AddSectionButton.tsx
├── AddStageButton.tsx
├── AssessmentMetadataFormSection.tsx
├── AutosizeByText.tsx
├── ChapterContent.tsx
├── ChapterHeader.tsx
├── Content.tsx
├── ContentMetadataFormSection.tsx
├── ContentTags.tsx
├── CourseCard.tsx
├── DeleteStageButton.tsx
├── DialogBase.tsx
├── EditChapterButton.tsx
├── EditCourseModal.tsx
├── EditFlashcardSetButton.tsx
├── EditSectionButton.tsx
├── Form.tsx
├── FormErrors.tsx
├── Heading.tsx
├── MediaContentModal.tsx
├── MediaRecordIcon.tsx
├── MediaRecordSelector.tsx
├── MediaRecordTypeSelector.tsx
├── MultipleChoiceQuestionModal.tsx
├── MultistepForm.tsx
├── Navbar.tsx
├── PageLayout.tsx
├── PageLoading.tsx
├── PdfViewer.tsx
├── QuizModal.tsx
├── RewardScoreChart.tsx
├── RewardScoreFilter.tsx
├── RewardScoreHistoryTable.tsx
├── RewardScores.tsx
├── RichTextEditor.tsx
├── Searchbar.tsx
├── Section.tsx
├── SkillLevels.tsx
├── Stage.tsx
├── Subheading.tsx
└── Suggestion.tsx
```
