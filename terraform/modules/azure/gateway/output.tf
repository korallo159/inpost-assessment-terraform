output "application_gateway_id" {
  value       = azurerm_application_gateway.main.id
  description = "ID of the Application Gateway"
}

output "application_gateway_public_ip" {
  value       = azurerm_public_ip.main.ip_address
  description = "Public IP of Application Gateway"
}
