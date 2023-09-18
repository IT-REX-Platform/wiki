# Course service

The core responsibility of the course service is to manage course and chapter structures. In the course-service courses and chapters can be created, modified and deleted. Each course can have one or multiple chapters, which can also be queried individually.
Chapters can be further populated with content and structuring elements. These are provided by the [content service](./content-service.md). The course service does not contain any information on what content or structuring elements are present in each chapter. This information is solely located on the content service.
Access to courses and underlying content is restricted by course memberships. Course memberships are not handled in this service but in a separate service, the [user service](./user-service.md).
Authorization of GraphQL endpoints for the course service is handled by our [GraphQL Gateway](./gateway-service.md).

A more technical description of the course service and its Endpoints can be found in our [Github Repository README](https://github.com/IT-REX-Platform/course_service#readme)
