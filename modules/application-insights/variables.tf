variable "application_insights_name" {
  description = "Name of the Application Insights resource"
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

variable "application_type" {
  description = "Application type for Application Insights"
  type        = string
  default     = "web"
}