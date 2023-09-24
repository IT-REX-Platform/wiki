# Lecturer Course tests

Latest Update: 24.09.2023

These manual test are for the lecturer view. They include cases for creating, updating and deleting courses, chapters and sections and stages.

A general prerequisite for all tests is that the user has a stable internet connection to the site.
A general fail condition for all tests is that the view is not updated or data is not shown even after manual refresh.

## Courses

### Lecturer wants to create a new course

**Test Item** The `create.tsx` file in the `app/courses` folder is to be tested.

**Prerequisites** Lecturer is logged in and on the dashboard page

**Step 1** The lecturer clicks the "+ Add course" button &rarr; "create new course page" is shown

**Step 2** The lecturer enters the required course information and at the end clicks on "Create course" &rarr; the page of the newly created course is shown

**Successful postconditions** The course skeleton is created with the provided data and settings (etc. descrtption or chapters) and ready to be editted by the lecturer, students can see and join it if they course was published.

**Failed postcondition** The course is not created and the lecturer is shown an error message or the course is created but not shown to the lecturer or the course is created wrongly (e.g. wrong name or description).

### Lecturer wants to edit the course information

**Test Item** The `lecturer.tsx` file in the `app/courses/[couresId]` folder is to be tested, as well as `EditCourseModal.tsx` in the `component` folder.

**Prerequisites** The lecturer is on the page of a course that he has the permission to edit

**Step 1** The lecturer clicks the settings button in top right corner &rarr; editing pop-up shows up

**Step 2** The lecturer changes the course information and at the end clicks on "Update" &rarr; pop-up goes away

**Successful postconditions** The course information is saved successfully and the page is shown with updated values within a reasonable timeframe *(< 60s)*.

**Failed postcondition** The course information is not saved and the lecturer is shown an error message or the course information is saved wrongly (e.g. wrong name or description) or the update of the data is taking too long *(> 60s)*.

### Lecturer wants to delete a course

**Test Item** The `lecturer.tsx` file in the `app/courses/[couresId]` folder is to be tested, as well as `EditCourseModal.tsx` in the `component` folder.

**Prerequisites** The lecturer is on the page of a course that he has the permission to edit.

**Step 1** The lecturer clicks the settings button in top right corner &rarr; editing pop-up shows up

**Step 2** The lecturer clicks on the red "Delete" button &rarr; pop-up goes away and redirects to the dashboard

**Successful postconditions** The course is deleted successfully in the UI and the database and the lecturer is redirected to the dashboard within a reasonable timeframe *(< 60s)*.

**Failed postcondition** The course is not deleted correctly (from database or UI) and the lecturer is shown an error message or the course is deleted but the lecturer is not redirected to the dashboard or the deletion of the course is taking too long *(> 60s)*.

## Chapters

### Lecturer wants to add a new chapter to a course

**Test Item** The `lecturer.tsx` file in the `app/courses/[couresId]` folder is to be tested, as well as `AddChapterModal.tsx` in the `component` folder.

**Prerequisites** The lecturer is on the page of a course that he has the permission to edit

**Step 1** The lecturer clicks the add chapter button in top right corner &rarr; creation pop-up shows up

**Step 2** The lecturer enters the course information and at the end clicks on "create course" &rarr; pop-up goes away

**Successful postconditions** The new chapter is created and added to the course correctly and shown within a reasonable timeframe *(< 60s)*.

**Failed postcondition** The chapter is not created and the lecturer is shown an error message or the chapter is created wrong (e.g. wrong name or description) or the update of the data is taking too long *(> 60s)*.

### Lecturer wants to edit an existing chapter

**Test Item** The `lecturer.tsx` file in the `app/courses/[couresId]` folder is to be tested, as well as `EditChapterButton.tsx` and the `DialogBase.tsx` in the `component` folder.

**Prerequisites** The lecturer is on the page of a course that he has the permission to edit

**Step 1** The lecturer clicks on the edit button right next to the chapter title &rarr; editing pop-up shows up

**Step 2** The lecturer changes the chapter information and at the end clicks on "update" &rarr; pop-up goes away

