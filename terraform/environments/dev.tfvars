resource_group_name  = "inpost-assessment-dev-rg"
storage_account_name = "inpostdevsa"

app = {
  name           = "inpost-assessment-dev"
  db_name        = "inpost-assessment-db-dev"
  db_subnet_name = "inpost-assessment-db-subnet-dev"
}

private_dns_zones = {
  database = "dev.mysql.database.azure.com"
}

location = "swedencentral"

vnet_address_space = "10.0.0.0/16"

vnet_name = "inpost-dev-vnet"

subnets = {
  app = {
    name           = "inpost-app-subnet-dev"
    address_prefix = "10.0.1.0/24"
    delegation = {
      name         = "appsvc"
      service_name = "Microsoft.Web/serverFarms"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }

  db = {
    name              = "inpost-assessment-db-subnet-dev"
    address_prefix    = "10.0.2.0/24"
    service_endpoints = ["Microsoft.Storage"]
    delegation = {
      name         = "fs"
      service_name = "Microsoft.DBforMySQL/flexibleServers"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }

  gateway = {
    name           = "inpost-app-gw-subnet-dev"
    address_prefix = "10.0.3.0/24"
  }
}
