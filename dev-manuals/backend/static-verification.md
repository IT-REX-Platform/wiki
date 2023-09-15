# Static code analysis

## Tool-based code analysis

For automatic code review, [SonarQube](https://docs.sonarqube.org/latest/) is used. [SonarCloud](https://www.sonarsource.com/products/sonarcloud/) is used to extend the CI/CD pipeline by performing continuous code inspections and giving hints about detected bugs, vulnerabilities and code smells.

We kept, with one exception, the default rule set.
This one exception is related to our testing library for testing the GraphQL API. 
As it is not as common as e.g. JUnit, Sonar does not recognize it as a testing framework and assumes we have no assertions in the API tests.
We disabled that rule.

