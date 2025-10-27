variable "rgs-vinav" {
  type = map(any)
}
variable "storage_accounts" {
  type = map(any)
}
variable "vnet" {
  type = map(any)

}
variable "subnet" {
  type = map(any)

}
variable "linux_vm" {
  type = map(any)
}
variable "azurerm_container_registry" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool

  }))
}
variable "aks" {
  description = "AKS cluster configuration map"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
  }))
}
