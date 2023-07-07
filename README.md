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
<img width="1385" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/aa235574-4927-4f93-ae1a-d5b655976e35">

### Utilize Terraform to apply infrastructure as Code for

App service
App service plan
Network interface
Network security group
Public IP address
Virtual machine

#### Build
<img width="1166" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/d9732dbb-3097-4b1e-90c9-957c67e8790f">

<img width="1254" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/be5788a5-e7a7-4d8b-9e94-6f3fb696c7eb">
<img width="1293" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/7770cbd8-3aa6-408b-9ce9-1e5207a6b2af">

<img width="1258" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/4422493d-4060-4571-907b-d7b2143cbf0f">



#### Newman/Postman
Run postman/newman data tests against the http://dummyjson.com API
##### Validation test
<img width="1231" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/7f7a8597-0922-49d8-a35e-6c43521ecd9b">


##### Regression test
<img width="1263" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/1dc9420e-4827-408b-9dfa-0e482e06ccea">
<img width="1282" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/c0c85cf6-c3cc-48a4-8ab1-b58397fb0334">

<img width="1280" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/56bd4644-7cf3-4afb-b384-7331ccd1d5b8">

#### Archive Files

##### UI Test
<img width="1226" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/9b138b31-776b-4f20-bec2-588646a40068">

##### Fakerestapi

<img width="1414" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/5dbe8de5-ca05-44e0-85e0-170aacbf6094">

##### PerformanceTest
<img width="1276" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/28c76af3-8482-457b-a178-bc7bd06965b9">



### Deploy
<img width="1292" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/56aa76ce-9684-4c38-9246-39e047a0a99c">

#### Fakerestapi
Deploy FakeRestAPI as an azure app service.
<img width="758" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/a9e175c9-0376-463f-8841-dd93a7a56b68">
<img width="1399" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/ce7b062f-0d8b-4a3a-b074-274db8c0cca8">

<img width="1249" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/8d64310d-04dd-4590-a97e-0588936246bf">

<img width="1249" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/16f0aa58-5ae8-424f-a26a-83110c0541e8">
<img width="1045" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/fe260733-cbb7-4ad1-88e4-1c8ee119087a">

#### Selenium
<img width="1197" alt="image" src="https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/61e01d5c-ccac-4d8d-8768-6a2d0df1f8b7">




### Alerting & Logging:
Set up email alerting for the app service.
![image](https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/401eedd9-2578-473e-b8f1-a6974c195f75)

Set up custom logging in log analytics to get logs from the VM.
![image](https://github.com/BiBa-01/cd1807-Project-Ensuring-Quality-Releases/assets/78079178/cbbcf7fe-220e-44d4-aee2-af95932b9d24)

