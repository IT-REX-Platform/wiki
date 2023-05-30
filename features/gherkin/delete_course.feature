Feature: Delete course

  Scenario: Lecturer wants to delete an existing course with title "CourseX"
    Given lecturer is logged in
    And a course exists with title "CourseX"
    When lecturer clicks the "delete couse" button to delete course with title "CourseX"
    Then course with title "CourseX" and corresponding chapters and contents are deleted