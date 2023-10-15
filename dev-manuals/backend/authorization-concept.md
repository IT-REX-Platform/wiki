# Authorization Concept

This document outlines the authorization concept used to ensure that graphql queries and mutations can only commence when a user has permission to perform certain actions in certain scenarios.

## General Assumptions, Conditions, and Decisions Regarding the Concept

* There exist global permissions (permissions for creating new courses etc.), which are not specific to a certain course
* Also for each user, there exist course-specific permissions (permissions view the course, to modify the course, upload material etc.)
* There are different permission levels ("roles") both on the global and on the course scale. E.g. a lecturer of a course has write-permissions in that course, but not in other courses; A student assigned to a course has read permissions only for that course.
* We assume there are no additional hierarchical permission concepts other than global permissions and course-specific permissions. This means that it is not possibl, for example, for a user to only have permissions to view certain chapteres of a course. You either have permissions for everything that's part of the course, or you do not. (Of course this limitation does not impede on the ability of services to implement specific limitations on access to course content which is not dependent on independent user permissions but instead on other rules, e.g. a quiz which can only be accessed by students before a specific date has passed)
* Locally (in a course), each user has exactly one role assigned to them
* Globally, each user can have multiple roles assigned to them

## User Roles
Currently, the following roles exist in the global and the local (course) scope:

### Global Roles
* `SUPER_USER`: Has permission to do anything and everything in the application. This role is should only be assigned to the application's administrator. Also kown as `super-user` in Keycloak and in the userdata JSON format emitted by the Gateway.
* `COURSE_CREATOR`: Has permission to create new courses. Also known as `course-creator` in Keycloak and in the userdata JSON format emitted by the Gateway.

### Course-specific Roles
* `ADMINISTRATOR`: Has permission to do anything and everything in the course. This role should only be assigned to the course's lecturer (and possibly their assistants).
* `TUTOR`: Currently has no purpose. Exists for future use e.g. in the context of correcting homework done by students.
* `STUDENT`: Has permission to view the course and its content. This role should be assigned to all students who are assigned to the course.

## Basic Components
### Keycloak
Keycloak is used for user authentication and to store the global roles of users.

### Gateway
* Verifies the auth token and extracts/retrieves information abou the logged in user which is then forwarded to the services.

### UserService
* Currently does not store any data of its own. Is just used to provide a graphql endpoint to retrieve user information from Keycloak.
* Could be used in the future for saving user-specific settings

### Course Service
* The CourseService provides an endpoint which can be queried with the id of a resource and which returns the id of the course it is associated with and a boolean to indicate if that course is available depending on the course properties `published`, `startDate`, `endDate`
* Stores which users are members of which courses and which role they have in that course

### Other Services
* Ensure that resources can only be accessed by users who have the necessary permissions to access the course the resource is located in
* To facilitate this, they store in which course the resource they manage is located (e.g. the quiz service knows which quiz belongs to which course).
    * Obviously, the services can not know this information on their own, so when a new resource is created, the information about which course it is in has to be passed to the service.
    * For "second-level nested" resources, e.g. when creating a new section which is located in a chapter which is located in a course, it would be unweildy to expect the frontend to also pass the correct course id to the service, even though it already has to pass the id of a chapter.
    * So in these cases, the gateway will determine the course id of the resource by querying the parent resource for its course id and then passing that course id to the service.
        * This is implemented by the service having an `_internal_` mutation (only callable from the gateway or other services, e.g. `_internal_createSection(courseId: UUID, input: CreateSectionInput!)`) mutation and the gateway providing an exposed mutation `createSection(input: CreateSectionInput!)`, in whose resolver it determines the course id and then calls the internal mutation.


## Authorization Concept

![](/images/authorization-backtracking.png)
[Edit Diagram (Image and this link have to be updated manually after editing)](https://mermaid.live/edit#pako:eNqNU01PwzAM_StRDnxITNwrtAtIu7ADTHDqxU281VqbFCfpNE377yRt2boVJHpIU388v1fbB6msRplJh18BjcIXgg1DnRsRH1DesvhwyAJc_77bkS8FhHh4u0Vz30c2wJ4UNWC8WIDHHeynjiVqghVySwqn3mcb2OHJ3Qf0Z6o8m88H4EwsGJry7VVs0Is6gT4VPGdUlrUTxV6QPvGnNiadKfX24XMM-QkV6RQakspO2jT6gmIm3tEzYTvkqM6ZmNRYF8iupEbciCYUFblSkFlbrsGTNVfkroQn34VpNuYZawY2QzHxv0oa_6p1LXDcofNv5jQbzidpu8cxvIDCBt_Jv3XJDS1QBUWFA0F3JXU6AWPLb0JPiH2LOyKo-65P1E3hf6RF5DREY02uscbhBGPIkA-yxiiTdFyOQ4rKpS-xxlxm8aqBt7nMzTHGxWWwq71RMvMc8EGGJg3SsEgyW0PlojVSi8u07LetW7rjNyjqOcU)

0. It is assumed the frontend (or other system which is interacting with the backend's GraphQL API) has already retrieved an auth token from Keycloak and sends it in the HTTP header's `Authorization` field of its GraphQL request.
1. The Gateway, upon receiving a request, extracts the auth token from the request's HTTP header and verifies the token's validity.

    It also extracts all relevant user information from the token (user id, username, first name, last name, global roles of this user etc.)

2. The Gateway calls the course service to retrieve information about the courses the user is a member of (course id, role, published state, startdate, enddate).

3. When forwarding GraphQL requests to the different microservices, the Gateway transmits the retrieved user information to the microservices in the `CurrentUser` field of the GraphQL request's HTTP header as a JSON with the following format:

    ```json
    {
        "id": "123e4567-e89b-12d3-a456-426614174000",
        "userName": "MyUserName",
        "firstName": "John",
        "lastName": "Doe",
        "courseMemberships": [
            {
                "courseId":"123e4567-e89b-12d3-a456-426614174000",
                "role": "STUDENT",
                "published": true,
                "startDate": "2020-01-01T00:00:00.000Z",
                "endDate": "2021-01-01T00:00:00.000Z"
            }
        ],
        "realmRoles": [
            "course-creator"
        ]
    }
    ```

4. The services deserialize the HTTP header of the requests they receive using the `RequestHeaderUserProcessor` class. More information about this can be found [here](auth&accessing-user-data.md).

5. Services check if the user has permissions for the course the resource they are trying to access is in.

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