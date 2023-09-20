# Flashcard service
Flashcard sets are one type of assessment content users can consume while being part of a course.
Each set and its contained flashcards are stored on this service. Furthermore, they can also be created, modified, and deleted on this service.
Flashcards are implemented in such a flexible manner allowing for many customization options for flashcards while still using the same structure in the service.
Unlike their physical counterparts, flashcards provided by this service are less limited by physical constraints. Flashcards in this service can have more than two sides and can contain not only plain text or images but also other media content such as videos. The media content is not provided by this service directly. Instead, it needs to be requested from the [media service](./media-service.md) separately.
Users can further customize their flashcards by adding some additional metadata to the sides of a flashcard. Flashcardsides can be labeled as 'questions' and/or 'answers'.
This allows for flashcards to be created with designated 'question' and 'answer' fields but also allows for approaches where all flashcard sides can be used as both 'questions' and 'answers'.

A more technical description of the flashcard service and its GraphQL endpoints can be found in our [Github Repository README](https://github.com/IT-REX-Platform/flashcard_service#readme).

## Tracking a user's progress
This service also provides a way to track and update a user's progress for each flashcard in a flashcard set. Our GraphQL endpoint is based on the assumption of a user self-assessing the correctness which is why the endpoint only expects to receive the identifier of the flashcard and a boolean value for the correctness of the answer.
This service saves this data to a progress log for this user concerning each flashcard. After all flashcards within a flashcard set have been learned, the content service is informed by the flashcard service about this user's progress for the set. Content within the content service is mapped to a flashcard set. For more information on this, we recommend checking out our [documentation on the content service](./content-service.md).
For more information on user progress tracking in our application we recommend reading our [documentation on user progress](../gamification/userProgress.md).