**Successfull postconditions** The chapter information is saved and the page is correctly shown with the updated values within a acceptable timeframe *(< 60s)*.

**Failed postcondition** The chapter information is not saved and the lecturer is shown an error message or the chapter information is saved wrongly or the update of the data is taking too long *(> 60s)*.

### Lecturer wants to delete a chapter

**Test Item** The `lecturer.tsx` file in the `app/courses/[couresId]` folder is to be tested, as well as `EditChapterButton.tsx` and the `DialogBase.tsx` in the `component` folder.

## Sections

### Lecturer wants to add sections

**Test Item** The `lecturer.tsx` file in the `app/courses/[couresId]` folder is to be tested, as well as `AddSectionButton.tsx` and the `DialogBase.tsx` in the `component` folder.

**Prerequisites** A chapter with all required metadata exists.

**Step 1** The lecturer clicks the add section button within the chapter &rarr; creation pop-up shows up

**Step 2** The lecturer enters the section name and clicks on "save" &rarr; pop-up goes away

**Successfull Postconditions** The new section is created and shown correctly in the correct chapter. The section is shown within a reasonable timeframe *(< 60s)*.

**Failed postcondition** The section is not created and the lecturer is shown an error message or the section is created wrongly (e.g. wrong name) or the update of the data is taking too long *(> 60s)* or the section is created in the wrong chapter.

### Lecturer wants to edit a section

**Test Item** The `lecturer.tsx` file in the `app/courses/[couresId]` folder is to be tested, as well as `EditSectionButton.tsx` and the `DialogBase.tsx` in the `component` folder.

**Prerequisites** A chapter with a section exists.

**Step 1** The lecturer clicks on the edit button right next to the section title &rarr; editing pop-up shows up

**Step 2** The lecturer changes the section name and at the end clicks on "Save" &rarr; pop-up goes away

**Successfull postconditions** The section information is saved and the page is correctly showing the updated values within a acceptable timeframe *(< 60s)*.

**Failed postcondition** The section information is not saved (notified or not) or the section information is saved wrongly or the update of the data is taking too long *(> 60s)*.

### Lecturer wants to delete a section

**Test Item** The `lecturer.tsx` file in the `app/courses/[couresId]` folder is to be tested, as well as `EditSectionButton.tsx` and the `DialogBase.tsx` in the `component` folder.

**Prerequisites** A chapter with a section exists.

**Step 1** The lecturer clicks on the red "Delete Section"-button right next to the section title &rarr; The section is deleted

**Successfull postconditions** The section is deleted and the page is correctly showing the updated state of the page within a acceptable timeframe *(< 60s)*.

**Failed postcondition** The section is not deleted or the update of the data is not shown after a certain time *(> 60s)*.

## Stages

### Lecturer wants to add a stage to a section

**Test Item** The `lecturer.tsx` file in the `app/courses/[couresId]` folder is to be tested, as well as `AddStageButton.tsx` and the `DialogBase.tsx` in the `component` folder.

**Prerequisites** A chapter with a section exists.

**Step 1** The lecturer clicks the add stage button within the section &rarr; stage is added

**Successfull postconditions** The new stage is created and shown correctly in the correct section. The stage is shown within a reasonable timeframe *(< 60s)*.

**Failed postcondition** The stage is not created and the lecturer is shown an error message or the stage is created in the wrong section or the update of the data is taking too long *(> 60s)*.

### Lecturer wants to delete a stage

**Test Item** The `lecturer.tsx` file in the `app/courses/[couresId]` folder is to be tested, as well as `EditStageButton.tsx` and the `DialogBase.tsx` in the `component` folder.

**Prerequisites** A chapter with a section and a stage exists.

**Step 1** The lecturer clicks on the red "Delete stage" button right below the "Add content" button &rarr; the stage is removed from the section

**Successfull postconditions** The stage is deleted and the page is correctly showing the updated state of the page within a acceptable timeframe *(< 60s)*.

**Failed postcondition** The stage is not deleted or the update of the data is not shown after a certain time *(> 60s)*.

***There is no "Edit stage", that would be adding or removing content from a stage. This is described in the content section for lecturers.***
