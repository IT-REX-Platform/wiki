# Authorization Concept

This document outlines the authorization concept used to ensure that graphql queries and mutations can only commence when a user has permission to perform certain actions in certain scenarios.

## General Assumptions, Conditions, and Decisions Regarding the Concept

* There exist global permissions (permissions for creating new courses etc.), which are not specific to a certain course
* Also for each user, there exist course-specific permissions (permissions view the course, to modify the course, upload material etc.)
* There are different permission levels ("roles", not to be confused with the concept in Keycloak also called roles) both on the global and on the course scale. E.g. a lecturer of a course has write-permissions in that course, but not in other courses; A student assigned to a course has read permissions only for that course. Permissions cannot be set fine-grained per user, only a role with a predefined set of permissions (either globally or on a course-specific level) can be assigned to a user
* We assume there are no additional hierarchical permission concepts other than global permissions and course-specific permissions. This means that it is not possible for example for a user to only have permissions for some contents of a course. You either have permissions for everything that's part of the course, or you do not. (Of course this limitation does not impede on the ability of services to implement specific limitations on access to course content which is not dependent on independent user permissions but instead on other rules, e.g. a quiz which can only be accessed by students before a specific date has passed)

## User Roles
### Global Roles
Administrator: Has complete control over the application, including user management, course creation, and overall system configuration.
Owner: This group of people have the right to create their own courses and edit them, as well as give chosen users the ability to edit the courses in ceratin ways. They can not edit/change courses, they have not created themselves or were given the right to. (Example: Lecturer)
Moderator: Those people have all the rights Standard Users have + the right to edit course data for courses they were allowed to. Without the rights given by an admin or an owner, they can not change anything in a course they should not be able to. (Example: Tutors)
Standard User: Has all the rights to access courses he is enrolled in, join courses he has the right to and work on his own progress in those courses. He can't change anything, unless it is his password, Username or other personal information. (Example: Student)

### Course-specific Roles
Course Creator: Users with this role can create and design their own courses within the application. They have full control over the course content, assessments, and enrollment.
Teaching Assistant: Assists the instructor in managing the course, grading assignments, and answering student questions.
Course Member: Enrolled in a specific course. Can access course content, participate in discussions, and complete assessments.


## Basic Components
### Keycloak

Keycloak is used for user authentication.

### UserService

* Saves course membership information for every user
* Could be used in the future for saving user-specific settings

### Course Service

* The CourseService provides an endpoint which can be queried with the id of a resource and which returns the id of the course it is associated with and a boolean to indicate if that course is available depending on the course properties `published`, `startDate`, `endDate`
* Used by other services to find out if a resource should be accessible by a user

<details>
<summary>Reasoning for putting the Resource Lookup into the CourseService</summary>

Originally it was planned to have the resource<->course lookup in its own service. However, it was noticed that a resource's availability for a user is not just dependent on if the user has access to the course, but also on if the course is currently published and available. This would have required another request by a service to the CourseService to retrieve this information.

For this reason the resource<->course lookup was consolidated into the CourseService, which can then provide an endpoint for other services to return all necessary information regarding a resource's availability to a user. 

</details>

## Authorization Concept

![](/images/authorization-backtracking.png)
[Edit Diagram (Image and this link have to be updated manually after editing)](https://mermaid.live/edit#pako:eNp1VMtu2zAQ_JUFL02BBL0LhXNo0SBAc2iD9qTLSlxHi0ikwocNI8i_hxQZmxYdH2R7H7MzyxFfRa8liUZYevGkevrJ-GRwahWED_ZOG_hnyQDa9H21ZzcA-vBw-pnU11Q5o3Hc84zKwR062uOhTjyQZHwks-Oe6myE_zT5Q3tj6ZhOBekZ-242mzy1gTuD8_DnNzyRgylO_N6ZjaFeG2mhOwDLozjehaYT3xTPf0vI_ziyjKU-rmDRXVcX_Bv4S84w7XJHv7CPPCaaOjJ24BlYbbWZ0LFWK0LVJorATckrTPFGLTO-WFhhp1ZJl2HX7M8W3MCvcO44jpm5TTLYAuYpoLcN3Nuch9l3I9uB5O1KyurcYu4sdEnOOWa9p0LSRVucRJWGOxnDRKtbF49j_62EB-y0d3mdMY075BG7kT72sFJXG7qMXNJ2REymXIiQTD6t1NXwH9Ky3UpNdtbKUoWRO8S1mCjIZBne9ddY1Qo30EStaMJPiea5Fa16C3Xh3daPB9WLxhlP18LP0fr5XhDNFkcbooFauBse0uWx3CFv775Xgwc)

TODO: Add description of authorization concept v.3

## Handling GraphQL requests where the user only has permissions for some subitems

Imagine a query like the following:

```graphql
courses {
    title,
    members {
        name
    }
}
```

This query would list all courses a person have access to and also return the course name and all its members.

However, only lecturers and tutors have access to the member information of a course. If the query above is sent by an account of a person who is a tutor for some courses, but only a regular student for others, then how should the response look like? The members obviously cannot be returned for courses where the user does not have the necessary permissions, but they should be returned for the courses where the user has the permission.

**Such a case should be handled by services in the following way:**

For the courses where some information cannot be returned due to missing permissions, return null instead. Remember that the possibility of a null response needs to be considered in the GraphQL schema as well!

<details>
<summary>Reasoning for using null</summary>

We decided on returning null instead of throwing a GraphQL exception because if a service threw an exception each time it tries to return a resource for which the user does not have permissions, that would result in the frontend having to send 3 queries instead of 1: Firstly it would have to retrieve the user's permissions for the courses it wants data of, then it would have to query all the courses the user has "less" permissions for, and then it would have to query the courses the user has "more" permissions for.

When returning null, the frontend can just query courses indiscriminatly and when processing the response it can just skip data values which are null which makes the implementation way easier.
</details>


## Speeding up nested GraphQL queries

TODO: Add description of speedup implemented with authorization concept v.3