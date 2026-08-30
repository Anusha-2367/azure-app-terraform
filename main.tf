data "azurerm_client_config" "current" {}
module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
}
module "vnet" {
  source = "./modules/vnet"

  vnet_name           = var.vnet_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  vnet_address_space  = var.vnet_address_space

  public_subnet_address_prefix           = var.public_subnet_address_prefix
  private_app_subnet_address_prefix      = var.private_app_subnet_address_prefix
  private_endpoint_subnet_address_prefix = var.private_endpoint_subnet_address_prefix
}
module "application_insights" {
  source = "./modules/application-insights"

  application_insights_name = var.application_insights_name
  location                  = module.resource_group.location
  resource_group_name       = module.resource_group.resource_group_name
}
module "key_vault" {
  source = "./modules/key-vault"

  key_vault_name      = var.key_vault_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
}
module "key_vault_private_endpoint" {
  source = "./modules/key-vault-private-endpoint"

  depends_on = [
    module.key_vault,
    module.vnet
  ]

  private_endpoint_name      = var.private_endpoint_name
  location                   = module.resource_group.location
  resource_group_name        = module.resource_group.resource_group_name
  private_endpoint_subnet_id = module.vnet.private_endpoint_subnet_id
  key_vault_id               = module.key_vault.key_vault_id
  key_vault_name             = module.key_vault.key_vault_name
  vnet_id                    = module.vnet.vnet_id
}

module "sql" {
  source = "./modules/sql"

  sql_server_name   = var.sql_server_name
  sql_database_name = var.sql_database_name

  location            = var.sql_location
  resource_group_name = module.resource_group.resource_group_name

  administrator_login    = var.sql_administrator_login
  administrator_password = var.sql_administrator_password

  database_sku_name = var.sql_database_sku_name
}
module "app_service" {
  source = "./modules/app-service"

  depends_on = [
    module.application_insights,
    module.vnet
  ]

  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name
  location              = module.resource_group.location
  resource_group_name   = module.resource_group.resource_group_name
  app_service_sku       = var.app_service_sku

  private_app_subnet_id = module.vnet.private_app_subnet_id

  application_insights_connection_string = module.application_insights.connection_string
}
resource "azurerm_key_vault_secret" "app_insights_connection_string" {
  name         = "app-insights-connection-string"
  value        = module.application_insights.connection_string
  key_vault_id = module.key_vault.key_vault_id

  depends_on = [
    module.key_vault
  ]
}
resource "azurerm_role_assignment" "app_key_vault_secrets" {
  scope                = module.key_vault.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.app_service.app_service_principal_id

  depends_on = [
    module.app_service,
    module.key_vault
  ]
}