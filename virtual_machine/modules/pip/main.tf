resource "azurerm_public_ip" "pip" {
  for_each            = var.pip
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = each.value.sku
}

