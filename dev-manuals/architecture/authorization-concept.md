# Authorization Concept

This document outlines the authorization concept used to ensure that graphql queries and mutations can only commence when a user has permission to perform certain actions in certain scenarios.

## General Assumptions, Conditions, and Decisions Regarding the Concept

* There exist global permissions (permissions for creating new courses etc.), which are not specific to a certain course
* Also for each user, there exist course-specific permissions (permissions view the course, to modify the course, upload material etc.)
* There are different permission levels ("roles", not to be confused with the concept in Keycloak also called roles) both on the global and on the course scale. E.g. a lecturer of a course has write-permissions in that course, but not in other courses; A student assigned to a course has read permissions only for that course. Permissions cannot be set fine-grained per user, only a role with a predefined set of permissions (either globally or on a course-specific level) can be assigned to a user
* We assume there are no additional hierarchical permission concepts other than global permissions and course-specific permissions. This means that it is not possible for example for a user to only have permissions for some contents of a course. You either have permissions for everything that's part of the course, or you do not. (Of course this limitation does not impede on the ability of services to implement specific limitations on access to course content which is not dependent on user permissions but instead on other rules, e.g. a quiz which can only be accessed by students before a specific date has passed)

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
[Edit Diagram (Image and this link have to be updated manually after editing)](https://mermaid.live/edit#pako:eNqdlM1uAiEUhV_lhlVNbB_ANG5q0jSNm5ruZnOFO0qcAQuMzdT47oX50WEYk6YujFzgO5xzkTPjWhBbMEtfFSlOK4k7g2WmwH-QO23g05Jpx0c0TnJ5ROXgFR19Y51OvOjKWNqQOUlO6XSgdZOAdjh83prlwzvVvNB4mE2BlSPl7pLXJCRGs-13kHhcLrsDL-AjWLUOsCigDHtAChvEdd7UeGPAXiOQJ78z9tsNPDVyG7M7DnhsdY3wypuIKSp59iCbGzmg4EimlNZKrZqD575L06ceIG5h9ApTx3eVUX_TEHRfJXYSh98o9NlIxYungB9LJhqjvNI-DC_HLS7e1i1sa3hbwUMjCBnDyu21kT8kMga5pELMkgal1y2uTfpqFoBAhxMWYuLYw_AC3xy0V9QQ10b8w0b6rxhWpnoTCSYmYl5sobuzI5IMlITT7WFzVvquoxT-ETqHVRlzeyopYwv_U6A5ZCxTF7_Oe9WbWnG2cKaiOauOPuX-weqLXtG_Wev2UfPdyOWOXX4BUWq53w)

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

**TODO:** Discuss what happens if a query requests a sub-field which the user has permission to view for some courses but not for others. Should it just be omitted from the query response for the courses where the permission is missing?


### Backtracking Permissions Check

![](/images/authorization-backtracking.png)
[Edit Diagram (Image and this link have to be updated manually after editing)](https://mermaid.live/edit#pako:eNqFVE1rAjEQ_SshpxaUUr0txUsLUtpCW-ltLzEZNegm20lWEfG_d7IfumtW64IkmZ33Zua97IFLq4An3MFvAUbCixZLFFlqGP2E9BbZjwOs9rlAr6XOhfFsKjzsxD4OfIDSYga41RLi6LM1Hoy_ES_QwdXwG-zlxop1Fan-Q33DyaQuKGFTFPnq650twbMsFMMQpEXlnuY4me-ZVqfu9JaSzq2EJ0TqAwJtN3NGxjAs5wPe7oEVxM-0WVjMhNfWXKDH82ifEEd3JAn7rtBZDphp5wjRMQIPbIeyn1f1OGD1anRajY9lf8KBYtb8V1WfDt2zsrKWGLcLk1VuWdppPTpGrB11G9rWIbE2GtO8ScGgLvtEvdUbWEKpIXESR0i6c_cXDF2DNLthXzO-QHMJX6Up6MHrK7ZXvRL3cB4STeS8aUbSouix_IUSkRErknLw13jam3Efaax_x5ftG1X3VNue_FVaLsKMnd5cJAILg27fIJeTfSDCqDP4gGdUvtCKvk2H8FbK_QoySHlCSyVwnfLUHOk9UXg72xvJE48FDHiRK8Kov2M8WYiNg-MfmnC8dg)

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