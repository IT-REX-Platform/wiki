# Static code analysis

## Tool-based code analysis

For automatic code review, [SonarQube](https://docs.sonarqube.org/latest/) is used. [SonarCloud](https://www.sonarsource.com/products/sonarcloud/) is used to extend the CI/CD pipeline by performing continuous code inspections and giving hints about detected bugs, vulnerabilities and code smells.

Open questions:
- What rules should apply in SonarQube? E.g. should it be critical to have empty methods?
- Is it part of the review to check e.g. if certain parts changed to the worse?
- Is SonarQube used to assign people to request changes in the code? Or comments only on GitHub?
