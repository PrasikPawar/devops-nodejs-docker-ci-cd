# This configuration creates the necessary resources to store the Terraform state file remotely.
# It should be run once, separately from your main application infrastructure.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# A dedicated resource group for the backend storage
resource "azurerm_resource_group" "state_rg" {
  name     = "tfstate-rg"
  location = "East US"
}

# The storage account to hold the state file
# NOTE: The name must be globally unique. Change it to something unique.
resource "azurerm_storage_account" "state_storage" {
  name                     = "mytfstateprod98765"
  resource_group_name      = azurerm_resource_group.state_rg.name
  location                 = azurerm_resource_group.state_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# The blob container inside the storage account
resource "azurerm_storage_container" "state_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.state_storage.name
  container_access_type = "private"
}
