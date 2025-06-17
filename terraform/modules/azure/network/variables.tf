variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "private_dns_zones" {
  type        = map(string)
  description = "Map of identifiers to private DNS zone names that should be created and linked to the main virtual network. Example: { mysql = \"app.mysql.database.azure.com\" }"
}

variable "location" {
  type        = string
  description = "Location of the resources"
}
variable "vnet_address_space" {
  type        = string
  description = "The address space for the virtual network"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
  default     = "app-vnet"
}

variable "subnets" {
  type = map(object({
    name              = string
    address_prefix    = string
    service_endpoints = optional(list(string), [])
    delegation = optional(object({
      name         = string
      service_name = string
      actions      = list(string)
    }), null)
  }))
  description = "Map defining the subnets."
}
