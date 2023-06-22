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

## Basic Authorization Concept

![](/images/authorization-backtracking.png)
[Edit Diagram (Image and this link have to be updated manually after editing)](https://mermaid.live/edit#pako:eNp1VMGO2yAQ_ZURl14SVd3erCqXVlpV7R7aVXvyZQyTDYoNLmCvrCj_XsA4i03WBwtm4M2bN8NcGNeCWMUs_RtIcfom8cVgVyvwH3KnDfyxZOZ9j8ZJLntUDh7R0StOpeOJhMRnMqPkVHq_6sFYetf9gybeajyXnsBidW3-B_P-cEhsKng02J9-_YQXctAFJl8aczDEtREWmgmkuKUmR3_pLY_ZnrYecqFSwV9spQhnBx8MnD6T2oCsaS-7fU7sN7nBKBhnLKkVSHXU8wVBd5C2fDIBIpqRNCZKPIoaMu2oa8jYk-wjvOliqA3bQsrMcI9ziPHBwga7oL6C3bLPu-KtSiZ0nXWB-evHnDFgoweXIgc3jihbbFpKydpNTmXX5RZPYNV4IbUYGfB4lK30CCIBAyoBKZr3uCnSChQ8ObjEnvouPu0grR5uq8_XDadNry-irMz7Qpsk-iXn4MPl24f1dgmc1eLOM1vpcafKN4XnFxPl8arE5Ar8Uu6l1KlT8xrbXitLBUa6wXasI192KfwYuoRTNXMn6qhmlV8KNOea1erqz-Hg9POkOKucGWjHhj48yzSyWHXE1nqrp-bH1tM81-J4u_4H3LW6Pw)

1. The Gateway firstly validates the user token sent by the user
2. The Gateway retrieves course membership information of the user from the UserService
3. The Gateway passes course membership information of the user to the in its request to other services using the GraphQL Context
4. The service of which a resource is requested (in the example the MediaService) requests the course the resource is associated with from the CourseService
5. The service checks if the affiliated course is available using the information returned by the CourseService and it checks whether the user has access to the affiliated course using the membership info passed by the Gateway

### Retrieving Permissions for a Resource in a Service

In detail, to retrieve permissions for a resource a service wants to return, the following needs to be done by the service:

1. The course it is associated with needs to be retrieved
    * For this, the CourseService provides an endpoint which can be queried with the ids of multiple resources and which returns the ids of the courses they are associated with and a boolean to indicate if that course is available depending on the course properties `published`, `startDate`, `endDate`
2. Check if the `available` boolean for the course the resource is associated with is true
3. Retrieve the courses the user has membership access to from the GraphQL context
4. Check if the user has the necessary membership access to the course the resource is associated with
5. Only return the resource if the aforementioned conditions are met

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


## Skipping Permissions Check Under Some Circumstances (Possible Future Optimization)

![](/images/authorization-gateway.png)
[Edit Diagram (Image and this link have to be updated manually after editing)](https://mermaid.live/edit#pako:eNqVVM1uGyEQfpURlzZS0gdYVb4kUlVVuSRKTnsZw7hGZsEFdivH2ncPsBt7gW2l-GDBDPv9wMycGTeCWMMc_elJc3qQ-Nti12oIP-TeWHhxZKf9Ea2XXB5Re_iBnv7iqU78ohNXBg91JgI9kx0kpzp5b3rr6D9p7Un7f-YfSUjMstN_5LzbbGa1DTxFn87DGXgidGmVsOOyizBPxI0VDsZxvNyDHALC1fQUn7cB_8N0A6-opIhn-8AM3hxIFyD5BX3s7nKVvrcahglLGg1S78z0gaAVpFLP4qoTmpU0zJIm39-3dtNRtyXr9vKY4G2XqAq11aMtAmuaI8cXBwV2JT2DLdVntXB9M1QKcECpcKvo8n5mlzgL2SvllIXWpFfYleoCtda9LNKr8EuBbU_w8wG-Ss3VN2gZ9n5vrHwj0TLYSVLiprJRl30eWzMy80GoHVzxkEOWJpaddLWQGgPs3Bmf9lG35zKy5iEjrEzkeLmFufwLJBlRKpz5G3bLOgr1L0UYhed4qmV-Tx21rAlLgfbQslaP4Vzwap5PmrPG255uWX-M3T6PTdbsULkQDZRhdD5OszWN2PEdLqrnRQ)

For a nested query like the following:

```graphql
courses {
    contents {
        mediaRecords {
            name,
            type
        }
    }
}
```

an optimization could be performed by only checking for course permissions once (instead of all services checking access permission for their resources on their own), and passing an `authorized: yes` field to all following nested service queries, as authorization has aleady been ensured by the first query to the course service.

This optimization may be implemented in the future if necessary to improve performance, but for now the authorization flow will only support the basic concept, as most GraphQL queries by the frontend won't be nested over service boundaries, which means even with the basic concept there is no unnecessary overhead.