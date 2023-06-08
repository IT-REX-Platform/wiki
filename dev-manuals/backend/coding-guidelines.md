# Coding Guidelines

## Package structure

This package structure is based on multiple sources of best practices in Spring Boot, using roughly the "Package by layer" approach.
- *root*
  - *config*
  - *controller*
  - *dapr*
  - *dto*
  - *exception*
  - *persistence*
    - *dao*
    - *mapper*
    - *repository*
  - *service*
  - *validation*
  
The detailed package structure is documented [here](https://github.com/IT-REX-Platform/template-microservice).

## Style Guide

### Java

We use the default Oracle Styleguide, i.e., the default settings of IntelliJ, as a base. Also remember the Java naming conventions.

#### Special Style Rules

- If acronyms are used in class, variable, or other names, only the first letter of the acronym should be capitalized, all other letters must not be capitalized, e.g. `AbstractJsonToXmlConverter`

### GraphQL

Please regard the [GraphQL naming conventions](https://www.apollographql.com/docs/technotes/TN0002-schema-naming-conventions/)

## How To...

### How to validate input?

#### Field level validation

To validate the input the microservice receives on the field level, we can use a set of predefined graphQL directives.
Example: 
```graphql
input CreateCourseInput {
    # Title of the course, max 255 characters
    title: String! @NotBlank @Size(max: 255)
    # Description of the course, max 3000 characters
    description: String! @Size(max: 3000)
   ...
}
```
This will automatically raise a graphQL error if for example the `title` in this example is blank.
More information on these directives [here](https://github.com/graphql-java/graphql-java-extended-validation/blob/master/README.md)

#### Class level validation

To validate an input class on class level, e.g., to check if a start date is before an end date or there are no duplicate items in the db, write your custom validation code in the `validation` package and call it in the corresponding service class.

#### Naming of services
Services follow the naming schema: "servicename_service". 