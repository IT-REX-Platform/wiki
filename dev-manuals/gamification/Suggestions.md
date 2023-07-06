# Suggestions
## What are suggestions for?
The suggestion system is a way for the student to now what should be worked on next. It gives the student the hint which course or which item should be exerciesed next. But it is only a hint or a nudge for the students. It does not determine what he can or can not do.
For example, if a student has 2 courses where he should repeat the flashcard, the suggestion system should nudge the student to do the flashcards that he neglected the longest.

## How do they work?
We differentiate between the suggestions inside a course and the suggestions between courses.

### In-course suggestions
The first one can be simple. The item that was neglected the longest or does replenish the most amount of health/fitness will be suggested. 
This means we have 2 options:
1. The content items that is longest overdue, will be suggested
2. The content that replenishes the most amount of health or fitness will be suggested

The problem is: what happens if 2 or more items have the same time they are overdue or the some replenishing effect?
For this we can also include the reward score of the contents in question.

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
### In-course suggestions
To implement the in-course suggestion system we can simply compare 1 of the 2 options to determine what is suggested first. To resolve the conflict, between items that have the same *overdue* score or *replenishing* score, we can use the formula related to the chosen option.

Formula: $rewardScore * daysOverdue$

or

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
