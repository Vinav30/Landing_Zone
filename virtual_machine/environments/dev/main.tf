module "resource_group" {
  source    = "../../modules/resource_group"
  rgs-vinav = var.rgs-vinav
}



module "storage_account" {
  depends_on      = [module.resource_group]
  source          = "../../modules/storage_account"
  storageAccounts = var.storage_accounts
}
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
  depends_on = [module.subnet]
  source     = "../../modules/linux_vm"
  linux_vm   = var.linux_vm

}
module "azurerm_container_registry" {
  depends_on = [module.linux_vm]

  source                     = "../../modules/acr"
  azurerm_container_registry = var.azurerm_container_registry
}
module "aks" {
  depends_on = [module.resource_group]
  source     = "../../modules/aks"
  aks        = var.aks
}


