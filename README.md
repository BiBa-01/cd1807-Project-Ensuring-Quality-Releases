# Project Ensuring Quality Releases
This is my final project for the Udacity Nanodegree "Cloud Devops using Microsoft Azure.
It includes creating Terraform configuration files, setting up a CI/CD Pipeline in Azure Devops and design, running test suites with JMeter, Postman and Selenium and using azure monitor to identify and mitigate operational issues.

Tools

- Visual Studio Code
- Azure
- Azure Devops (installing Terraform Azure Pipelines Extension from Marketplace)
- Terraform
- JMeter
- Postman
- Selenium
- Azure Monitor

### Start
Creation of a resource group and a storage account in azure.

### Utilize Terraform to apply infrastructure as Code for

App service
App service plan
Network interface
Network security group
Public IP address
Virtual machine
#### Build
<img width="452" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/72c6ece5-bcaf-412a-8741-116f3a5e5c11">

#### Screenshot of successful execution of pipeline build




Deploy FakeRestAPI as an azure app service.
Run postman/newman data tests against the http://dummyjson.com API
Jmeter Tests:
Selenium Tests:

Set up email alerting for the app service.
![image](https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/401eedd9-2578-473e-b8f1-a6974c195f75)

Set up custom logging in log analytics to get logs from the VM.
![image](https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/cbbcf7fe-220e-44d4-aee2-af95932b9d24)

