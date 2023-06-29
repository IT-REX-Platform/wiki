# Dapr Service Topic Overview

Here we will describe all dapr topics currently available in the system.
This includes

1. a **description** of the topic,
2. it's **interface** descrpition,
3. the content of the **messages**,
4. services that **publish** to the topic,
5. and services that **subscribe** to the topic.

## Topic: Course Changes

This topic is used by the Course Service to inform Course-dependant Services of changes done to a Course Entity.

### Interface Description

<dl>
<dt>Name</dt>
<dd>course-changes</dd>
<dt>PubSub-Name</dt>
<dd>gits</dd>
</dl>

### Involved Services

<dl>
<dt>Publishers</dt>
<dd><ul>
<li>Course service</li>
</ul></dd>
<dt>Subscribers</dt>
<dd><ul>
<li>User Service</li>
</ul></dd>
</dl>

### Message Content

#### Course ID

<dl>
<dt>Type</dt>
<dd>UUID</dd>
<dt>Description</dt>
<dd>Identifier of a Course Entity</dd>
</dl>

#### Operation

<dl>
<dt>Type</dt>
<dd>Enum</dd>
<dt>Description</dt>
<dd>Describes which type of <b><i>CRUD</i></b> operation was applied to the Course.</dd>
<dt>Available Operations are</dt>
<dd><i>CREATE, DELETE</i></dd>
</dl>

## Topic: Chapter Changes

This topic is used by the Course Service to inform Chapter-dependant Services of changes done to a Chapter Entity.

### Interface Description

<dl>
<dt>Name</dt>
<dd>chapter-changes</dd>
<dt>PubSub-Name</dt>
<dd>gits</dd>
</dl>

### Involved Services

<dl>
<dt>Publishers</dt>
<dd><ul>
<li>Course service</li>
</ul></dd>
<dt>Subscribers</dt>
<dd><ul>
<li>Content Service</li>
</ul></dd>
</dl>

### Message Content

#### Chapter IDs

<dl>
<dt>Type</dt>
<dd>List</dd>
<dt>Element-Type</dt>
<dd>UUID</dd>
<dt>Description</dt>
<dd>A list of Chapter IDs. Each Content is linked to one Chapter ID. Each ID is represented as a UUID.</dd>
</dl>

#### Operation

<dl>
<dt>Type</dt>
<dd>Enum</dd>
<dt>Description</dt>
<dd>Describes which type of <b><i>CRUD</i></b> operation was applied to the Chapter.</dd>
<dt>Available Operations are</dt>
<dd><i>DELETE</i></dd>
</dl>


## Topic: Resource Association

This topic is used to update Course-Resource Associations in the Course Service.

### Interface Description

<dl>
<dt>Name</dt>
<dd>resource-association</dd>
<dt>PubSub-Name</dt>
<dd>gits</dd>
</dl>

### Involved Services

<dl>
<dt>Publishers</dt>
<dd><ul>
<li>Content Service</li>
</ul></dd>
<dt>Subscribers</dt>
<dd><ul>
<li>Course Service</li>
</ul></dd>
</dl>

### Message Content

#### Chapter ID
<dl>
<dt>Type</dt>
<dd>UUID</dd>
<dt>Description</dt>
<dd>Chapter ID of a Chater winthin a Course.</dd>
</dl>


#### Resource IDs

<dl>
<dt>Type</dt>
<dd>List</dd>
<dt>Element-Type</dt>
<dd>UUID</dd>
<dt>Description</dt>
<dd>A list of Resource IDs. A resource can be any Content, Media, Flashcard etc. The IDs are each represented as a UUID.</dd>
</dl>

#### Operation

<dl>
<dt>Type</dt>
<dd>Enum</dd>
<dt>Description</dt>
<dd>Describes which type of <b><i>CRUD</i></b> operation is to be applied to the Course-Resource-Associations.</dd>
<dt>Available Operations are</dt>
<dd><i>CREATE, UPDATE, DELETE</i></dd>
</dl>

## Topic: Resource Update

This topic is used by any service that provides content to the application. This can be e.g., Media, or Flashcards.

### Interface Description

<dl>
<dt>Name</dt>
<dd>resource-update</dd>
<dt>PubSub-Name</dt>
<dd>gits</dd>
</dl>

### Involved Services

<dl>
<dt>Publishers</dt>
<dd><ul>
<li>Media Service</li>
<li>Flashcard Service</li>
</ul></dd>
<dt>Subscribers</dt>
<dd><ul>
<li>Content service</li>
</ul></dd>
</dl>

### Message Content

#### Entity ID

<dl>
<dt>Type</dt>
<dd>UUID</dd>
<dt>Description</dt>
<dd>Identifier of a Resource Entity such as Media or a Flashcard.</dd>
</dl>

#### Content IDs

<dl>
<dt>Type</dt>
<dd>List</dd>
<dt>Element-Type</dt>
<dd>UUID</dd>
<dt>Description</dt>
<dd>A list of Content IDs. A resource can be part of one or multiple Contents. The Content IDs are each represented as a UUID.</dd>
</dl>

#### Operation

<dl>
<dt>Type</dt>
<dd>Enum</dd>
<dt>Description</dt>
<dd>Describes which type of <b><i>CRUD</i></b> operation was applied to the Resource</dd>
<dt>Available Operations are</dt>
<dd><i>CREATE, UPDATE, DELETE</i></dd>
</dl>

## Topic: Content Changes

This topic is used by the Content Service to inform Content-dependant Services of changes done to a Content Entity.

### Interface Description

<dl>
<dt>Name</dt>
<dd>content-changes</dd>
<dt>PubSub-Name</dt>
<dd>gits</dd>
</dl>

### Involved Services

<dl>
<dt>Publishers</dt>
<dd><ul>
<li>Content service</li>
</ul></dd>
<dt>Subscribers</dt>
<dd><ul>
<li>Media Service</li>
<li>Flashcard Service</li>
</ul></dd>
</dl>

### Message Content


#### Content IDs

<dl>
<dt>Type</dt>
<dd>List</dd>
<dt>Element-Type</dt>
<dd>UUID</dd>
<dt>Description</dt>
<dd>A list of Content IDs. A resource can be part of one or multiple Contents. The Content IDs are each represented as a UUID.</dd>
</dl>

#### Operation

<dl>
<dt>Type</dt>
<dd>Enum</dd>
<dt>Description</dt>
<dd>Describes which type of <b><i>CRUD</i></b> operation was applied to the Content.</dd>
<dt>Available Operations are</dt>
<dd><i>UPDATE, DELETE</i></dd>
</dl>
