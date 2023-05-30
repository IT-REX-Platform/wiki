Feature: Upload content
  
  Scenario: Lecturer wants to upload a new content with a new name in an existing chapter with title "ChapterX" for course with title "CourseX"
    Given lecturer is logged in
    And a course exists with title "CourseX"
    And a chapter exists with title "ChapterX" for course with title "CourseX"
    And no content exists with the name "ContentX" for chapter with title "ChapterX"
    When lecturer clicks the "new content" button to upload a new content with name "ContentX" and reward points
    Then a new content with name "ContentX" and reward points exists for chapter with title "ChapterX"

  Scenario: Lecturer wants to upload a new content in an existing chapter with title "ChapterX" for course with title "CourseX" but content name is already taken
    Given lecturer is logged in
    And a course exists with title "CourseX"
    And a chapter exists with title "ChapterX" for course with title "CourseX"
    And a content exists with name "ContentX" for chapter with title "ChapterX"
    When lecturer clicks the "new content" button to upload a new content with name "ContentX" and reward points
    Then an error is reported to the user
    And no new content exists
