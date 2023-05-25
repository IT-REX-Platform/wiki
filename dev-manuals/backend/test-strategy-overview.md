# Test strategy overview

Testing in general consists of 2 elements:
- Verification: Are we building the product right?
- Validation: Are we building the right product?
This test strategy is all about verification, meaning dynamic verification - known as "tests" - and static code analysis.

## General

### Review

- As a first important rule: the main branch is always protected and clean, i.e. all tests are passing.
- Changes to the main branch have to be approved by at least one other person.
- Reviewer checks for errors in the source code and in addition, whether the amount of automated tests is sufficient.
- Pull requests contain a checklist serving as a set of rules for the review.
- Findings are reported in the comments of a pull request.
    - Best practice: Use of different labels to clarify, what this comment is about.
        - #Major : Defect, that has to be corrected before approval to merge.
        - #Minor : Issue, that can be fixed later, but a follow-up issue should be created.
        - #Improve : Suggestion for improvement, that might be changed, but not necessarily in order to merge.
        - #Nitpick : Tittle, e.g. code formatting, that is unimportant for the functionality, but might be important, e.g. for maintenance.

## Backend

Description of how the different microservices will be tested, can be found [here](../backend/testing.md).

## Frontend

Description of how the frontend will be tested, can be found [here](../frontend/testing.md)
