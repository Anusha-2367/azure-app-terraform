resource "azurerm_private_dns_zone" "key_vault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "key_vault" {
  name                  = "key-vault-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.key_vault.name
  virtual_network_id    = var.vnet_id

  depends_on = [
    azurerm_private_dns_zone.key_vault
  ]
}

resource "azurerm_private_endpoint" "key_vault" {
  name                = var.private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id

  depends_on = [
    azurerm_private_dns_zone.key_vault
  ]

  private_service_connection {
    name = "key-vault-private-connection"

    private_connection_resource_id = var.key_vault_id

    is_manual_connection = false

    subresource_names = [
      "vault"
    ]
  }

  private_dns_zone_group {
    name = "key-vault-dns-zone-group"

    private_dns_zone_ids = [
      azurerm_private_dns_zone.key_vault.id
    ]
  }
}