variable "resource_group_name" {
  description = "The base name for the Azure Resource Group."
  type        = string
  default     = "WebAppProject"
}

variable "location" {
  description = "The location for the Azure Resource Group."
  type        = string
  default     = "Central US"
}

variable "acr_name" {
  description = "The name for azure container registry"
  type        = string
  default     = "myuniqueacrhardcoded12345"
}

variable "azure_service_plan_name" {
  description = "The name for azure service plan"
  type        = string
  default     = "webapp-plan"
}

variable "web_app_name" {
  description = "The name for azure service plan"
  type        = string
  default     = "myunique-webapp"
}
