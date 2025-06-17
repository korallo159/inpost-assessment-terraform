resource "azurerm_public_ip" "main" {
  name                = "${var.name}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "main" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appgw-ipconf"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = "http"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "public"
    public_ip_address_id = azurerm_public_ip.main.id
  }

  backend_address_pool {
    name  = "appservice-backend"
    fqdns = var.backend_fqdns
  }

  backend_http_settings {
    name                                = "http-settings"
    cookie_based_affinity               = "Disabled"
    port                                = 80
    protocol                            = "Http"
    pick_host_name_from_backend_address = true
    request_timeout                     = 30
  }

  http_listener {
    name                           = "http-listener"
    frontend_ip_configuration_name = "public"
    frontend_port_name             = "http"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "rule1"
    rule_type                  = "Basic"
    http_listener_name         = "http-listener"
    backend_address_pool_name  = "appservice-backend"
    backend_http_settings_name = "http-settings"
    priority                   = 1
  }

  waf_configuration {
    enabled                  = true
    firewall_mode            = "Prevention"
    rule_set_version         = "3.2"
    request_body_check       = true
    file_upload_limit_mb     = 100
    max_request_body_size_kb = 128
  }

}
