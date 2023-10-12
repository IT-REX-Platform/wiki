# User service
This service is dedicated to handling all use cases related to user data.
This service acts internally (in our system) as a graphQL endpoint extension for our [Keycloak application](../authentication/keycloak.md) that stores and manages all registered users in a system. This is necessary as Keycloak only supports RESTful request messages. The [gateway service](./gateway-service.md) queries user data over this endpoint.

System-wide permissions (e.g. ability to create new courses) are not handled by this service. These are instead managed by [Keycloak](../authentication/keycloak.md).

A more technical description of the user service and its GraphQL endpoints can be found in our [Github Repository README](https://github.com/IT-REX-Platform/user_service#readme).
