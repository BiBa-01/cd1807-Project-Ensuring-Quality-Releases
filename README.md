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

<img width="1426" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/63d1942f-fb9c-4d37-9649-c42a911f746d">

<img width="1426" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/36545f7f-ec71-449e-8a8b-70e8402425b9">

#### Build
<img width="1426" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/b75e591e-6d12-48f9-ac0c-38a41a13bf25">
<img width="1386" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/09c13ef7-3fa4-4992-a0fe-f9fb2c74bdec">
<img width="1390" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/57c45d70-4e51-4f0d-8bb1-825ef81e5b23">

<img width="1283" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/569d089a-f75d-47df-a7d6-bf7777b9887f">

#### Newman/Postman
Run postman/newman data tests against the http://dummyjson.com API
##### Validation test
<img width="1135" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/aba4ff44-f527-40a3-9ec5-f4e8e714878c">

##### Regression test
<img width="1123" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/0a0b99ab-782e-4dbb-abe1-775c88c1747e">

<img width="1350" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/47696964-053a-400e-8aa0-8125a5979b7d">

#### Archive Files

##### UI Test
<img width="1372" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/3ce717b6-52d2-4815-9878-813887e20b81">

<img width="1275" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/bb5d36f3-dd02-48ff-a350-5b916460157c">

##### Fakerestapi
<img width="1258" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/bb801af8-6b13-48dd-ac3a-2dff1e4a24b9">

##### PerformanceTest
<img width="1321" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/af054458-9c68-477a-aafa-d1397d921202">

#### Build Finished successfully

<img width="891" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/aa70bc1b-93a1-4694-9cfa-aff49ef3f817">

### Deploy

#### Fakerestapi
Deploy FakeRestAPI as an azure app service.

#### Selenium




### Alerting & Logging:
Set up email alerting for the app service.
![image](https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/401eedd9-2578-473e-b8f1-a6974c195f75)

Set up custom logging in log analytics to get logs from the VM.
![image](https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/cbbcf7fe-220e-44d4-aee2-af95932b9d24)

