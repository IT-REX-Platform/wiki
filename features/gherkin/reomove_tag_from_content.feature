Feature: Remove tag from content

  Scenario: Lecturer wants to remove an existing tag with name "TagX" for an existing content with name "ContentX" in an existing chapter with title "ChapterX" for an existing course with title "CourseX"
    Given lecturer is logged in
    And a course exists with title "CourseX"
    And a chapter exists with title "ChapterX" for course with title "CourseX"
    And a content exists with name "ContentX" for chapter with title "ChapterX"
    And a tag exists with name "TagX" for content with name "ContentX"
    When the lecturer clicks the "remove tag" button to remove tag with name "TagX" for content with name "ContentX"
    Then the tag with name "TagX" is removed from content with name "ContentX"
