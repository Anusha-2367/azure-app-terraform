resource "azurerm_service_plan" "this" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.app_service_sku
}

resource "azurerm_linux_web_app" "this" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.this.id

  virtual_network_subnet_id = var.private_app_subnet_id

  depends_on = [
    azurerm_service_plan.this
  ]

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    APPLICATIONINSIGHTS_CONNECTION_STRING = var.application_insights_connection_string
  }

  site_config {
    always_on = true

    application_stack {
      dotnet_version = "8.0"
    }
  }
}