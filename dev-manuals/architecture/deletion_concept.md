# Deletion Concept

This document describes how a deletion of parent resource propagates to its children, for example, if a chapter is deleted,
all its content should be deleted as well. The challenge is that the content is stored in a different microservice than
the chapters.

## Deletion events

- We use dapr pub sub for event based notifications regarding deletion of resources.
- There exists one topic for all deletion events of all resource types.
- If a resource is deleted, an event is published to this topic, containing the id of the deleted resource and its type.
- Other microservices can subscribe to this topic and react to the deletion of a resource of a specific type.
- When such an event is received by a microservice, it can delete or change all linked resources of the given type.
- For example, if a chapter is deleted, the content microservice can delete all content of this chapter, when it receives
  the deletion event.

## Dapr PubSub

The deletion event should be published in a dapr pubsub topic named `resource-deletion` in the dapr pubsub component named `gits`.

The event should pass an object with the following structure:

```json
{
  "id": "<uuid of the resource object>",
  "type": "<type of the resource object, e.g. course, chapter, media record, etc.>"
}
```

