# Static code analysis

## Tool-based code analysis

For automatic code review, [SonarQube](https://docs.sonarqube.org/latest/) is used. [SonarCloud](https://www.sonarsource.com/products/sonarcloud/) is used to extend the CI/CD pipeline by performing continuous code inspections and giving hints about detected bugs, vulnerabilities and code smells.

We kept, with one exception, the default rule set.
This one exception is related to our testing library for testing the GraphQL API. 
As it is not as common as e.g. JUnit, Sonar does not recognize it as a testing framework and assumes we have no assertions in the API tests.
We disabled that rule.

## How to use sonarqube

The Sonarqube can be reached under: https://sonarcloud.io/organizations/it-rex-platform/projects

Here you can see all the services that have been added already.
To add a new Service click on "Analyze new project". 
The Organization "IT-REX" should be selected already, if you logged in via GitHub.
Select the repository you want to add and confirm by clicking "Set Up"
![](/images/sonarqube-new-project.png)


Ask one of the current admins to give you admin permissions if you don't already have them
Sonarqube will automatically set the project up. Once the project was added you need to do the following:

- Add the repository to sonarcloud. You need admin permissions in sonarcloud to successfully complete this part
    - Follow the instructions for extra configuration. Click Configure analysis in cour CI ![](/images/sonarcloud-instructions-1.png)
    - Unselect automatic analysis
    - choose GitHub actions, only the first step needs to be completed
- Add SONAR_TOKEN to the secrets on GitHub

Once these steps have been completed and the CI Pipeline has run at least once you should see the issues and coverage of the respective branches.

