output "db_subnet_id" {
  value = azurerm_subnet.main["db"].id
}

output "database_private_dns_zone_id" {
  value = azurerm_private_dns_zone.main["database"].id
}

output "app_gw_subnet_id" {
  value = azurerm_subnet.main["gateway"].id
}

output "app_subnet_id" {
  value = azurerm_subnet.main["app"].id
}
