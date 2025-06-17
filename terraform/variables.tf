variable "app" {
  type = object({
    name           = string
    db_name        = string
    db_subnet_name = string
  })
}

variable "resource_group_name" {
  type = string
}


variable "location" {
  type        = string
  description = "Location of the resources"
  default     = "swedencentral"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "vnet_address_space" {
  type        = string
  description = "CIDR block for the virtual network"
  default     = "10.0.0.0/16"
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
  description = "Subnet configuration map"
  default     = {}
}

variable "private_dns_zones" {
  type        = map(string)
  description = "Map of identifiers to private DNS zone names that should be created and linked to the main virtual network."
}
