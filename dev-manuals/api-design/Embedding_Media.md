# Assignment Text Formatting & Embedding Media

Texts in assignments, e.g. text on flashcards or quiz text should be able to be formatted e.g. with bold text. Media uploaded in the system should also be able to be included in the text of assignments.

To facilitate this, Markdown with a custom syntax on top is used, which is to be referred to as **MediaMarkdown**.

## Custom Syntax
The following custom syntax can be used in the MediaMarkdown text to include a media record:

```
![UUID_of_media_record]

For example:
![835c9266-f231-422a-92f5-ce67999eacdf]
```

# API Design

In the GraphQL API provided to the frontend, the `MediaMarkdown` type is used to represent MediaMarkdown text. The type has the following fields:

```graphql
type MediaMarkdown {
    """
    The raw MediaMarkdown text.
    """
    text: String!
    """
    Ids of MediaRecords referenced in the MediaMarkdown text.
    """
    mediaRecordIds: [UUID!]!
    """
    Resolved MediaRecords referenced in the MediaMarkdown text.
    A MediaRecord might be NULL if the referenced MediaRecord no longer exists. 
    """
    mediaRecords: [MediaRecord]!
}
```

- The `mediaRecordIds` field shall be filled by the service providing the MediaMarkdown data. It shall be filled with the IDs of the MediaRecords referenced in the MediaMarkdown text in order of appearance. Utility code to filter MediaMarkdown text for MediaRecord IDs is provided in the `gits-common` repo. For performance reasons, it is recommended to search for the IDs in the text only once and store this in a database.

- The `mediaRecords` field is automatically resolved by the gateway using the IDs provided in the `mediaRecordIds` field and need not be provided by the service providing the MediaMarkdown text.