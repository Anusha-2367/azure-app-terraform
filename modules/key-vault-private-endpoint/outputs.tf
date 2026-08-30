output "private_endpoint_id" {
  description = "Key Vault Private Endpoint ID"
  value       = azurerm_private_endpoint.key_vault.id
}

output "private_ip_address" {
  description = "Private IP address assigned to the Key Vault Private Endpoint"
  value       = azurerm_private_endpoint.key_vault.private_service_connection[0].private_ip_address
}

output "private_dns_zone_id" {
  description = "Private DNS Zone ID"
  value       = azurerm_private_dns_zone.key_vault.id
}