# Unified GraphQL API

While the backend is split up into many microservices with their own internal APIs, a unified GraphQL API should be provided so the frontend of the application and other potential software can interact with the backend.

To facilitate this, [GraphQL Mesh](https://the-guild.dev/graphql/mesh) is used in an API gateway which splits up a GraphQL query into subqueries and sends them to the different microservices. It then merges the responses of the different microservices back together to respond to the query it received.

## Unified GraphQL schema

The unified schema file of the system (WIP) can be found in the [API-Gateway repository](https://github.com/IT-REX-Platform/graphql_gateway). 

## GraphQL Mesh Concept

Imagine a query like this (just an example, does not necessarily have the same structure as in the real life system):

```graphql
courses {
    contents {
        name,
        type
    }
}
```



The courses data lives in the CourseService, the content data lives in the ContentService

1. The GraphlQL Mesh Gateway would split this query up into a query to the course service, which would return for each course the ids of the contents which are part of this course.
2. Then, the gateway would send a query to the ContentService, passing the content ids it collected in the first step and requesting back the data for each of them.
3. Lastly, the gateway would construct the response to the graphql query by merging the two responses it got from the two services (replacing the content ids it got from the course service with the actual content data it got from the ContentService).

**Main Takeaways**
* Services need to provide GraphQL endpoints which allow the querying of items based on ids.
* Batching needs to be performed. This means (for the above example) that instead of sending one request to the MediaService per course to get its media records, instead the API gateway batches all courses' media records' ids together and only sends one single query to the MediaService which then returns the media records the gateway needs at once.
* To perform batching, the endpoints for querying items based on id need to support querying multiple items in a single request, i.e. the endpoints shouldn't just accept a single id and return a single item, but instead accept a list of ids and return a list of items

## Further Information/Guides For GraphQL Mesh

[GraphQL Mesh Basics](https://the-guild.dev/graphql/mesh/docs/getting-started/your-first-mesh-gateway)
[Combining Multiple API Endpoints with GraphQL Mesh](https://the-guild.dev/graphql/mesh/docs/getting-started/combine-multiple-sources)
[Batching with GraphQL Mesh](https://the-guild.dev/graphql/mesh/docs/guides/batching)