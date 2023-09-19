# Media service
Stores all media content such as lecture videos, presentation slides, and PDF files and makes it available to the other services.
It allows the lecturer and teaching assistants to upload media content and the students to watch or download it.

A more technical description of the media service and its GraphQL endpoints can be found in our [Github Repository README](https://github.com/IT-REX-Platform/media_service#readme).

## MinIO content Data
The content Data in MinIO is structured as follows:
The MediaTypes are used as the Buckets: AUDIO, VIDEO, IMAGE, PRESENTATION, DOCUMENT, URL

The Object itself uses the UUID of the MediaRecord as the filename in MinIO.

The MediaService itself is responsible for authorization of the minio data. 
We use the MediaRecord to generate the pre-signed URLs, which can only be accessed when you have the right permissions.
The URLs become invalid, either when tampered with or after a preset amount of time (15 minutes). 

## Tracking a user's progress
The media service allows in addition to saving and managing media to track a user's progress on media, e.g. a lecture video has been watched. For this, this service provides a GraphQL endpoint to log a user's progress on a media record. We do not deem it necessary for media content to be revised multiple times compared to other content types (such as [flashcard sets](./flashcard-service.md)). As a result, keeping a log of media content revisions is not implemented in this service. But the service does keep track of when a media record has been worked on last!
The media service informs the [content service](./content-service.md) of a user's progress whenever a media record has been worked on/viewed for the first time.
For more information on user progress tracking in our application we recommend reading our [documentation on user progress](../gamification/userProgress.md).