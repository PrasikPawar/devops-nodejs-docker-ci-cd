# 2. Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# 3. Create an Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  # IMPROVED: Reference the created resource group directly
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# 4. Create an App Service Plan
resource "azurerm_service_plan" "plan" {
  # FIXED: Added the 'var.' prefix
  name                = var.azure_service_plan_name
  # IMPROVED: Reference the created resource group directly
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}

# 5. Create the Web App for Containers
resource "azurerm_linux_web_app" "webapp" {
  name                = var.web_app_name
  # IMPROVED: Reference the created resource group directly
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      # FIXED: Made the docker image name dynamic
      docker_image     = "${azurerm_container_registry.acr.login_server}/node-app"
      docker_image_tag = "latest"
    }
  }

  app_settings = {
    # FIXED: Made the server URL dynamic by referencing the ACR resource
    "DOCKER_REGISTRY_SERVER_URL"      = azurerm_container_registry.acr.login_server
    "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.acr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.acr.admin_password
  }
}

resource "azurerm_storage_account" "state_storage" {
  name                     = "mytfstateprod98765"
  resource_group_name      = azurerm_resource_group_rg.name
  location                 = azurerm_resource_group_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "state_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.state_storage.name
  container_access_type = "private"
}
