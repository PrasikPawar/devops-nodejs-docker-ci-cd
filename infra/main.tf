terraform {
  # --- ADD THIS ENTIRE BLOCK ---
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "mytfstateprod98765" # Use the name you created
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
  # -----------------------------

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

# This block configures the provider itself, in this case, Azure.
# It will use your Azure CLI login for authentication.
provider "azurerm" {
  features {}
}
