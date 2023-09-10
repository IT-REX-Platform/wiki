# List of libraries for all the services.
| Service         | Library                              | Version   | Purpose                                                                                          |
|:----------------|:--------------------------------------:|:-----------:|:-------------------------------------------------------------------------------------------------|
| **All Services** | Spring Boot Framework                | 3.0.6     | Simplifies Spring application development, including web applications and microservices.         |
|                 | Spring Dependency Management         | 1.1.0     | Simplifies dependency management in Spring Boot projects.                                        |
|                 | GraphQL Code Generation Plugin       | 5.7.2     | Generates Java code from GraphQL schemas, facilitating GraphQL integration.                      |
|                 | SonarQube Plugin                     | 4.0.0.2929 | Integrates SonarQube code quality analysis into the project.                                     |
|                 | JaCoCo Plugin                        |           | Measures code coverage during testing, aiding in identifying areas needing more testing.         |
|                 | Gits Common Library                  | 0.3.1     | Contains common utilities and functionality for GITS projects.                                   |
|                 | Spring Boot Starter Data JPA         |           | Provides dependencies for using the Java Persistence API (JPA).                                  |
|                 | Spring Boot Starter GraphQL          |           | Includes dependencies for building GraphQL-based APIs.                                           |
|                 | Spring Boot Starter Validation       |           | Includes validation-related dependencies for data validation.                                    |
|                 | Spring Boot Starter Web              |           | Includes dependencies for building web applications.                                             |
|                 | ModelMapper                          | 3.+       | Simplifies object mapping, especially between DTOs and domain objects.                           |
|                 | GraphQL Java Extended Scalars        | 20.0      | Provides extended scalar types for GraphQL in Java.                                              |
|                 | GraphQL Java Extended Validation     | 20.0      | Provides extended validation capabilities for GraphQL.                                           |
|                 | Dapr SDK and Spring Boot Integration | 1.9.0     | Allows working with Dapr and integrating it with Spring Boot.                                    |
|                 | Lombok                               |           | Simplifies Java code with annotations for generating boilerplate code.                           |
|                 | Spring Boot DevTools                 |           | Enhances the development experience with automatic application restarts.                         |
|                 | PostgreSQL JDBC Driver               |           | JDBC driver for PostgreSQL databases, enabling interaction.                                      |
|                 | Spring Boot Configuration Processor  |           | Generates configuration properties metadata for documentation and validation.                    |
|                 | Gits Common Test Library             | 0.1.0     | Contains common utilities and functionality for testing GITS projects.                           |
|                 | JUnit                                | 4.13.1    | Testing framework for unit tests.                                                                |
|                 | Mockito                              | 3.+       | Framework for creating mock objects in unit tests.                                               |
|                 | Hamcrest                             | 2.+       | Framework for writing matchers in test assertions.                                               |
|                 | Testcontainers PostgreSQL            | 1.18.3    | Docker-based PostgreSQL container for integration testing.                                       |
|                 | Testcontainers Junit Jupiter         | 1.18.3    | Integration between Testcontainers and Junit Jupiter for testing.                                |

<div style="text-align: right;">

<small>**All Services** include skill level, quiz service, content, and course service.</small>
</div>

| Service                | Library                              | Version   | Purpose                                                              |
|:-----------------------|:-------------------------------------|:----------|:---------------------------------------------------------------------|
| **Media Service**      | Minio SDK                            | 8.5.2     | Provides a client for interacting with the Minio object storage server. |

| Service                | Library                              | Version   | Purpose                                                              |
|:-----------------------|:-------------------------------------|:----------|:---------------------------------------------------------------------|
| **Content Service**    | H2 Database                          |           | In-memory database for local development and testing.                |

| Service                | Library                              | Version   | Purpose                                                              |
|:-----------------------|:-------------------------------------|:----------|:---------------------------------------------------------------------|
| **Course Service**     | JSR 305                              | 3.0.2     | Removes a Gradle warning about an unknown annotation.                |

| Service                | Library                              | Version   | Purpose                                                              |
|:-----------------------|:-------------------------------------|:----------|:---------------------------------------------------------------------|
| **Reward Service**     | Content Service                      | 0.1.2     | Includes content service for DTOs.                                   |

| Service                                                           | Library                              | Version   | Purpose                                                              |
|:------------------------------------------------------------------|:-------------------------------------|:----------|:---------------------------------------------------------------------|
| **Course Service**, **Reward Service**, **SkillLevel Service**    | Spring Boot Starter Webflux          |           | Provides dependencies for building reactive web applications.         |
