output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.this.name
}

output "public_subnet_id" {
  description = "ID of the Public subnet"
  value       = azurerm_subnet.public.id
}

output "private_app_subnet_id" {
  description = "ID of the Private App subnet"
  value       = azurerm_subnet.private_app.id
}

output "private_endpoint_subnet_id" {
  description = "ID of the Private Endpoint subnet"
  value       = azurerm_subnet.private_endpoint.id
}