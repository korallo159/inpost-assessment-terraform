resource_group_name  = "inpost-assessment-prod-rg"
storage_account_name = "inpostprodsa"

app = {
  name           = "inpost-assessment-prod"
  db_name        = "inpost-assessment-db-prod"
  db_subnet_name = "inpost-assessment-db-subnet-prod"
}

private_dns_zones = {
  database = "prod.mysql.database.azure.com"
}

location = "westeurope"

vnet_address_space = "10.0.0.0/16"

vnet_name = "inpost-prod-vnet"

subnets = {
  app = {
    name           = "inpost-app-subnet-prod"
    address_prefix = "10.0.1.0/24"
    delegation = {
      name         = "appsvc"
      service_name = "Microsoft.Web/serverFarms"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }

  db = {
    name              = "inpost-assessment-db-subnet-prod"
    address_prefix    = "10.0.2.0/24"
    service_endpoints = ["Microsoft.Storage"]
    delegation = {
      name         = "fs"
      service_name = "Microsoft.DBforMySQL/flexibleServers"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }

  gateway = {
    name           = "inpost-app-gw-subnet-prod"
    address_prefix = "10.0.3.0/24"
  }
}
