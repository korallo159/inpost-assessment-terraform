variable "name" {
  type        = string
  description = "The name of the db"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "subnet_id" {
  type        = string
  description = "The id of the subnet"
}

variable "private_dns_zone_id" {
  type        = string
  description = "The id of the private dns zone"
}

variable "location" {
  type        = string
  description = "Location of the resources"
}