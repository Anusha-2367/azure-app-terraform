output "resource_group_name" {
  description = "Created Resource Group name"
  value       = module.resource_group.resource_group_name
}

output "resource_group_id" {
  description = "Created Resource Group ID"
  value       = module.resource_group.resource_group_id
}

output "location" {
  description = "Azure deployment location"
  value       = module.resource_group.location
}
output "vnet_id" {
  description = "Virtual Network ID"
  value       = module.vnet.vnet_id
}

output "vnet_name" {
  description = "Virtual Network name"
  value       = module.vnet.vnet_name
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = module.vnet.public_subnet_id
}

output "private_app_subnet_id" {
  description = "Private App subnet ID"
  value       = module.vnet.private_app_subnet_id
}

output "private_endpoint_subnet_id" {
  description = "Private Endpoint subnet ID"
  value       = module.vnet.private_endpoint_subnet_id
}
output "application_insights_id" {
  description = "Application Insights ID"
  value       = module.application_insights.application_insights_id
}

output "application_insights_name" {
  description = "Application Insights name"
  value       = module.application_insights.application_insights_name
}

output "application_insights_connection_string" {
  description = "Application Insights connection string"
  value       = module.application_insights.connection_string
  sensitive   = true
}
output "key_vault_id" {
  description = "Key Vault resource ID"
  value       = module.key_vault.key_vault_id
}

output "key_vault_name" {
  description = "Key Vault name"
  value       = module.key_vault.key_vault_name
}

output "key_vault_uri" {
  description = "Key Vault URI"
  value       = module.key_vault.key_vault_uri
}
output "key_vault_private_endpoint_id" {
  description = "Key Vault Private Endpoint ID"
  value       = module.key_vault_private_endpoint.private_endpoint_id
}

output "key_vault_private_ip" {
  description = "Private IP address of Key Vault Private Endpoint"
  value       = module.key_vault_private_endpoint.private_ip_address
}
output "sql_server_id" {
  description = "SQL Server ID"
  value       = module.sql.sql_server_id
}

output "sql_server_name" {
  description = "SQL Server name"
  value       = module.sql.sql_server_name
}

output "sql_database_id" {
  description = "SQL Database ID"
  value       = module.sql.sql_database_id
}

output "sql_database_name" {
  description = "SQL Database name"
  value       = module.sql.sql_database_name
}

output "sql_fully_qualified_domain_name" {
  description = "SQL Server FQDN"
  value       = module.sql.sql_fully_qualified_domain_name
}