# Content service

The content service provides information about which content is part of a course, which chapter the content is a part of, on which date the content will be unlocked and what content needs to be learned before unlocking some piece of content.
In addition this service can be used by the lecturer to annotate non-trivial dependencies between content.  
The course service only holds references to the actual course content, such as lecture videos, quizzes and flashcards.   
It allows the system to suggest to a student what he needs to learn as a foundation for a quiz or game he just failed.  
Example of how dependencies in a course might be structured:
![dependency example](../../images/dependency.png)