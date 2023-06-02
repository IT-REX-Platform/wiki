Feature: Delete mediacontent

  Scenario: Lecturer wants to delete an existing mediacontent with title "MediaContentX"
    Given lecturer is logged in
    And a course exists with title "MediaContentX"
    When lecturer clicks the "delete mediacontent" button to delete mediacontent with title "MediaContentX"
    Then mediacontent is deleted with name "MediaContentX" for media with title "MediaX"

