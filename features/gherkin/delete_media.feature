Feature: Delete media

  Scenario: Lecturer wants to delete an existing media with title "MediaX"
    Given lecturer is logged in
    And a media exists with title "MediaX"
    When lecturer clicks the "delete media" button to delete media with title "MediaX"
    Then media with title "MediaX" and corresponding mediacontents are deleted