Feature: Create a new course

  Scenario: Lecturer wants to create a new course with a new title
    Given lecturer is logged in
    And no course exists with title "CourseX"
    When lecturer clicks the "create" button to create a new course with title "CourseX", description "DescriptionCourseX", start date, end date and publish state
    Then a new course with title "CourseX", description "DescriptionCourseX", start date, end date and publish state exists

  Scenario: Lecturer wants to create a new course but title is already taken
    Given lecturer is logged in
    And course exists with title "CourseX"
    When lecturer clicks the "create" button to create a new course with title "CourseX", description "DescriptionCourseX", start date, end date and publish state
    Then an error is reported to the user
    And a single course with title "CourseX" exists