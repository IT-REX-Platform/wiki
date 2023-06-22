Feature: Upload a new media

  Scenario: Lecturer/teaching assistant wants to upload a new media with a new title
    Given lecturer/teaching assistantis logged in
    And no media exists with name "MediaX"
    When lecturer clicks the "upload" button to store a new media with name "MediaX", type "MediaTypeX"
    Then a new media with name "MediaX", type "MediaTypeX" exists

  Scenario: Lecturer/teaching assistant wants to upload a new media but name is already taken
    Given lecturer/teaching assistant is logged in
    And media exists with name "MediaX"
    When lecturer clicks the "upload" button to store a new media with name "MediaX",type "MediaTypeX"
    Then an error is reported to the user
    And a single media with title "MediaX" exists

  Scenario: Lecturer/teaching assistant wants to upload a new media but type is not matched
    Given Lecturer/teaching assistant is logged in
    And no media exists with name "MediaX"
    When lecturer clicks the "upload" button to store a new media with name "MediaX",type "MediaTypeX"
    When new media type is not matched to the MediaType
    Then an error is reported to the user
    And a appropriate type "MediaTypeX" allowed
