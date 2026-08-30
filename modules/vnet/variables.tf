variable "vnet_name" {
  description = "Name of the Virtual Network"
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

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "public_subnet_address_prefix" {
  description = "Address prefix for the Public subnet"
  type        = string
}

variable "private_app_subnet_address_prefix" {
  description = "Address prefix for the Private App subnet"
  type        = string
}

variable "private_endpoint_subnet_address_prefix" {
  description = "Address prefix for the Private Endpoint subnet"
  type        = string
}