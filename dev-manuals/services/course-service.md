# Course service

The core responsibility of the course service is to manage course and chapter structures, as well as course memberships. In the course-service courses and chapters can be created, modified and deleted. Each course can have one or multiple chapters, which can also be queried individually.
Chapters can be further populated with content and structuring elements. These are provided by the [content service](./content-service.md). The course service does not contain any information on what content or structuring elements are present in each chapter. This information is solely located on the content service.
Access to courses and underlying content is restricted by course memberships. Course memberships are not handled in this service but in a separate service, the [user service](./user-service.md).
Authorization of GraphQL endpoints for the course service is handled by our [GraphQL Gateway](./gateway-service.md).

Course memberships of users are created, modified, and deleted in this service.
Currently, a user can be assigned one of three roles in the system:
- STUDENT
- TUTOR
- ADMINISTRATOR
  Each role comes with a different set of permissions. 'Student' is the role with the least amount of permissions, restricted to only viewing and tracking progress on a course's content.
  In the future, a student will also be able to hand in assignments for grading in the IT Rex platform.
  A 'Tutor' will then be able to view these assignments and provide feedback to the students.
  The 'Administrator' role is designated for lecturers and teaching assistance and comes with all permissions for the course. With this role new Content such as flashcards, and quizzes can created, modified, and removed. A lecturer can upload lecture slides and videos, and completely design and organize the course, its underlying chapters and its content with this role.


A more technical description of the course service and its endpoints can be found in our [Github Repository README](https://github.com/IT-REX-Platform/course_service#readme).
