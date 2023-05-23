# Media service

Stores all media content such as lecture videos, presentation slides and pdfs and makes it available to the other services.
It allows the lecturer and teaching assistants to upload media content and the students to watch or download it.

# MinIO content Data

The content Data in MinIO is structured as follows:
The MediaTypes are used as the Buckets: AUDIO, VIDEO, IMAGE, PRESENTATION, DOCUMENT, URL

The Object itself uses the name of the file as the filename in MinIO, alternatively the UUID of the MediaRecord can be used.

