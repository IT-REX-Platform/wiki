# Scoring System - Rewards & Skill levels

## Two System Approach

GITS has two scoring systems: The skill level system and the reward system. The skill level system is used to determine
how well a user knows a content.
The reward system is used to motivate the user to learn new content and repeat old content.

## The reward system

There are five different types of reward scores:

- Health
- Fitness
- Growth
- Strength
- Power

The reward scores are used to reward the user for completing certain tasks and are visualized with the IT Rex in the
front end.
Health and fitness provide more of a short-term motivation, while growth, strength and power are more long-term rewards.

This section describes how the reward scores are increased and decreased depending on the user's progress.

### Health

> Health shows the current learning progress of a student. If the IT-REX is doing poorly, this is the indicator that the
> student is lagging behind

<small><i>cited from the GITS paper</i></small>

The health score represents how well the user is up-to-date with the content.
It is decreased if the user is behind with the content and increased if the user learn new content that is due.


<details>
<summary><b>Detailed calculation</b></summary>

In detail, the health score is calculated in the following way:

- The health score is a number between 0 and 100.
- If the user has progressed through all content that is due at the current date, the health score is always 100%.
- This is also the case if no content is due at the current date.
- Otherwise, the health score decreases every day until the user is up-to-date again.
- For each content on the critical path, the score is decreased be the number of days the user is behind.
  - The number of days behind is the difference between the current date and the suggested start date of the content in
    days plus one.
- The sum of all decreases multiplied by some factor, which we set to 0.5
- The maximum decrease per day is capped at 10%.

This results in the following formula:

