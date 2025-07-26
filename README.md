# CI/CD Pipeline Project – Node.js App Deployment to Azure using Docker

This project demonstrates how to build and deploy a containerized Node.js application to Azure App Service using a complete CI/CD pipeline in **Azure DevOps**.

## 🚀 Tech Stack
- Node.js (Simple App)
- Docker
- Azure DevOps Pipelines (YAML)
- Azure Container Registry (ACR)
- Azure App Service

## 🛠️ What This Pipeline Does
- Builds the Docker image from `Dockerfile`
- Pushes the image to **Azure Container Registry**
- Deploys the container image to **Azure App Service**
- All steps are automated via **Azure DevOps YAML pipeline**

## 📂 Folder Structure
.
├── Dockerfile
├── azure-pipelines.yml
├── index.js
└── package.json

## ✅ Prerequisites
- Azure Subscription
- Azure DevOps project
- Azure Container Registry created
- App Service with Linux container support

## 👤 Author
[Prasik Pawar](https://www.linkedin.com/in/prasikpawar)
