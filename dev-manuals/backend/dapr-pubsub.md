# PubSub Messaging Using Dapr

The publish-subscribe pattern can be used by services to publish "fire-and-forget" events (i.e. where there exists no "response" or the publisher does not care about it). Other services which care about the occurance of this event can subscribe to it to be raised when the event is published.

## Technologies

Dapr, which is used as a middleware between the services, supports the pubsub pattern. Redis will be used by dapr as a store for the messages.

The dapr java-sdk and dapr java-sdk springboot integration provide an easy way to implement dapr pubsub in our services. 

## Basic Usage

Dapr allows categorization of events using "topics". Messages can be published to a specific topic and subscribers can subscribe to a topic to be executed when a new message is published to that topic.

### Subscribe to a Topic

Create a class which is annotated with `@RestController`. Like a regular rest controller, it will contain methods which map to different endpoints. (These rest endpoints will be invoked by dapr automatically when a new message for the event is published)

Create a method annotated with `@PostMapping(path = "/path-of-your-choice")` and `@Topic(name = "topic name of your choice", pubsubName = "gits")`. The `name` argument tells dapr what topic you want this endpoint to be subscribed to. `pubsubName` must always be `gits`.

Arguments of the method are the headers of the request and the body, for which a `CloudEvent` can be used to easily serialize and deserialize Java objects to transmit them via the message bus (not just Strings as in the example).

Example:

```java
@RestController
public class PubsubSubscriberController {
    @Topic(name = "resource-creation", pubsubName = "gits")
    @PostMapping(path = "/media-service-pubsub")
    public Mono<Void> handleMessage(@RequestBody(required = false) CloudEvent<String> cloudEvent, @RequestHeader Map<String, String> headers) {
        return Mono.fromRunnable(() -> {
            System.out.println("subscriber got message: " + cloudEvent.getData());
        });
    }
}
```

### Publish to a Topic

Create a `DaprClient` object to publish messages to the bus:

```java
try(DaprClient client = new DaprClientBuilder().build()) {
    client.publishEvent("gits", "resource-creation", "Hello World!").block();
} catch (Exception e) {
    throw new RuntimeException(e);
}
```