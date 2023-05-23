# Media service

Stores all media content such as lecture videos, presentation slides and pdfs and makes it available to the other services.
It allows the lecturer and teaching assistants to upload media content and the students to watch or download it.

# MinIO content Data

The content Data in MinIO is structured as follows:
The MediaTypes are used as the Buckets: AUDIO, VIDEO, IMAGE, PRESENTATION, DOCUMENT, URL

The Object itself uses the UUID of the MediaRecord as the filename in MinIO.

The MediaService itself is responsible for authorization of the minio data. 
We use the MediaRecord to generate the pre-signed urls, which can only be accessed when you have the right permissions.
The urls become invalid, either when tampered with or after a preset amount of time (15 minutes). 

