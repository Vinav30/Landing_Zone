module "resource_group" {
  source    = "../../modules/resource_group"
  rgs-vinav = var.rgs-vinav
}

# module "storage_account" {
#   depends_on      = [module.resource_group]
#   source          = "../../modules/storage_account"
#   storageAccounts = var.storage_accounts
# }
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/virtual_network"

  vnet = var.vnet
}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/subnet"
  subnet     = var.subnet
}

module "linux_vm" {
  depends_on = [ module.nic_vm ]
  source     = "../../modules/linux_vm"
  linux_vm   = var.linux_vm

  
}
module "sql_server" {
  depends_on = [module.resource_group]
  source     = "../../modules/sql_server"
  sql_server = var.sql_server

}
module "sql_database" {
  depends_on   = [module.sql_server]
  source       = "../../modules/sql-database"
  sql_database = var.sql_database

}
module "pip" {
  depends_on = [module.subnet]
  source     = "../../modules/pip"
  pip        = var.pip

}
module "nic_vm" {
  depends_on = [module.pip]
  source     = "../../modules/nic_vm"
  nic_vm     = var.nic_vm

}
