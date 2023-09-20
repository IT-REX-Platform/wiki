# Reward service
In our application, we can find two different scoring systems: The reward system and the [skill level system](./skill-level-service.md).
This service handles the reward system of IT-REX.
Depending on solved quizzes, watched lectures, repetition of content, flashcard learning, or any other activity of a student on the platform, this service calculates reward scores and saves them in 5 different tables. Current reward scores are: 
- Growth
- Health 
- Fitness 
- Power
- Strength (not implemented)
For more information on how all these scores are calculated we recommend reading our [documentation on the scoring system](../gamification/Scoring%20System.md).
Besides calculating reward scores for users per course, the reward service GraphQL endpoints for requesting current scores for a user. Additionally, this service provides an endpoint to provide information for a course-wide scoreboard in which all members in the course are compared and ranked by their power score.

## Score calculation and information gathering
Result score calculations are triggered by one of two triggers: 
1. Scheduled recalculation (currently 3am CET)
2. User progress event

A user progress event is triggered each time a user progresses content. This is forwarded from the [content service](./content-service.md).
To perform any result score calculations for a user the reward service needs to be provided with user progress information. For this, it will request all chapters from the [course service](./course-service.md) for a course and after receiving the required information, request all content with user progress of the user for all found chapters from the content service. This is because reward scores are calculated for an entire course.


A more technical description of the reward service and its GraphQL endpoints can be found in our [Github Repository README](https://github.com/IT-REX-Platform/reward_service#readme).