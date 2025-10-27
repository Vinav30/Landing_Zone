rgs-vinav = {
  rg1 = {
    "name"     = "rg-vinav14"
    "location" = "West Europe"
  }
  rg2 = {
    "name"     = "rg-vinav15"
    "location" = "South India"
  }
}

storage_accounts = {
  sa1 = {
    name                     = "vinavstorage1"
    resource_group_name      = "rg-vinav14"
    location                 = "West Europe"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }

}
vnet = {
  vnet1 = {
    name                = "vinav_vnet"
    resource_group_name = "rg-vinav14"
    location            = "West Europe"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "vinav_vnet"
    resource_group_name = "rg-vinav15"
    location            = "South India"
    address_space       = ["20.0.0.0/15"]
  }
}
subnet = {
  subnet1 = {
    name                 = "Frontend_subnet"
    resource_group_name  = "rg-vinav14"
    virtual_network_name = "vinav_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "Banckend_subnet"
    resource_group_name  = "rg-vinav15"
    virtual_network_name = "vinav_vnet"
    address_prefixes     = ["20.0.1.0/24"]

  }

}
linux_vm = {
  vm1 = {
    name                = "vinavvm1"
    resource_group_name = "rg-vinav14"
    location            = "West Europe"
    size                = "Standard_B1s"
    admin_username      = "azureuser"
    admin_password      = "Vinav@1234"
    subnet_id           = "/subscriptions/328861c5-c270-40df-86f9-628accce0c5d/resourceGroups/rg-vinav14/providers/Microsoft.Network/virtualNetworks/vinav_vnet/subnets/Frontend_subnet"
  }
  vm2 = {
    name                = "vinavvm2"
    resource_group_name = "rg-vinav15"
    location            = "South India"
    size                = "Standard_B2s"
    admin_username      = "azureuser"
    admin_password      = "Vinav@1234"
    subnet_id           = "/subscriptions/328861c5-c270-40df-86f9-628accce0c5d/resourceGroups/rg-vinav15/providers/Microsoft.Network/virtualNetworks/vinav_vnet/subnets/Banckend_subnet"
  }

}
aks = {
  aks1 = {
    name                = "vinavaks1"
    location            = "West Europe"
    resource_group_name = "rg-vinav14"
    dns_prefix          = "vinavaksdns1"
  }
  aks2 = {
    name                = "vinavaks2"
    location            = "South India"
    resource_group_name = "rg-vinav15"
    dns_prefix          = "vinavaksdns2"
  }
}
azurerm_container_registry = {
  "azurerm_container_registry" = {
    name                = "vinavacr"
    resource_group_name = "rg-vinav14"
    location            = "West Europe"
    sku                 = "Basic"
    admin_enabled       = true
  }
}