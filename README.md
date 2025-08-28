End-to-End CI/CD Pipeline for a Containerized Node.js App on Azure 🚀
This project demonstrates a complete, automated CI/CD pipeline for a containerized Node.js application deployed to Microsoft Azure. It utilizes Infrastructure as Code (IaC) with Terraform to provision the cloud environment and Azure DevOps Pipelines to automate the build, test, and deployment process.

Core Technologies 🛠️
Cloud Platform: Microsoft Azure ☁️

Infrastructure as Code: Terraform 🏗️

CI/CD: Azure DevOps Pipelines (YAML) ⚙️

Containerization: Docker 🐳

Application: Node.js (Express.js) 💻

Source Control: Git 🌿

Features ✨
✅ Automated Infrastructure Provisioning: All necessary Azure resources (Resource Group, Container Registry, App Service Plan, etc.) are defined and managed as code using Terraform, ensuring a repeatable and consistent environment.

✅ Remote State Management: Terraform's state is securely stored in a remote Azure Blob Storage backend, enabling team collaboration and preventing state file loss.

✅ Containerized Application: The Node.js application is containerized with Docker, guaranteeing that it runs the same way locally as it does in the cloud.

✅ Multi-Stage CI/CD Pipeline: An azure-pipelines.yml file defines a multi-stage pipeline that automatically:

Builds the Docker image upon a commit to the main branch.

Pushes the versioned image to a private Azure Container Registry (ACR).

Deploys the new image to the Azure App Service.

Project Structure 📂
.
├── app/                  # Contains the Node.js application and its Dockerfile.
├── infra/                # Contains the main Terraform configuration for the application infrastructure.
│   ├── main.tf           # Configures the Azure provider and remote backend.
│   ├── modules.tf        # Calls the reusable infrastructure module.
│   ├── outputs.tf        # Defines outputs like the web app URL.
│   └── modules/
│       └── webapp-infra/ # The reusable Terraform module for all app resources.
├── terraform-backend/    # Separate Terraform config to create the backend storage.
└── azure-pipelines.yml   # The CI/CD pipeline definition.

Setup and Deployment 📋
Prerequisites 🔑
An active Azure Subscription.

Azure CLI installed and configured.

Terraform installed.

An Azure DevOps organization and project.

1️⃣ Create the Backend Storage
First, create the dedicated storage account for the Terraform state file.

# Navigate to the backend configuration directory
cd terraform-backend

# Initialize and apply the configuration
terraform init
terraform apply

2️⃣ Provision the Application Infrastructure
Next, deploy the main application infrastructure using Terraform.

# Navigate to the main infrastructure directory
cd ../infra

# Initialize Terraform. It will prompt you to migrate the state to the new backend.
terraform init

# Plan and apply the configuration
terraform plan
terraform apply

3️⃣ Configure and Run the Azure Pipeline
Push the entire project repository to Azure Repos or GitHub.

In your Azure DevOps project, create two Service Connections:

An Azure Resource Manager connection to your subscription.

A Docker Registry connection to the Azure Container Registry created by Terraform.

Create a new pipeline in Azure DevOps, selecting the azure-pipelines.yml file from your repository.

Run the pipeline. It will automatically build the application and deploy it to the provisioned infrastructure.
