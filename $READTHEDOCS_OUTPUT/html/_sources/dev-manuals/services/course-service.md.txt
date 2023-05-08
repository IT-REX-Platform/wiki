# Course service

The course service provides the information which courses are available as well as details about each course.
It also allows the creation of new courses and editing of existing ones.  
It provides information about which content is part of the course, which chapter the content is a part of, on which date the content will be unlocked and what content needs to be learned before unlocking some piece of content.  
The course service only holds references to the actual course content, such as lecture videos, quizzes and flashcards.  
Who has access to the course and the different roles such as lecturer, teaching assistent and student are not handled by the course service. For these functionalities the course service invokes keycloak.  
Example of how a course might be structured:
![course example](../../images/course.png)