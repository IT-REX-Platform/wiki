# Authorization Concept

This document outlines the authorization concept used to ensure that graphql queries and mutations can only commence when a user has permission to perform certain actions in certain scenarios.

## General Assumptions, Conditions, and Decisions Regarding the Concept

* There exist global permissions (permissions for creating new courses etc.), which are not specific to a certain course
* Also for each user, there exist course-specific permissions (permissions view the course, to modify the course, upload material etc.)
* There are different permission levels ("roles", not to be confused with the concept in Keycloak also called roles) both on the global and on the course scale. E.g. a lecturer of a course has write-permissions in that course, but not in other courses; A student assigned to a course has read permissions only for that course. Permissions cannot be set fine-grained per user, only a role with a predefined set of permissions (either globally or on a course-specific level) can be assigned to a user
* We assume there are no additional hierarchical permission concepts other than global permissions and course-specific permissions. This means that it is not possible for example for a user to only have permissions for some contents of a course. You either have permissions for everything that's part of the course, or you do not. (Of course this limitation does not impede on the ability of services to implement specific limitations on access to course content which is not dependent on independent user permissions but instead on other rules, e.g. a quiz which can only be accessed by students before a specific date has passed)

## Keycloak

Keycloak is used for user authentication. Keycloak is also used in the authorization concept to store the global and course-specific role of each user.

### Keycloak User-Service

Other services shall not directly interact with Keycloak. Instead, a service is placed between Keycloak and the rest of the system's infrastructure. This service abstracts away Keycloak-specific quirks and provides a simple interface for other services to create users, add users to courses, grant or revoke roles of users, etc.

## Authorization-Related Inter-Service-Communiction

As GraphQL allows creating complex nested hierarchical queries and mutations, and as we are using GraphQL Mesh to split up queries to multiple services, ensuring proper authorization for all parts of a query is of paramount importance. At the same time, many unnecessary calls by services to check for permissions which have already been checked previously at some "upstream" location of the query hierarchy, should be avoided as this can potentially put a lot of strain on the infrastructure when querying a large dataset.

## Querying Course-Specific Permissions

**Course-specific permissions should in almost all cases NOT be requested from the Keycloak User-Service directly.**

Instead, the course service should, for a course query, also return a user's permission level for that course, if a user auth token was provided in the graphql request context. If other services want to get a user's permissions for a specific course, they should request this information from the course service.

Considering this, there are two specific dataflow cases which could be identified:

### Gateway-Managed Permissions Check

