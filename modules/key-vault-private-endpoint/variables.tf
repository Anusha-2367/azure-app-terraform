variable "private_endpoint_name" {
  description = "Name of the Key Vault private endpoint"
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

variable "private_endpoint_subnet_id" {
  description = "ID of the subnet where the private endpoint will be created"
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Key Vault"
  type        = string
}

variable "key_vault_name" {
  description = "Name of the Key Vault"
  type        = string
}

variable "vnet_id" {
  description = "ID of the Virtual Network"
  type        = string
}