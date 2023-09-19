# User service
This service is dedicated to handling all use cases related to user data.
This service's core functionalities are twofold.
This service acts internally (in our system) as a graphQL endpoint extension for our [Keycloak application](../authentication/keycloak.md) that stores and manages all registered users in a system. This is necessary as Keycloak only supports RESTful request messages. The [gateway service](./gateway-service.md) queries user data over this endpoint.
The other core functionality of this service is handling course memberships for courses located in the [course service](./course-service.md). Course memberships of users are created, modified, and deleted in this service.
Currently, a user can be assigned one of three roles in the system:
- STUDENT
- TUTOR
- ADMINISTRATOR
Each role comes with a different set of permissions. 'Student' is the role with the least amount of permissions, restricted to only viewing and tracking progress on a course's content. 
In the future, a student will also be able to hand in assignments for grading in the IT Rex platform.
A 'Tutor' will then be able to view these assignments and provide feedback to the students.
The 'Administrator' role is designated for lecturers and teaching assistance and comes with all permissions for the course. With this role new Content such as flashcards, and quizzes can created, modified, and removed. A lecturer can upload lecture slides and videos, and completely design and organize the course, its underlying chapters and its content with this role.

System-wide permissions (e.g. ability to create new courses) are not handled by this service. These are instead managed by [Keycloak](../authentication/keycloak.md).

A more technical description of the user service and its GraphQL endpoints can be found in our [Github Repository README](https://github.com/IT-REX-Platform/user_service#readme).