> healthDecrease(contents)= min(10, 0.5 ⋅ ∑<sub><em>c</em> ∈ contents</sub>(today − <em>c</em>.startDate + 1)

Examples:

- If the user is 7 days behind to learn 2 contents, the health score will be 100 - 7 - 6 - 5 - 4 - 3 - 2 - 1 = 72%.
- If the user is 7 days behind to learn 4 contents, the health score will be 100 - 14 - 12 - 10 - 8 - 6 - 4 - 2 = 44%.
- If the user is 14 days behind to learn 1 content, the health score will be 47.5%.
- The earliest the user can reach health 0% is 10 days behind (with 20 contents behind)

To regenerate health, the user has to progress through new content.
If he does so, the health will regenerate by x% where x is the missing health to 100% divided by the number of contents
the user is behind (before they progressed the new content).

For example if the user has 70% health and has to learn 2 contents to be up-to-date again, he will regenerate 15%
health (100 - 70 / 2) when he progresses through one content. If he progresses through both contents, he will regenerate
30% health (100 - 70 / 1) and will be back to 100% health.

> healthRegen(health, contentsBehind) = (100 - health) / #contentsBehind

#### Possible parameters to change

| Parameter              | Description                                       | Default value |
|------------------------|---------------------------------------------------|---------------|
| Health decrease factor | The factor applied to the health decrease per day | 0.5           |
| Max health decrease    | The maximum health decrease per day               | 10%           |

</details>

### Fitness

> Fitnessshows how well a student repeats previous chapters. For example, if the IT-REX is limp, the student has to
> repeat old chapters and “train” so that the fitness increases. Furthermore, tests that the student did not solve
> correctly are repeated more frequently

<small><i>cited from the GITS paper</i></small>

The fitness score represents how well the user repeats old content.
It is calculated similar to the health score, but only considers content that is due for repetition
and also takes into account the correctness score of each content.

<details><summary><b>Spaced repetition</b></summary>

To understand how the fitness score is calculated, we first need to understand how the spaced repetition works.

- Each content that the user progressed at least once has a **date when it was last learned**.
- Additionally, we assign a **learning interval** to each content.
  This is the number of days after which the content should be repeated.
- When the content is progressed the first time, the learning interval will be one day.
- **For each successful repetition, the learning interval will be increased.**
- For each unsuccessful repetition, the learning interval will be decreased.

This way, content that is difficult for the user will be repeated more often than content that is easy for the user.

The exact learning intervals might be configurable, for now we propose the following:

| Times repeated correctly | Learning interval in days |
|--------------------------|---------------------------|
| 0                        | 1                         |
| 1                        | 3                         |
| 2                        | 7                         |
| 3                        | 14                        |
| 4                        | 30                        |
| 5                        | 60                        |
| 6                        | 120                       |

When the user fails to progress through a content, the learning interval will be decreased to the one which is one row
above the current one in the table above.
Alternatively, we could also reset the learning interval to 1 day.

Using the date when the content was last learned and the learning interval, we can calculate the next repetition date.
At any time we can calculate the list of contents that are due for repetition, which is possibly empty.
</details>

<p></p>
<details><summary><b>Fitness score calculation</b></summary>

For the fitness score, **we only consider contents that are due for repetition**.

The fitness score is calculated in the following way:

- If no contents are due for repetition, the fitness score is always 100%
- For each content that is due for repetition, the score decreases by `1 + (2 * daysOverdue *  (1 - correctness))` where
  - `daysOverdue` is the number of days the content is overdue for repetition, starting at 1 if the learning date is
    today
  - `correctness` is the correctness of the content
- The maximum decrease per day is capped at 20%.

This way, the fitness score will decrease more if the user has a lot of content to repeat and the correctness is low. If
the user has contents to repeat with high correctness, the fitness score will decrease more slowly.

This results in the following formula:

```
fitnessDecrease(contentsToRepeat) = min(20, sum of contentsToRepeat (1 + (2 * daysOverdue * (1 - correctness))))
```

Examples:

- If the user gets 10 contents to repeat with a correctness of 95% at the current date, the fitness will be 89%. (100 -
  10(1 + 2 * (0.05)))
- If the user does not repeat any of those contents, the next day the fitness will be 77%. (89 - 10(1 + 4 * (0.05)))
- If the correctness of those contents had been 25%, the fitness at day 2 after the contents were due would be 35%.
- If a user has one content overdue by 7 days with a correctness of 95%, the fitness score would be 90.2%.
- If a user has one content overdue by 7 days with a correctness of 25%, the fitness score would be reduced to 51%.
- If a user has one content overdue by 30 days with a correctness of 95%, the fitness score would be reduced to 23.5%.

To regenerate fitness, the user has to repeat old content.
If the user repeats a content that he is not due according to the spaced repetition algorithm, the fitness will
regenerate by 1% if he repeats it correctly.
This way, the user is encouraged to repeat content he is already good at, because it will regenerate his fitness score,
even though slowly.

If the user repeats a content that he is due for according to the spaced repetition algorithm, the fitness will
regenerate by the following formula:

```
fitnessRegen(fitness, contentsToRepeat, correctnessBefore, correctnessAfter) 
= (1 + correctnessAfter - correctnessBefore) * (1 - fitness) / contentsToRepeat
```

This means that fitness is regained similarly to how health is regained, but the amount of fitness regenerated is
additionally multiplied by a factor that depends on the correctness before and after the repetition.

If the user repeats content unsuccessfully, the fitness score does not change.

Examples:

- If the user has a fitness of 90%, repeats one of two contents, and repeats it with the same correctness as before, the
  fitness will be 95%.
- If the user has a fitness of 90%, repeats one of two contents, but increases the correctness from 50% to 100%, the
  fitness will be 97.5%.
- If the user has a fitness of 90%, repeats one of two contents, but decreases the correctness from 100% to 50%, the
  fitness will be 92.5%.
  - 50% might be too low that the assessment or content is considered successful, so this might not be a realistic case.

</details>

### Growth

> Growth serves as a progress bar, so the students know how much of the course is still ahead of them. The IT-REX
> receives food with each new concept learned. Therefore, it grows and moves up in levels. An upper limit for the levels
> indicates the end of the course that the student is aiming for.

Each content has a growth reward score.
This score must be at least 0 but has no upper limit.
The total growth score that can be achieved is the sum of all growth reward scores of all contents.
The progress bar is then calculated by dividing the current growth score by the total growth score.
We purposely do not constrain the growth score between 0 and 100% because we want to give the course creators the
freedom to decide how much growth a content should give.
If a content has a reward score of 100.000, the user might feel more rewarded than if the content only has a reward
score of 10, even though both might be 10% of the total achievable growth score.

The growth score can not decrease.

### Strength

> Strength is used to enforce a certain level of interaction between the students and aims at motivating them to
> participate regularly in REX-Duels: By participating inREX-Duels, the IT-REX gets strength points that depict how a
> student’s knowledge level is compared to others. While both participants increase their IT-REX’ strength points in
> aREX-Duel, the winner will gain significantly more strength points which aims at motivating students to prepare for
> REX-Duels by learning regularly

For now, we focus on scores that are not based on the competition with other students, but only on the progress of the
user.
But this score will likely have no upper limit, so that the user can always improve his strength score by competing with
other students.
This score will also not decrease.

### Power

> Power shows the composite value of the other properties so that a ranking of students can be created.

```power = (health/100) * (fitness/100) * (growth + strength)```

The power is calculated by adding the growth and strength score and multiplying it by the health and fitness score.
Health and fitness are divided by 100 so that they are between 0 and 1.

## The skill level system

While the reward system is used to motivate the students to learn, the skill level system is used to reflect the skills
of the students.
There are four categories of skills:

- Remember
- Understand
- Apply
- Analyze

Each skill has a score between 0 and 100%.
The scores are both calculated per chapter and per course.

### Calculation of the skill level score

In this section we will explain how the skill level score is calculated.
For each skill category the calculation is the same, which skill category is used is configured in the assessment.

Initially, each skill has a score of 0%.
Each assessment has score points for each skill that are defined by the course creator.
For each skill category, a total number of skill points can be calculated by summing up the score points of all
assessments.
**The maximum number of skill points per skill category is this sum times 4**, because we want to encourage the students
to repeat assessments at least four times to **strengten the long term memory**.

The skill level score is then calculated by dividing the score points the student has achieved by the total number of
skill points.
So the difference between skill points and skill level score is that *skill points are absolute* and the *skill level
score is relative* to the total number of skill points.

Each time a student works on new content or content that is due for repetition, the skill points are updated.
The student receives as many skill points as defined in the assessment,
but with the following modifiers:

- -10% for each hint used, but not more than -40%
- multiplied by the correctness
- +10% for 100% correctness to give a bonus for knowing all answers
- if the assessment was timed, the time is also taken into account by multiplying the score by the time limit divided by
  the time the student took to progress the content, but not more than 150% and not less than 50%.
- The exact modifiers values need to be fine-tuned

The modifiers are applied multiplicative, so if a student does an assessment the second time, uses a hint and has a
correctness of 50%, he will receive 0.6 * 0.9 * 0.5 = 27% of the skill points of the assessment.

This way, if a student already knows everything of a chapter perfectly, he will receive approximately 25% of the total
skill points of the chapter, not considering any bonuses.
Thus, without repetition, the student will never reach 100% of the skill points of a chapter. At least three repetitions
are necessary to reach 100% of the skill points of a chapter.

The user cannot gain more than 100% of the skill points of a chapter, even if he repeats the content multiple times.



