terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-state-rg-anusha"
    storage_account_name = "anushatfstate260831"
    container_name       = "tfstate"
    key                  = "azure-app-terraform.tfstate"
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}
}