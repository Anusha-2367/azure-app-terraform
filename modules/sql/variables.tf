variable "sql_server_name" {
  description = "Name of the Azure SQL logical server"
  type        = string
}

variable "sql_database_name" {
  description = "Name of the Azure SQL database"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "administrator_login" {
  description = "SQL administrator username"
  type        = string
  sensitive   = true
}

variable "administrator_password" {
  description = "SQL administrator password"
  type        = string
  sensitive   = true
}

variable "database_sku_name" {
  description = "SKU for the Azure SQL Database"
  type        = string
  default     = "S0"
}