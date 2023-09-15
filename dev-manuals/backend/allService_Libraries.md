# List of libraries for all the services.
| Service          |               Library                |  Version   | Purpose                                                                                  | Library Link                                                                                                                                               |
|:-----------------|:------------------------------------:|:----------:|:-----------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **All Services** |        Spring Boot Framework         |   3.0.6    | Simplifies Spring application development, including web applications and microservices. | [Spring Boot](https://github.com/spring-projects/spring-framework/wiki/Spring-Framework-Versions)                                                          |
|                  |     Spring Dependency Management     |   1.1.0    | Simplifies dependency management in Spring Boot projects.                                | [Spring Dependency Management](https://start.spring.io)                                                                                                    |
|                  |    GraphQL Code Generation Plugin    |   5.7.2    | Generates Java code from GraphQL schemas, facilitating GraphQL integration.              | [GraphQL Code Generation](https://the-guild.dev/graphql/codegen/plugins/java/java)                                                                         |
|                  |           SonarQube Plugin           | 4.0.0.2929 | Integrates SonarQube code quality analysis into the project.                             | [SonarQube](https://docs.sonarsource.com/sonarqube/9.9/setup-and-upgrade/install-a-plugin/)                                                                |
|                  |            JaCoCo Plugin             |            | Measures code coverage during testing, aiding in identifying areas needing more testing. | [JaCoCo](https://docs.gradle.org/current/userguide/jacoco_plugin.html)                                                                                     |
|                  |         Gits Common Library          |   0.3.1    | Contains common utilities and functionality for GITS projects.                           | -                                                                                                                                                          |
|                  |     Spring Boot Starter Data JPA     |            | Provides dependencies for using the Java Persistence API (JPA).                          | [Spring Boot Starter Data JPA](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-data-jpa)                                   |
|                  |     Spring Boot Starter GraphQL      |            | Includes dependencies for building GraphQL-based APIs.                                   | [Spring Boot Starter GraphQL ](https://github.com/spring-projects/spring-graphql/wiki/Spring-for-GraphQL-Versions)                                         |
|                  |    Spring Boot Starter Validation    |            | Includes validation-related dependencies for data validation.                            | [Spring Boot Starter Validation](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-validation)                               |
|                  |       Spring Boot Starter Web        |            | Includes dependencies for building web applications.                                     | [Spring Boot Starter Web](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-web)                                             |
|                  |             ModelMapper              |    3.+     | Simplifies object mapping, especially between DTOs and domain objects.                   | [ModelMapper](https://github.com/modelmapper/modelmapper)  [ModelMapperGettingStrated](https://modelmapper.org/getting-started/)                           |
|                  |    GraphQL Java Extended Scalars     |    20.0    | Provides extended scalar types for GraphQL in Java.                                      | [GraphQL Java Extended Scalars](https://www.graphql-java.com/documentation/scalars/)                                                                       |
|                  |   GraphQL Java Extended Validation   |    20.0    | Provides extended validation capabilities for GraphQL.                                   | [GraphQL Java Extended Validation](https://mvnrepository.com/artifact/com.graphql-java/graphql-java-extended-validation)                                   |
|                  | Dapr SDK and Spring Boot Integration |   1.9.0    | Allows working with Dapr and integrating it with Spring Boot.                            | [Dapr SDK and Spring Boot Integration](https://docs.dapr.io/developing-applications/sdks/java/)                                                            |
|                  |                Lombok                |            | Simplifies Java code with annotations for generating boilerplate code.                   | [Lombok](https://projectlombok.org)                                                                                                                        |
|                  |         Spring Boot DevTools         |            | Enhances the development experience with automatic application restarts.                 | [Spring Boot DevTools ](https://docs.spring.io/spring-boot/docs/1.5.16.RELEASE/reference/html/using-boot-devtools.html)                                    |
|                  |        PostgreSQL JDBC Driver        |            | JDBC driver for PostgreSQL databases, enabling interaction.                              | [PostgreSQL JDBC Driver](https://jdbc.postgresql.org)                                                                                                      |
|                  | Spring Boot Configuration Processor  |            | Generates configuration properties metadata for documentation and validation.            | [Spring Boot Configuration Processor](https://docs.spring.io/spring-boot/docs/current/reference/html/features.html#features.spring-configuration-metadata) |
|                  |       Gits Common Test Library       |   0.1.0    | Contains common utilities and functionality for testing GITS projects.                   | -                                                                                                                                                          |
|                  |                JUnit                 |   4.13.1   | Testing framework for unit tests.                                                        | [JUnit](https://junit.org/junit5/)                                                                                                                         |
|                  |               Mockito                |    3.+     | Framework for creating mock objects in unit tests.                                       | [Mockito ](https://site.mockito.org)                                                                                                                       |
|                  |               Hamcrest               |    2.+     | Framework for writing matchers in test assertions.                                       | [Hamcrest ](https://hamcrest.org/JavaHamcrest/)                                                                                                            |
|                  |      Testcontainers PostgreSQL       |   1.18.3   | Docker-based PostgreSQL container for integration testing.                               | [Testcontainers PostgreSQL ](https://testcontainers.com/guides/getting-started-with-testcontainers-for-java/)                                              |
|                  |     Testcontainers Junit Jupiter     |   1.18.3   | Integration between Testcontainers and Junit Jupiter for testing.                        | [Testcontainers Junit Jupiter](https://java.testcontainers.org/test_framework_integration/junit_5/)                                                        |
|                  |               JSR 305                |   3.0.2    | Removes a Gradle warning about an unknown annotation.                                    | [JSR 305 ](https://jcp.org/en/jsr/detail?id=305)                                                                                                           |
<div style="text-align: right;">

<small>**All Services** include skill level, quiz service, content, and course service.</small>
</div>

| Service           |  Library  | Version | Purpose                                                                 | Library Link                                                                        |
|:------------------|:---------:|:-------:|:------------------------------------------------------------------------|:------------------------------------------------------------------------------------|
| **Media Service** | Minio SDK |  8.5.2  | Provides a client for interacting with the Minio object storage server. | [Minio SDK](https://min.io/docs/minio/linux/developers/minio-drivers.html#java-sdk) |

| Service                                    |     Library     | Version | Purpose                            | Library Link |
|:-------------------------------------------|:---------------:|:-------:|:-----------------------------------|:-------------|
| **Reward Service**, **SkillLevel Service** | Content Service |  0.1.2  | Includes content service for DTOs. | -            |

| Service                                                        |           Library           | Version | Purpose                                                                                                                                           | Library Link                                                                                                            |
|:---------------------------------------------------------------|:---------------------------:|:-------:|:--------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------|
| **Course Service**, **Reward Service**, **SkillLevel Service** | Spring Boot Starter Webflux |         | Provides dependencies for building reactive web applications. Used for inter-service communication. | [Spring Boot Starter Webflux ](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-webflux) |