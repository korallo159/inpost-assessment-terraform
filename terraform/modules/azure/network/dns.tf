resource "azurerm_private_dns_zone" "main" {
  for_each = var.private_dns_zones

  name                = each.value
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "main" {
  for_each = var.private_dns_zones

  name                  = "${each.key}-vnet-link"
  private_dns_zone_name = azurerm_private_dns_zone.main[each.key].name
  virtual_network_id    = azurerm_virtual_network.main.id
  resource_group_name   = var.resource_group_name

  depends_on = [azurerm_private_dns_zone.main]
}
