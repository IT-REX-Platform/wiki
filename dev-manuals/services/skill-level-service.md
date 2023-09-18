# Skill level service
In our application, we can find two different scoring systems: The [reward system](./reward-service.md) and the skill level system.
This service handles the skill level system of IT-REX.
The general idea of skill levels is to motivate students to learn repeatedly. Four different skill types are implemented according to the Bloomberg taxonomy:
- Remember
- Understand
- Apply
- Analyze
For more information on how all these skill level scores are calculated and the description of the different skill types we recommend reading our [documentation on the scoring system](../gamification/Scoring%20System.md).
This service offers GraphQL endpoints to query the current skill level scores of a user.
We also use skill types in the [content service](./content-service.md) to make content suggestions to the user based on selected skill types.

## Score calculation and information gathering
Calculations of the skill level of a user are triggered via a user progress event message.
A user progress event is triggered each time a user progresses content. This is forwarded from the [content service](./content-service.md). After receiving such an event the skill level service will request all contents for the chapter of the content, for which user progress was made. This is because skill level scores are calculated on a chapter level.

A more technical description of the reward service and its GraphQL endpoints can be found in our [Github Repository README](https://github.com/IT-REX-Platform/skilllevel_service#readme).