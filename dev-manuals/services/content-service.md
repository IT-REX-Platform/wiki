# Content service

## Data structures
The core responsibility of the content service is handling all operations related to content.
Next to creating, modifying, and deleting content, this service also provides ways of structuring content and tracking the progress of users on content. The content entities stored in this service represent an abstraction of actual content. This means no actual data such as media files can be found in this service. Rather content entities in this service reference the actual content located in other services.
Content can be structured by adding them into stages, which can be ordered in sections. A [chapter](./course-service.md) can contain one or multiple sections. For further information on how and for what these sections and stages are used, we recommend reading our concept on [non-linear curriculum](../gamification/nonlinear-curriculum.md).

## Content types
Currently, our system supports two different types of content: 
1. **Media Content**
2. **Assessments**

**Media content** is provided by the [media service](./media-service.md). Media records in the media service are linked to one or more media contents in the content service. This is to allow for media to be reused in different chapters or courses.
**Assessments** can be further specified into **quizzes** that are located on the [quiz service](./quiz-service.md) and **flashcard sets**, located on the [flashcard service](./flashcard-service.md).

Other than the type of content and a user's progress on this content, the content service does not contain any more information on the exact content of content entities. The exact content is stored in the corresponding services. These services link their content to the content entities in the content service. 

## Tracking of user progress on content
For each user, progress on individual content can be tracked. Progress can be queried from this service, with options for aggregating progress. Currently, this service offers endpoints to provide progress information on single content entities, aggregated progress on stages and aggregated progress for a whole chapter.
The logging of new progress in content is done in the underlying services [media service](./media-service.md), [quiz service](./quiz-service.md), and [flashcard service](./flashcard-service.md). These notify the content service of any changes and new user progress via event messages. The content service collects this information and in case of meaningful progress, notifies the [reward service](./reward-service.md) and the [skill-level service](./skill-level-service.md) via a different event message.

## Content Suggestions
Next to offering information on a user's progress for content, the content service also provides an option of suggesting content for an individual user. We recommend reading our [suggestion concept](../gamification/Suggestions.md) for more information on content suggestions. Our current implementation of suggestions is done in the following way:
Suggestions can be restricted by filter parameters:
- ***chapters***
- ***skill types***
- ***number of suggestions***

The content service will then retrieve all available content based on all reachable stages, containing content.  A stage is reachable in a section if all previous stages have been completed. All content will then be filtered by if the content has not been learned yet or is ready for repetition (more details on repetitions can be found [here](../gamification/spaced-repetition.md)). 
The remaining content will be divided into content that is labeled as *required* by stages and content labeled as *optional*.
From the content set that is labeled as *required* our implementation selects the first ***x*** (defined by the filter above) contents. If there are fewer contents in this list than requested, the remaining spots are filled up by content from the *optional* set. Both sets are sorted in the following order:
1. new or not yet learned content
2. hasn't been done in a long time
4. reward points for completing content
3. has been learned before
