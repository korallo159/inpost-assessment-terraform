variable "name" {
  type        = string
  description = "The name of the app"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "mysql_connection_string" {
  type        = string
  description = "The connection string for the database"
  sensitive   = true
  default     = ""
}

variable "location" {
  type        = string
  description = "Location of the resources"
}

variable "app_subnet_id" {
  type        = string
  description = "The ID of the app subnet"
}

variable "gateway_subnet_address_prefix" {
  type        = string
  description = "CIDR block of the Application Gateway subnet used for IP restriction"
  default     = "10.0.3.0/24"
}
