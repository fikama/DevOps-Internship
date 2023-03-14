# Azure DevOps Internship code
The scripts below are a product of my Azure DevOps internship at CapGemini. They target azure if not specified otherwise. My tasks were split into several areas:
#### 1. Docker Images & github/azure pipelines
- **[statis-website-01]()** - Docker Image that hosts test website locally
- **[catalog-api]()** - creates a Dockerfile and pipeline (on Azure DevOPS and GitHub actions) for running and testing a NodeJS app
- **[booking-api]()** - creates a Dockerfile and pipeline (on Azure DevOPS and GitHub actions) for running and testing a .NET app
- **[session06]()** - creates starter pipeline in Azure DevOps and GitHub Actions
#### 2. The imperative approach to infrastructure management: Bash/Powershell
Each script allows to give its inputs via a dedicated input file or shell arguments see `<name_of_the_script> --help`. Bash scripts depend on `az` and its authentication & authorization to a given Microsoft account
- **[session07]()**
    - **[02]()** - creates Virtual Network
    - **[03]()** - creates Azure Network Security Group
    - **[04]()** - assigns given `network security group` to given `subnet`
    - **[05]()** - creates Virtual Machine
- **[session08]()** - creates WebApp and AppService plan for it
- **[session09]()**
    - **[02]()** - creates a Storage Account
    - **[03]()** - creates a Backup
    - **[04]()** - deletes and then recreates a Resource group, with the same name
#### 3. Declarative approach to infrastructure: Terraform/ARM Templates/Bicep
- **[session11]()**
    - **[02]()** - creates a Microsoft SQL Server
    - **[03]()** - creates a Web app and Web App for it
    - **[04]()** - creates a Storage Account with file and blob accounts inside it
    - **[05]()** - configure retention on Storage Account
- **[session12]()**
    - **[02]()** - creates a Virtual Network and specified Subnets in it
    - **[03]()** - creates a Network Security Group with specified rules for it
    - **[04]()** - assign given subnet to given Network Security Group 
    - **[05]()** - creates a linux Virtual Machine
    - **[06]()** - creates an Application Gateway
- **[session16]()**
    - **[01]()** - creates an Azure Container Registry
    - **[02]()** - creates two Dockerfiles for .NET and for Node based apps
    - **[04]()** - deploy an app using Azure Virtual Machine with docker container
- **[session18]()**
    - **[01]()** - creates an application insight and test within it
    - **[02]()** - creates an application insight dashboard for given App Service Plan
    - **[03]()** - creates application insight dashboard for given App Service
    - **[04]()** - creates application insight dashboard for given Application Gateway
- **[session19]()**
    - creates an automated account
    - creates a runbook in it that would run on a schedule

This code is moved and organized from my [original internship repository](https://github.com/Filip-Marszalek-Intership)
