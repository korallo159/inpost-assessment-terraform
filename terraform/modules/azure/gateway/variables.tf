variable "name" {
  type        = string
  description = "Name of the Application Gateway"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where Application Gateway will be deployed"
}

variable "backend_fqdns" {
  type        = list(string)
  description = "List of FQDNs of backend targets (e.g. App Service default hostnames)"
}
