# ResourceMarkdown (Embedding Resources in Text)

Texts in assignments, e.g. text on flashcards or quiz text should be able to be formatted e.g. with bold text. Media uploaded in the system should also be able to be included in the text of assignments.

To facilitate this, Markdown with a custom syntax on top is used, which is to be referred to as **ResourceMarkdown**.

## Custom Syntax

### Resource Link

The following custom syntax can be used in the ResourceMarkdown text to link to/embed a resource:

```
[[<resource_type>/<UUID_of_media_record>]]

For example:
[[media/835c9266-f231-422a-92f5-ce67999eacdf]]
```

Where
* `<resource_type>` is the type of the resource, e.g. `media`. This is case-sensitive. Only [supported resource types](#currently-supported-resource-types) can be used here.
* `<UUID_of_media_record>` is the UUID of the resource to link/embed

Valid syntax of a resource link is defined by the following regular expression:

```regex
\[\[[a-zA-Z]+/[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\]\]
```

Explanation:
* `\[\[` matches the opening `[[`
* `[a-zA-Z]+` matches the resource type name, which may only contain letters
* `\/` matches the `/` between the resource type name and the resource UUID
* `[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}` matches a UUID
* `\]\]` matches the closing `]]`

## Currently Supported Resource Types
Currently the only supported resource type is `media`. This means that only media records can be linked/embedded in ResourceMarkdown text.

## GraphQL API Design

In the GraphQL API provided by the backend, the `ResourceMarkdown` type is used to represent ResourceMarkdown text. The type has the following fields:

```graphql
type ResourceMarkdown {
    """
    The raw ResourceMarkdown text.
    """
    text: String!
    """
    Ids of MediaRecords referenced in the ResourceMarkdown text in order.
    """
    referencedMediaRecordIds: [UUID!]!
    """
    Resolved MediaRecords referenced in the ResourceMarkdown text in order.
    A MediaRecord might be NULL if the referenced MediaRecord no longer exists. 
    """
    referencedMediaRecords: [MediaRecord]!
}
```

- The `referencedMediaRecordIds` field shall be filled by the service providing the ResourceMarkdown data. It shall be filled with the IDs of the MediaRecords referenced in the ResourceMarkdown text in order of appearance. Utility code to filter ResourceMarkdown text for MediaRecord IDs is provided in the `gits-common` repo. For performance reasons, it is recommended to search for the IDs in the text only once and store this in a database.

- The `referencedMediaRecords` field is automatically resolved by the gateway using the IDs provided in the `referencedMediaRecordIds` field and need not be populated by the service providing the ResourceMarkdown text.

## Places of Usage of ResourceMarkdown in GITS

**Please expand this list when you use ResourceMarkdown in a new place in the system**

Mark with *(planned)* when ResourceMarkdown is not implemented for this part of the system but implementation is planned

- Flashcards (planned)
- Quizzes (planned)
- Hints (planned)
- Feedback (planned)