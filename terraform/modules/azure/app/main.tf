resource "azurerm_service_plan" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"

  zone_balancing_enabled = true
}



resource "azurerm_linux_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = azurerm_service_plan.app.location
  service_plan_id     = azurerm_service_plan.app.id

  virtual_network_subnet_id = var.app_subnet_id


  site_config {
    application_stack {
      node_version = "22-lts"
    }

    ip_restriction_default_action = "Deny"

    ip_restriction {
      name       = "Allow-AGW-Subnet"
      ip_address = var.gateway_subnet_address_prefix
      action     = "Allow"
      priority   = 100
    }

  }

  public_network_access_enabled = false

  connection_string {
    name  = "DATABASE"
    type  = "MySql"
    value = var.mysql_connection_string
  }

}


