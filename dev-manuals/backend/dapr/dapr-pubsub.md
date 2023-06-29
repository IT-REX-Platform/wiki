# PubSub Messaging Using Dapr

The publish-subscribe pattern can be used by services to publish "fire-and-forget" events (i.e. where there exists no "response" or the publisher does not care about it). Other services which care about the occurance of this event can subscribe to it to be raised when the event is published.

## Technologies

Dapr, which is used as a middleware between the services, supports the pubsub pattern. Redis will be used by dapr as a store for the messages.

The dapr java-sdk and dapr java-sdk springboot integration provide an easy way to implement dapr pubsub in our services. 

## Basic Usage

Dapr allows categorization of events using "topics". Messages can be published to a specific topic and subscribers can subscribe to a topic to be executed when a new message is published to that topic.

### Include Necessary Libraries
Include the dapr sdk libraries in `build.gradle`
```java
implementation 'io.dapr:dapr-sdk:1.9.0' // Dapr's core SDK with all features, except Actors.
implementation 'io.dapr:dapr-sdk-springboot:1.9.0' // Dapr's SDK integration with SpringBoot
```

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
## Troubleshooting

When developing with Dapr different issues and problems may arise. We aim to cover the most commen errors that might occure during development and offer possible solutions to these problems. 

### My Dapr Messages are not getting delivered

#### Error:
```
2023-06-27 14:38:44 time="2023-06-27T12:38:44.638977635Z" level=error msg="error retrieving pending Redis messages: NOGROUP No such key 'resource-association' or consumer group 'course_service'" app_id=course_service component="gits (pubsub.redis/v1)" instance=7446a5cc5b76 scope=dapr.contrib type=log ver=1.11.1
2023-06-27 14:38:59 time="2023-06-27T12:38:59.6393732Z" level=error msg="error retrieving pending Redis messages: NOGROUP No such key 'resource-association' or consumer group 'course_service'" app_id=course_service component="gits (pubsub.redis/v1)" instance=7446a5cc5b76 scope=dapr.contrib type=log ver=1.11.1
2023-06-27 14:39:14 time="2023-06-27T12:39:14.639572005Z" level=error msg="error retrieving pending Redis messages: NOGROUP No such key 'resource-association' or consumer group 'course_service'" app_id=course_service component="gits (pubsub.redis/v1)" instance=7446a5cc5b76 scope=dapr.contrib type=log ver=1.11.1
```
This Error occures when multiple redis-instances are present. This could be caused by running each docker compose file of the services separatly.

#### Solution
Make sure all services directories are next to eachother and build all services at the same time.
An example would be this console snippet:
```
docker compose -f ./media_service/docker-compose.yml -f ./course_service/docker-compose.yml -f ./content_service/docker-compose.yml --project-name gits up -d
```
This snippet builds all necessary containers for the media service, course service, and content service, by execution their respective docker compose files after eachother. During this building process the building engine will notice multiple definitions of the same redis container and will only build the container once.
In the gits-backend repository a 'bash/sh'-file can be found containing a build for the whole backend.


### My Integration Test fail due to Dapr Exceptions

#### Error
```java
io.dapr.exceptions.DaprException: UNAVAILABLE: io exception
	at io.dapr.exceptions.DaprException.propagate(DaprException.java:194) ~[dapr-sdk-1.9.0.jar:na]
	at io.dapr.client.DaprClientGrpc$2.onError(DaprClientGrpc.java:1058) ~[dapr-sdk-1.9.0.jar:na]
	at io.grpc.stub.ClientCalls$StreamObserverToCallListenerAdapter.onClose(ClientCalls.java:479) ~[grpc-stub-1.42.1.jar:1.42.1]
	at io.grpc.internal.DelayedClientCall$DelayedListener$3.run(DelayedClientCall.java:463) ~[grpc-core-1.42.1.jar:1.42.1]
	at io.grpc.internal.DelayedClientCall$DelayedListener.delayOrExecute(DelayedClientCall.java:427) ~[grpc-core-1.42.1.jar:1.42.1]
	at io.grpc.internal.DelayedClientCall$DelayedListener.onClose(DelayedClientCall.java:460) ~[grpc-core-1.42.1.jar:1.42.1]
	at io.grpc.internal.ClientCallImpl.closeObserver(ClientCallImpl.java:562) ~[grpc-core-1.42.1.jar:1.42.1]
	at io.grpc.internal.ClientCallImpl.access$300(ClientCallImpl.java:70) ~[grpc-core-1.42.1.jar:1.42.1]
	at io.grpc.internal.ClientCallImpl$ClientStreamListenerImpl$1StreamClosed.runInternal(ClientCallImpl.java:743) ~[grpc-core-1.42.1.jar:1.42.1]
	at io.grpc.internal.ClientCallImpl$ClientStreamListenerImpl$1StreamClosed.runInContext(ClientCallImpl.java:722) ~[grpc-core-1.42.1.jar:1.42.1]
	at io.grpc.internal.ContextRunnable.run(ContextRunnable.java:37) ~[grpc-core-1.42.1.jar:1.42.1]
	at io.grpc.internal.SerializingExecutor.run(SerializingExecutor.java:133) ~[grpc-core-1.42.1.jar:1.42.1]
	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1144) ~[na:na]
	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:642) ~[na:na]
	at java.base/java.lang.Thread.run(Thread.java:1589) ~[na:na]
```
#### Solution 1
This Error can occures while running the API Tests without Mocking the Dapr client. As the Dapr client can not be Mocked directly, we have to Mock the Client via a Configuration. We will need two configurations for this. A Test and a Production Configuration. Note: make sure the Dapr Class does not contain a '@Component' or similar Annotations as otherwise the Configuration gets ignored.
Production Configuration: 
```java
@Configuration
public class TopicPublisherConfiguration {
    
    @Bean
    public TopicPublisher getTopicPublisher() {
        return new TopicPublisher();
    }
}
```

Test Configuration:
```java
@TestConfiguration
public class MockTopicPublisherConfiguration {

    @Primary
    @Bean
    public TopicPublisher getTestTopicPublisher() {
        TopicPublisher mockPublisher = Mockito.mock(TopicPublisher.class);
        Mockito.doNothing().when(mockPublisher).notifyChange(Mockito.any(ContentEntity.class), Mockito.any());
        return mockPublisher;
    }
}
```

#### Solution 2
If the above Error comes with these additional errors:
```java
Caused by: java.util.concurrent.ExecutionException: io.grpc.StatusRuntimeException: UNAVAILABLE: io exception

Caused by: io.grpc.StatusRuntimeException: UNAVAILABLE: io exception

Caused by: io.grpc.netty.shaded.io.netty.channel.AbstractChannel$AnnotatedConnectException: Connection refused: no further information: /127.0.0.1:50001

Caused by: java.net.ConnectException: Connection refused: no further information
```
Then It could be that the dapr-sidecar container for the service is not running or missing. To fix this a simple rebuild should suffice.