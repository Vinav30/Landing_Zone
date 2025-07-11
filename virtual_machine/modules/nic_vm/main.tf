resource "azurerm_network_interface" "nic_vm" {
  for_each            = var.nic_vm
   name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = each.value.private_ip
    public_ip_address_id          = each.value.public_ip_address_id
  }


}
output "id" {
  value = {
    for key, nic in azurerm_network_interface.nic_vm :
    key => nic.id
  }
}