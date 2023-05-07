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

We use the default Oracle Styleguide, i.e., the default settings of IntelliJ, as a base.

### Special Style Rules

- If acronyms are used in class, variable, or other names, only the first letter of the acronym should be capitalized, all other letters must not be capitalized, e.g. `AbstractJsonToXmlConverter`

