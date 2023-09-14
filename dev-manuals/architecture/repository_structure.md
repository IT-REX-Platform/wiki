# Repository structure

For structuring our microservices we had three options
- Having one large repository for front-end and all back-end services (Mono repository)
- Having separate repositories for both front-end and each microservice
- Having one parent repository and sub-repositories for both frontend and each microservice

Decision: 
- **Separate repositories** for developement
- **Parent repository** with sub-modules to enable easy startup of all services with Docker.
  - [GITS backend](https://github.com/IT-REX-Platform/gits_backend) 

We decided to use separate repositories for the front-end and each microservice for the following reasons:

- Microservices are supposed to be independent of each other for the most part. Separating the repositories reflects the idea of microservices better.
- The commit history of a single large repository is very crowded and commits of different services will be intertwined
- Frontend developers or developers on a single microservice do not need to check the whole project
- To create a new microservice you can simply fork the template repository
- No developer has sufficient experience with the usage of sub repository, which would add another layer of complexity

## Challenges and solutions of having different repositories

- Shared code: If there is any shared code between microservices, repositories will have other repositories as dependencies. This is possible with gradle. Shared code should hopefully be minimal. (see below)

## Shared code

- [git-common](https://github.com/IT-REX-Platform/gits-common) contains utility classes that are used in multiple microservices.
- [git-common-test](https://github.com/IT-REX-Platform/gits-common-test), similarly, contains utility classes but for testing.
