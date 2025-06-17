output "connection_string" {
  description = "MySQL connection string for the application"
  value       = "mysql://${azurerm_mysql_flexible_server.main.administrator_login}:${azurerm_mysql_flexible_server.main.administrator_password}@${azurerm_mysql_flexible_server.main.fqdn}:3306/"
  sensitive   = true
}

output "db_admin_login" {
  description = "Admin login for MySQL server"
  value       = azurerm_mysql_flexible_server.main.administrator_login
  sensitive   = true
}

output "db_admin_password" {
  description = "Admin password for MySQL server"
  value       = azurerm_mysql_flexible_server.main.administrator_password
  sensitive   = true
}
