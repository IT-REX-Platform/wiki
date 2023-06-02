Feature: Upload mediacontent

  Scenario: Lecturer/teaching assistance wants to upload a new mediacontent with a new name in an existing media with title "MediaX"
    Given lecturer/teaching assistance is logged in
    And a media exists with title "MediaX"
    And no mediacontent exists with the name "MediaContentX" for media with title "MediaX"
    When lecturer/teaching assistance clicks the "new mediacontent" button to upload a new mediacontent with name "MediaContentX"
    Then a new mediacontent with name "MediaContentX"

  Scenario: Lecturer wants to upload a new mediacontent in an existing media with title "MediaX" but mediacontent name is already taken
    Given lecturer is logged in
    And a media exists with title "MediaX"
    And a mediacontent exists with name "MediaContentX" for media with title "MediaX"
    When lecturer clicks the "new content" button to upload a new mediacontent with name "MediaContentX"
    Then an error is reported to the user
    And no new content exists