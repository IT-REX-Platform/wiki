# Dapr Service Topic Overview
Here we will describe all dapr topics currently available in the system.
This includes
1. a **description** of the topic,
2. it's **interface** descrpition, 
3. the content of the **messages**,
4. services that **publish** to the topic,
5. and services that **subscribe** to the topic.

## Topic: Resource Association
This topic is used to update Course-Resource Associations in the Course Service.

### Interface Description
Name
: resource-association

PubSub-Name
: gits

### Involved Services:

Publishers
: - Content Service

Subscribers
: - Course Service

### Message Content:

#### Chapter ID
Type
: UUID

Description
: Chapter ID of a Chater winthin a Course.
#### Resource IDs
Type
: List

Element-Type
: UUID

Description
: A list of Resource IDs. A resource can be any Content, Media, Flashcard etc. The IDs are each represented as a UUID.
#### Operation
Type
: Enum

Description
: Describes wish type of CRUD operation is to be applied to the Course-Resource-Associations. 

Available Operations are
: ***CREATE, UPDATE, DELETE***

## Topic: Content changes
This topic is used by any service that provides content to the application. This can be e.g., Media, or Flashcards.
### Interface Description
Name
: resource-update

PubSub-Name
: gits

### Involved Services:
publishers
: - Media Service
  - Flashcard Service

Subscribers
: - Content service

### Message Content:

#### Entity ID
Type
: UUID

Description
: Identifier of a Resource Entity such as Media or a Flashcard.
#### Content IDs
Type
: List

Element-Type
: UUID

Description
: A list of Content IDs. A resource can be part of one or multiple Contents. The Content IDs are each represented as a UUID.
#### Operation
Type
: Enum

Description
: Describes which type of **CRUD** operation is to be applied to the Course-Resource-Associations. 

Available Operations are
: ***CREATE, UPDATE, DELETE***