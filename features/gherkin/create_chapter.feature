Feature: Create new chapter

  Scenario: Lecturer wants to create a new chapter in an existing course with title "CourseX" with a new chapter title
    Given lecturer is logged in
    And a course exists with title "CourseX"
    And no chapter exists with title "ChapterX" for course with title "CourseX"
    When lecturer clicks the "new chapter" button to create a new chapter with title "ChapterX", number, description "DescriptionChapterX", start and end date
    Then a new chapter with title "ChapterX", number, description, start and end date for course with title "CourseX" exists

  Scenario: Lecturer wants to create a new chapter in an existing course with title "CourseX" but chapter title is already taken
    Given lecturer is logged in
    And a course exists with title "CourseX"
    And a chapter exists with title "ChapterX" for course with title "CourseX"
    When lecturer clicks the "new chapter" button to create a new chapter with title "ChapterX", number, description "DescriptionChapterX", start and end date
    Then an error is reported to the user
    And no new chapter is created
