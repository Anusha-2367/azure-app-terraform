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

  depends_on = [
    azurerm_service_plan.this
  ]

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = true

    application_stack {
      dotnet_version = "8.0"
    }
  }
}