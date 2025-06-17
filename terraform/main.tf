resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/azure/network"
  location            = var.location
  resource_group_name = var.resource_group_name
  private_dns_zones   = var.private_dns_zones
  vnet_address_space  = var.vnet_address_space
  vnet_name           = var.vnet_name
  subnets             = var.subnets

  depends_on = [azurerm_resource_group.rg]
}


module "storage" {
  source               = "./modules/azure/storage"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_name = var.storage_account_name

  depends_on = [module.network]
}

module "db" {
  source              = "./modules/azure/db"
  name                = var.app.db_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.db_subnet_id
  private_dns_zone_id = module.network.database_private_dns_zone_id

  depends_on = [module.network]
}

module "app" {
  source                        = "./modules/azure/app"
  name                          = var.app.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  app_subnet_id                 = module.network.app_subnet_id
  gateway_subnet_address_prefix = var.subnets.gateway.address_prefix
  mysql_connection_string       = module.db.connection_string

  depends_on = [module.db, module.storage]
}

module "gateway" {
  source              = "./modules/azure/gateway"
  name                = "${var.app.name}-agw"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.app_gw_subnet_id
  backend_fqdns       = [module.app.default_hostname]

  depends_on = [module.app]
}



