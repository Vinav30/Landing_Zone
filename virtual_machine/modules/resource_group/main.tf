resource "azurerm_resource_group" "rgs-vinav" {
  for_each = var.rgs-vinav
  name     = each.value.name
  location = each.value.location
}

