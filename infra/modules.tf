# This file calls the reusable infrastructure module.
# You can create multiple 'module' blocks here to deploy different
# environments (e.g., staging, production) using the same underlying code.

module "webapp_prod" {
  # The 'source' attribute tells Terraform where to find the module's code.
  # In this case, it's a local directory.
  source = "./modules/webapp-infra"

  # --- Input Variables ---
  # These are the values we are passing into the module.
  # You can change these values to deploy a completely separate environment.
  resource_group_name = "WebAppProject-Prod-RG"
  location            = "Central US"
  
  # IMPORTANT: These names must be globally unique across all of Azure.
  # Change them to something unique for your project.
  acr_name            = "myprodacr98765" 
  web_app_name        = "mystaging-webapp-98765"
}

/*
# --- Example: Deploying a Staging Environment ---
# To deploy a second, identical environment for staging, you would
# just copy the block above and change the values.

module "webapp_staging" {
  source = "./modules/webapp-infra"

  resource_group_name = "WebAppProject-Staging-RG"
  location            = "West Europe"
  acr_name            = "mystagingacr98765"
  web_app_name        = "mystaging-webapp-98765"
}
*/
