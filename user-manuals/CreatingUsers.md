# User Accounts

User accounts can be created in the Keycloak web interface (see the Keycloak documentation for more information). Users can also create a new account by pressing the "Register" button on the login page.

## User Roles

Currently, the following roles exist in the global and the local (course) scope:

### Global Roles
* `SUPER_USER`: Has permission to do anything and everything in the application. This role is should only be assigned to the application's administrator. Also kown as `super-user` in Keycloak and in the userdata JSON format emitted by the Gateway.
* `COURSE_CREATOR`: Has permission to create new courses. Also known as `course-creator` in Keycloak and in the userdata JSON format emitted by the Gateway.

### Course-specific Roles
* `ADMINISTRATOR`: Has permission to do anything and everything in the course. This role should only be assigned to the course's lecturer (and possibly their assistants).
* `TUTOR`: Currently has no purpose. Exists for future use e.g. in the context of correcting homework done by students.
* `STUDENT`: Has permission to view the course and its content. This role should be assigned to all students who are assigned to the course.

## Setting Global User Roles

Global roles can be assigned to a user using the Keycloak webinterface. When in the web interface and in the GITS realm, go to the user overview, select your user, go to the roles tab, and add the desired roles. Roles can also be set programmatically using the Keycloak REST API. See the Keycloak documentation for more information.

**After assigning a global role to a user it will only be applied after the user's session has been invalidated! (Up to 30mins or until the user logs out and back in again)**

## Setting Local User Roles

Local roles (course-specific) can be set by a course's administrator. The creator of a course is automatically assigned the `ADMINISTRATOR` role. To assign roles to other users, go to the course's overview page (lecturer view), click the "Members" button in the top-right to view all members of the course, and assign a role as desired using the drop-downs.

Local roles can also be assigned programmatically using the GraphQL API using the `createMembership` and `updateMembership` mutations. See the API documentation for more information.
