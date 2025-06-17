resource "random_string" "admin_username" {
  length  = 12
  upper   = false
  special = true
}

resource "random_password" "admin_password" {
  length  = 16
  special = true
}

resource "azurerm_mysql_flexible_server" "main" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = random_string.admin_username.result
  administrator_password = random_password.admin_password.result
  backup_retention_days  = 7
  delegated_subnet_id    = var.subnet_id
  private_dns_zone_id    = var.private_dns_zone_id
  sku_name               = "GP_Standard_D2ds_v4"

  storage {
    auto_grow_enabled = true
    size_gb           = 20
  }
  high_availability {
    mode = "ZoneRedundant"
  }
}