![](/images/authorization-gateway.png)
[Edit Diagram (Image and this link have to be updated manually after editing)](https://mermaid.live/edit#pako:eNqVVM1uGyEQfpURlzZS0gdYVb4kUlVVuSRKTnsZw7hGZsEFdivH2ncPsBt7gW2l-GDBDPv9wMycGTeCWMMc_elJc3qQ-Nti12oIP-TeWHhxZKf9Ea2XXB5Re_iBnv7iqU78ohNXBg91JgI9kx0kpzp5b3rr6D9p7Un7f-YfSUjMstN_5LzbbGa1DTxFn87DGXgidGmVsOOyizBPxI0VDsZxvNyDHALC1fQUn7cB_8N0A6-opIhn-8AM3hxIFyD5BX3s7nKVvrcahglLGg1S78z0gaAVpFLP4qoTmpU0zJIm39-3dtNRtyXr9vKY4G2XqAq11aMtAmuaI8cXBwV2JT2DLdVntXB9M1QKcECpcKvo8n5mlzgL2SvllIXWpFfYleoCtda9LNKr8EuBbU_w8wG-Ss3VN2gZ9n5vrHwj0TLYSVLiprJRl30eWzMy80GoHVzxkEOWJpaddLWQGgPs3Bmf9lG35zKy5iEjrEzkeLmFufwLJBlRKpz5G3bLOgr1L0UYhed4qmV-Tx21rAlLgfbQslaP4Vzwap5PmrPG255uWX-M3T6PTdbsULkQDZRhdD5OszWN2PEdLqrnRQ)

This type of permissions check is used in cases where the gateway splits up a query which has a call to the course-service at the top level and further queries the returned courses' data from other services. Example:

```graphql
courses {
    mediaRecords {
        name,
        type
    }
}
```

1. The GraphlQL Mesh Gateway would split this query up into a call to the course service, which requests for each course the ids of the media records which are part of this course.
2. Then, the gateway would send a query to the media service, passing the media record ids it collected and requesting back the data for each of them. 
3. Lastly, the gateway would construct the response to the graphql query by merging the two responses it got from the two services (replacing the media record ids it got from the course service with the actual media record data it got from the media service).

In this case, the gateway knows the course-affiliation for each media record, so it can simply pass a field {"authorized": "student" } to all subsequent services (the media service, in our example). Then these services know that they don't have to check themselves if the user is authorized to view the course this content is affiliated with.

### Handling GraphQL requests where the user only has permissions for some subitems

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

**For the courses where member information cannot be returned due to missing permissions, return null instead. Remember that the possibility of a null response needs to be considered in the GraphQL schema as well!**

### Backtracking Permissions Check

![](/images/authorization-backtracking.png)
[Edit Diagram (Image and this link have to be updated manually after editing)](https://mermaid.live/edit#pako:eNp1VMGO2yAQ_ZURl14SVd3erCqXVlpV7R7aVXvyZQyTDYoNLmCvrCj_XsA4i03WBwtm4M2bN8NcGNeCWMUs_RtIcfom8cVgVyvwH3KnDfyxZOZ9j8ZJLntUDh7R0StOpeOJhMRnMqPkVHq_6sFYetf9gybeajyXnsBidW3-B_P-cEhsKng02J9-_YQXctAFJl8aczDEtREWmgmkuKUmR3_pLY_ZnrYecqFSwV9spQhnBx8MnD6T2oCsaS-7fU7sN7nBKBhnLKkVSHXU8wVBd5C2fDIBIpqRNCZKPIoaMu2oa8jYk-wjvOliqA3bQsrMcI9ziPHBwga7oL6C3bLPu-KtSiZ0nXWB-evHnDFgoweXIgc3jihbbFpKydpNTmXX5RZPYNV4IbUYGfB4lK30CCIBAyoBKZr3uCnSChQ8ObjEnvouPu0grR5uq8_XDadNry-irMz7Qpsk-iXn4MPl24f1dgmc1eLOM1vpcafKN4XnFxPl8arE5Ar8Uu6l1KlT8xrbXitLBUa6wXasI192KfwYuoRTNXMn6qhmlV8KNOea1erqz-Hg9POkOKucGWjHhj48yzSyWHXE1nqrp-bH1tM81-J4u_4H3LW6Pw)

This type of permissions check is used if data is queried directly (i.e. a top-level query to course-specific data). Example:

```graphql
mediaRecords {
    name,
    type
}
```

In this case, there is no way to know if the user sending the query has access to each media record, even if we knew what courses the user has access to. This is because the media service does not know which course each media record is included by. Thus, the only way to determine permissions is by back-tracking through the data hierarchy until the course-level is reached (for course-specific data, course-level is top-level).

Imagine a more complex scenario, where each course has multiple chapters, which each have multiple media records. To determine permissions of a specific media record, firstly we need to determine which chapter it is part of. Then, to find out if the user has access, we also need to find out what course the chapter is associated with. We have to go "up the chain" through the different levels, because a lower level does not have any information about its parent level.

To facilitate this kind of hierarchical permissions check, each service should provide support for a standardized GraphQL query to determine permissions of multiple entries by id. If the service cannot determine permissions by itself, it should itself use this standardized query to call the next service in the hierarchy to determine permissions. This chain backtracks through the hierarchy until it reaches the course service, which is guaranteed to be able to determine permissions by itself.