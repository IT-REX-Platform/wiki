# Spaced Repetition

Spaced repetition is a learning technique that is used to improve long-term retention of information.

How does it work in GITS?

- Each content that the user progressed at least once has a **date when it was last learned**.
- Additionally, we assign a **learning interval** to each content.
  This is the number of days after which the content should be repeated.
- When the content is progressed the first time, the learning interval will be one day.
- In each content a different initial learning interval can be configured.
- **For each successful repetition, the learning interval will get at most doubled.**
    - The new learning interval will be doubled if not hints were used and the correctness score is 100%.
    - Otherwise, for each **hint** used, the learning interval will be increased by 10%, but not less than the previous
      learning interval.
    - The additional learning interval will be multiplied by the correctness score.
    - E.g. if the learning interval was 10 days, the user used 2 hints and the correctness score was 80%, the new
      learning interval will be 10 * (1 + 0.8 - 0.1 * 2) = 16 days.
- For each unsuccessful repetition, the learning interval will be at least halved.
    - The new learning interval will be halved if the correctness score is 100%.
    - Otherwise, the new learning interval will be half of the previous learning interval multiplied by the *
      *correctness** score.
- The learning interval will never be smaller than one day.

This way, content that is difficult for the user will be repeated more often than content that is easy for the user.

### Exact calculation:

```java
protected Integer calculateNewLearningInterval(UserProgressLogEvent userProgressLogEvent,UserProgressDataEntity userProgressDataEntity){
        if(userProgressDataEntity.getLearningInterval()==null){
        return null;
        }
        double newLearningInterval;
        if(userProgressLogEvent.isSuccess()){
        int hintsUsedCapped=Math.min(userProgressLogEvent.getHintsUsed(),10);
        newLearningInterval=userProgressDataEntity.getLearningInterval()*
        (1+userProgressLogEvent.getCorrectness()-hintsUsedCapped*0.1);
        }else{
        newLearningInterval=userProgressDataEntity.getLearningInterval()
        *(0.5*userProgressLogEvent.getCorrectness());
        }

        return(int)Math.floor(Math.max(1,newLearningInterval));
        }
```

Here is an example table for the learning intervals, when content was learned always correctly without using hints:

| Times repeated correctly | Learning interval in days |
|--------------------------|---------------------------|
| 0                        | 1                         |
| 1                        | 2                         |
| 2                        | 4                         |
| 3                        | 8                         |
| 4                        | 16                        |
| 5                        | 32                        |
| 6                        | 64                        |

Spaced repetition will only be applied to assessments and not to lectures.
The student probably does not want to watch the same lecture video again and again.
Also for some types of assessments, repeating the content after just one day might be too early.
Therefore, we consider to make the base learning interval configurable for each content.

Using the date when the content was last learned and the learning interval, we can calculate the next repetition date.
At any time we can calculate the list of contents that are due for repetition, which is possibly empty.