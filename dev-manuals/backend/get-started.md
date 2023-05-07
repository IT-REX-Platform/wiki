# Get Started

This will contain a description on how get started to work as a backend dev.
If you don't want to develop and only run the service, there is docker compose file provided.

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

We recommend using PGAdmin locally to manage the databases. You can download it [here](https://www.pgadmin.org) in case you didn't already install it together with PostgresSQL.

Alternatively, you can use the database in a Docker container. A guide on how to do this can be found [here](https://www.baeldung.com/ops/postgresql-docker-setup). We will provide a Docker Compose file for this in each microservice.

For Media Storage we use MinIO. How to set it up is explained here: [here](https://min.io/docs/minio/container/index.html)


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

We recommend to run the databases in a Docker container, as you can easily add new instances for different microservices. 
The recommended way to do so is to use Docker Desktop. 

Use the search bar at the top to search for "postgres", select images. The first result should be the correct image.
Press pull to download the image to your machine.

Go to "Images" press the run button next on the postgres image.
Click on optional settings enter the name and port of the container. 

* Under Volumes select a folder to persist the data, for when the container stops running.
* Under environment variables enter POSTGRES_USER as the variable and a username as the value.
* Add another environment variable and enter POSTGRES_PASSWORD as the variable and a password as the value.
* Add a third variable and enter POSTGRES_DB as the variable and a the database name as the value. 
* This will automatically create a new Database in the docker container.

Click run to start the container.

See here if you prefer to use the command line: [here](https://www.baeldung.com/ops/postgresql-docker-setup).

### Database configuration

If you set the database up as described in "Run the database", you only need to add the previously defined variables to the configuration.
Enter the database configuration in `src/main/resources/application.properties`. You need to enter the database URL, username and password.

### Docker compose configuration
In the docker-compose.yml change the environment variables of the database service, to match the ones in the application.properties.

Change the expose and ports of both apps to the ones in application properties. The values in expose must match the first part of the ports values.

For the database port only change the first value. It should look like this "XXXX:5432",
where XXXX is the port number of the microservice database.

Change "templatedatabase" in the SPRING_DATASOURCE_URL to match the POSTGRES_DB value.

### Run microservice without Dapr

For the usual developement process.
Just run the main method of the spring application class with IDEA or run the command `gradle bootRun` in the command line.

### Run the Microservice
If you want to test the microservice, you can use docker compose.

To build and start the microservice including the database use:

docker compose up -d

More info [here](https://docs.docker.com/engine/reference/commandline/compose_up/)

To stop the containers and removes containers, networks, volumes, and images created by up.

docker compose down

More info [here](https://docs.docker.com/engine/reference/commandline/compose_down/)

### Run scripts for dapr

There exist run scripts for windows (dapr-run.cmd) and bash (dapr-run.sh) if you want to run the service outside docker but with dapr.
