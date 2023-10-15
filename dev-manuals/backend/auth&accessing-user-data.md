# Authentication, Authorization & Accessing Current User Data From Services

## Authentication

When implementing a service, don't worry about authentication. Authentication is completely done by the graphql gateway.
A user JWT token passed by the client in the form of an HTTP "authorization" header is validated and access to GraphQL
endpoints is by default only granted when the token is valid.

If you want some field of your GraphQL schema to be accessible completely without any authentication, add the
`@skipAuth` directive to it. This will skip the authentication check for this field.

## Authorization

Not implemented yet.

## Accessing User Data From Services

The user data originally stored in the JWT token (user id, name, roles etc.) is extracted by the gateway and sent to the
services in the form of a JSON string in the HTTP header "CurrentUser".

Services can use the static `RequestHeaderUserProcessor.process()` method (part of the *gits-common* library) in a
`WebGraphQlInterceptor` to deserialize the JSON into a `LoggedInUser` object which is automatically injected into the
service's graphql context under the key `currentUser`.

Example WebGraphQlInterceptor which intercepts requests to the service and converts the headers to a `LoggedInUser`
object injected into the context:

```java
@Configuration
public class RequestHeaderUserInterceptor implements WebGraphQlInterceptor {
    @NotNull
    @Override
    @SneakyThrows
    public Mono<WebGraphQlResponse> intercept(@NotNull WebGraphQlRequest request, @NotNull Chain chain) {
        RequestHeaderUserProcessor.process(request);
        return chain.next(request);
    }
}
```

You can then use this context data in your `Controller` classes like in the following example:
```java
@QueryMapping
public UserProgressData userProgressData(MediaContent content, @ContextValue LoggedInUser currentUser) {
    return userProgressDataService.getUserProgressData(currentUser.getId(), content.getId());
}
```
As you can see, the value is automatically injected into the `currentUser` parameter.

**The current user data can then be used e.g. to protect certain data from being accessed by a user missing the required role.**