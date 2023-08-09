# Assignment Text Formatting & Embedding Media

Texts in assignments, e.g. text on flashcards or quiz text should be able to be formatted e.g. with bold text. Media uploaded in the system should also be able to be included in the text of assignments.

To facilitate this, Markdown with a custom syntax on top is used, which is to be referred to as **ResourceMarkdown**.

## Custom Syntax

In the current stage of implementation, ResourceMarkdown only supports linking/embedding of MediaRecords.

The following custom syntax can be used in the ResourceMarkdown text to include a media record:

```
[[media/<UUID_of_media_record>]]

For example:
[[media/835c9266-f231-422a-92f5-ce67999eacdf]]
```

## API Design

In the GraphQL API provided to the frontend, the `ResourceMarkdown` type is used to represent ResourceMarkdown text. The type has the following fields:

```graphql
type ResourceMarkdown {
    """
    The raw ResourceMarkdown text.
    """
    text: String!
    """
    Ids of MediaRecords referenced in the ResourceMarkdown text in order.
    """
    mediaRecordIds: [UUID!]!
    """
    Resolved MediaRecords referenced in the ResourceMarkdown text in order.
    A MediaRecord might be NULL if the referenced MediaRecord no longer exists. 
    """
    mediaRecords: [MediaRecord]!
}
```

- The `mediaRecordIds` field shall be filled by the service providing the ResourceMarkdown data. It shall be filled with the IDs of the MediaRecords referenced in the ResourceMarkdown text in order of appearance. Utility code to filter ResourceMarkdown text for MediaRecord IDs is provided in the `gits-common` repo. For performance reasons, it is recommended to search for the IDs in the text only once and store this in a database.

- The `mediaRecords` field is automatically resolved by the gateway using the IDs provided in the `mediaRecordIds` field and need not be provided by the service providing the ResourceMarkdown text.

## Places of Usage in the System

**Please expand this list when you use ResourceMarkdown in a new place in the system**

Mark with *(planned)* when ResourceMarkdown is not implemented for this part of the system but implementation is planned

- Flashcards (planned)
- Quizzes (planned)
- Hints (planned)
- Feedback (planned)