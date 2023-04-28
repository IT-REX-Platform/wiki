# Repository structure

For strucuturing our microservices we had basically three options
- Having one large repository for frontend and all backend services (Mono repository)
- Having separate repositories for both frontend and each microservice
- Having one parent repository and sub-repositories for both frontend and each microservice

We decided to use separate repositores for the frontend and each microservice for the following reasons:

- Microservices are supposed to be independent from each other for the most part. Separating the repositories reflects the idea of microservices better.
- The commit history of a single large repository is very crowded and commits of different services will be intertwined
- Frontend developers or developers on a single micro service do not need to check our the whole project
- No developer has sufficient experience with the usage of sub repository, which would add another layer of complexity

## Challanges and solutions of having different repositories

- Shared code: If there is any shared code between microservices, repositories will have other repositories as dependencies. This is possible with gradle. Shared code should hopefully be minimal.
- Sharing the graphQL schema: The frontend and the API gateway require the same schema file. Manually copying it when changed would be cumbersome. We will setup a GitHub action that will automatically create a pull request in the frontend repository, if the backend make changes in the schema file.
