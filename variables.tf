variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "public_subnet_address_prefix" {
  description = "Public subnet address range"
  type        = string
}

variable "private_app_subnet_address_prefix" {
  description = "Private App subnet address range"
  type        = string
}

variable "private_endpoint_subnet_address_prefix" {
  description = "Private Endpoint subnet address range"
  type        = string
}
variable "application_insights_name" {
  description = "Name of Application Insights"
  type        = string
}
variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}
variable "private_endpoint_name" {
  description = "Name of the Key Vault private endpoint"
  type        = string
}
variable "sql_server_name" {
  description = "Azure SQL Server name"
  type        = string
}

variable "sql_database_name" {
  description = "Azure SQL Database name"
  type        = string
}

variable "sql_administrator_login" {
  description = "Azure SQL administrator username"
  type        = string
  sensitive   = true
}

variable "sql_administrator_password" {
  description = "Azure SQL administrator password"
  type        = string
  sensitive   = true
}

variable "sql_database_sku_name" {
  description = "Azure SQL Database SKU"
  type        = string
  default     = "S0"
}
variable "sql_location" {
  description = "Azure region for SQL Server"
  type        = string
}
variable "app_service_plan_name" {
  description = "App Service Plan name"
  type        = string
}

variable "app_service_name" {
  description = "App Service name"
  type        = string
}

variable "app_service_sku" {
  description = "App Service Plan SKU"
  type        = string
  default     = "B1"
}