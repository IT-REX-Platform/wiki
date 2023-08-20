# Suggestions
## What are suggestions for?
The suggestion system is a way for the student to now what should be worked on next. It gives the student the hint which course or which item should be exerciesed next. But it is only a hint or a nudge for the students. It does not determine what he can or can not do.
For example, if a student has 2 courses where he should repeat the flashcard, the suggestion system should nudge the student to do the flashcards that he neglected the longest.

## How do they work?
We differentiate between the suggestions inside a course and the suggestions between courses.

### In-course suggestions

A content can be a suggested content, if
- the chapter is unlocked for the user
- the content is unlocked for the user, i.e, he completed the required predecessors of the learning path aka section

We will suggest the contents that or overdue the longest, either for repetition or for learning the first time. In case of multiple contents being overdue for the same amount of days,
- new contents will be favored over contents to repeat
- contents rewarding more reward points will be favored 

It will also be possible to filter for suggestions that match a certain skill type, resulting in the following query:

```graphql
extent type Course {
  suggestedContents(limit: Int!, skillTypes: [SkillType!]! = [REMEMBER, UNDERSTAND, APPLY, ANALYSE]): [Suggestion!]!
}

type Suggestion {
  content: Content!
  type: SuggestionType!
}

enum SuggestionType {
  NEW_CONTENT
  REPETITION
}
```
In the future, suggestion might also be dedependent on the recent content that was done, in order to suggest *related* content.

#### Implementation note
As chapters are handled in the course service, the Gateway has to resolve all currently active chapter ids of a course first and the content service has to 
accept chapter ids as a parameter.

### Homepage suggestions
The second system is a little more complicated. We have to figure out which course needs the attention the most. 
Some factors that impact the suggestion score might be:
- the health score of the course
- the fitness score of the course
- the reward points that can be gained by completing a suggested item
- the skill points achived by completing the task

If the score should be the same for 2 or more items, a destinction by preference might be implemented.
For example, if a student has the same work to do for 2 courses and the scores between both scores for the courses are the same, than the course that has been marked as *favored* is suggested first.

## Possibile implementation

$rewardScore * replenishingEffect$
### Homepage suggestions
One way to implement the suggestions between courses, would be to rank the 4 factors mentioned above in a desired order and compare the values for each item in question. An example with the ranking ***health > fitness > reward points > skill points*** would be, the media with the biggest *media time* score would be suggested to the user. 
But this system would be to simplistic. Why should we rank *health* higher than *fitness* or *reward points* higher than *skill points*? This is too arbitrary and if each lecturer can configure the order themselves and the amount of reward or skill points, it would defeat the purpose of suggestions because they could rig the system to their favor.
This means it would be ideal to have a score that could be computed using the 4 (or possibly more) factors to make it more comparable.

A possible formula would be: 
$$Outcome = (0.3 * (100 - health)) + (0.3 * (100 - fitness)) + (0.2 * (reward points_{max}/ \sum reward points) * 100) + (0.2 * (skill points_{max}/ \sum skill points)*100)$$

Skill points are being calculated considering the maximum amount that can be earned.
For example if you have 2 courses:
- course A: health = 60, fitness = 70, reward points = [100, 1000], skill points = [25, 17]
- course B: health = 65, fitness = 85, reward points = [10000, 5000], skill points = [15]
Then we have a suggestion score of 51,086 for course A and 48,33 for course B, so the system would suggest the user sould work on course A first.
This implementation proposal, would give health and fitness the same weight and both have a higher weight than reward or skill points.
It should be noted, that the weights may be adjusted.

## Possible extensions for the future
Another level of suggestions, that might be interesting, are related to the "contentDependencies". This means that each content has "related" content, that might be suggested after you fail a content.
