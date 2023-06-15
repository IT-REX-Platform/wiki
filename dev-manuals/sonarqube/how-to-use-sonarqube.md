# How to use sonarqube

The Sonarqube can be reached under: https://sonarcloud.io/organizations/it-rex-platform/projects

Here you can see all the services that have been added already.
To add a new Service click on "Analyze new project". 
The Organization "IT-REX" should be selected already, if you logged in via GitHub.
Select the repository you want to add and confirm by clicking "Set Up"
![](/images/sonarqube%20new%20project.png)


Ask one of the current admins to give you admin permissions if you don't already have them
Sonarqube will automatically set the project up. Once the project was added you need to do the following:

- Add the repository to sonarcloud. You need admin permissions in sonarcloud to successfully complete this part
    - Follow the instructions for extra configuration. Click Configure analysis in cour CI ![](/images/sonarcloud%20instructions%201.png)
    - Unselect automatic analysis
    - choose GitHub actions, only the first step needs to be completed
- Add SONAR_TOKEN to the secrets on GitHub

Once these steps have been completed and the CI Pipeline has run at least once you should see the issues and coverage of the respective branches.

