# Get Started

This will contain a description on how get started to work as a backend dev.

## Prerequisites

### Java

We use Java 17. You can download the JDK [here](https://www.oracle.com/java/technologies/downloads/#java17).

### Git

We use Git as version control system. You can download it [here](https://git-scm.com/downloads). To be able to push and pull from GitHub, you will need to set up an SSH key. You can find a guide [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

### IDE

We use IntelliJ IDEA as IDE. You can download it [here](https://www.jetbrains.com/idea/download/). As a student you can get a free license for the Ultimate Edition [here](https://www.jetbrains.com/community/education/#students).

### Gradle

We use Gradle as build tool. You can download it [here](https://gradle.org/install/).

### Docker

We use Docker to run our microservices and the database. You can download it [here](https://www.docker.com/products/docker-desktop).

### Database

We use PostgreSQL as database. You can download it [here](https://www.postgresql.org/download/) to run it locally. 

Alternatively, you can use the database in a Docker container. A guide on how to do this can be found [here](https://www.baeldung.com/ops/postgresql-docker-setup). We will provide a Docker Compose file for this in each microservice.

### Dapr

We use Dapr as runtime for our microservices.
To run locally, you can download it [here](https://docs.dapr.io/getting-started/install-dapr-cli/).

We will however use Docker to run Dapr and provide a Docker Compose file for this in each microservice.

## Setup

### Clone the repository

To clone the repository,  you can use IntelliJ IDEA to clone the repository via `File > New > Project from Version Control...`.

Alternatively, you can use the command line:

```bash
git clone {repository-url}
```

Then you can open the project in IntelliJ IDEA via `File > Open...`.

### Run the database

Run the database locally or in a Docker container.

*TODO: Describe how to run the database*

*TODO: Docker Compose file*

### Database configuration

*TODO: Describe how to configure the database*

Enter the database configuration in `src/main/resources/application.properties`. You need to enter the database URL, username and password. 

### Run Dapr

*TODO: Describe how to run Dapr with IDEA*

*TODO: Provide script to run Dapr with Docker*

### Run microservice without Dapr

Just run the main method of the spring application class with IDEA or run the command `gradle bootRun` in the command line.
