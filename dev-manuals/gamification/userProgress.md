# User progress data

## Overview

The system needs to know which contents and chapters a user has already completed so that it can be displayed in the
frontend. This document describes how this data is stored and updated.

## Purpose of progress data

Storing the progress data serves the following purposes:

1. Display in frontend which contents and chapters a user has already completed, which are still open and which contents
   are next.
2. Reward score calculation: The IT-Rex has different categories of reward scores, where one is about learning new
   content and one is about repeating content. The progress data is required to determine the category of a reward
   score and possibly to calculate the score. If, for example, a content was never learned before, it is considered new
   content for the user and the user gets a reward score for learning new content. If content has been learned before, the
   user gets a reward score for repeating content.
3. Skill score calculation. Depending on when content has been last repeated, the user's skill is calculated differently.
   If a user repeats content after a long time, the user receives a higher skill score than if the user repeats content after a short time. Therefore, the system needs to know when a piece of content has been learned last.
4. Recommendation of contents to learn. Depending on which contents were learned a long time ago, the system can
   recommend contents to repeat. To determine when a piece of content should be learned again, the system should not only store the last time a content was learned but also a learning interval, which is increased every time a content is successfully progressed and decreased every time a content is unsuccessfully progressed.

## Location of progress data

In the previous section, we discussed that the progress data is required for different purposes, each located in a
different microservice. Therefore, it makes sense to store the progress data in the [content service](../services/content-service.md), which serves as a central service for all content-related data.

Each time, the user progresses through content, the content service is informed about the progress. The content service
then stores the progress data in its database.

## Structure of progress data

For each user, the progress data is a log in which each entry contains the following information:

- User ID
- Content ID
- Date, when the content was learned
- Whether the content was learned successfully or not
- Whether a hint was used or not
- The learning interval of the content
- Correctness score between 0 and 1, i.e., how many questions were answered correctly in a quiz
- Time to complete the content in milliseconds

## Content-specific progress data

Some content types may require additional information about the user's progress. For example, a quiz may have a field for
the current question, so that the user can pause the quiz and resume later. Each single flashcard stores the time it was
last learned, to determine when it should be learned again within a flashcard set.

## Implementation details

To log progress data, the specific services provide a mutation to log that the user learned content, for example, the
flashcard service. The specific service then calculates the progress data as defined above and then publishes an event.
The content service listens to this event and stores the progress data in its database. Other services might also listen
to this event, for example, the reward service. The topic of the content service mutation is `content-progressed` of the
dapr-pubsub component `gits`. The event data is structured like this:

```json
{
   "userId": "<uuid of the user>",
   "contentId": "<uuid of the content>",
   "date": "<date when the content was learned>",
   "success": "<boolean whether the content was learned successfully>",
   "correctnessScore": "<float correctness score between 0 and 1>",
   "hintUsed": "<boolean whether a hint was used>",
   "learningInterval": "<learning interval of the content in milliseconds>",
   "timeToComplete": "<time to complete the content in milliseconds>"
}
```
