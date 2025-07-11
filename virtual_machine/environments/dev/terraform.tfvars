rgs-vinav = {
  rg1 = {
    name     = "rg-vinav30"
    location = "centralindia"
  }
   rg1 = {
    name     = "rg-vinavr0"
    location = "centralindia"
  }

}

# storage_accounts = {
#   sa1 = {
#     name                     = "vinavstorage1"
#     resource_group_name      = "rg-vinav14"
#     location                 = "centralIndia"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
#   }

# }
vnet = {
  vnet1 = {
    name                = "vinav_vnet"
    resource_group_name = "rg-vinav30"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  }

}
subnet = {
  subnet1 = {
    name                 = "Frontend_subnet"
    resource_group_name  = "rg-vinav30"
    virtual_network_name = "vinav_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "Backend_subnet"
    resource_group_name  = "rg-vinav30"
    virtual_network_name = "vinav_vnet"
    address_prefixes     = ["10.0.2.0/24"]

  }

}

linux_vm = {
  vm1 = {
    name                = "vinavfrontend"
    resource_group_name = "rg-vinav30"
    location            = "centralindia"
    size                = "Standard_B2s"
    admin_username      = "vinavadmin"
    admin_password      = "Vinav@1234"
    subnet_id           = "/subscriptions/ba19e6e0-e664-445e-b566-2a35e4ae7046/resourceGroups/rg-vinav30/providers/Microsoft.Network/virtualNetworks/vinav_vnet/subnets/Frontend_subnet"
  }
  vm2 = {
    name                = "vinavbackend"
    resource_group_name = "rg-vinav30"
    location            = "centralindia"
    size                = "Standard_B2s"
    admin_username      = "vinavvm"
    admin_password      = "Vinav@12345"
    subnet_id           = "/subscriptions/ba19e6e0-e664-445e-b566-2a35e4ae7046/resourceGroups/rg-vinav30/providers/Microsoft.Network/virtualNetworks/vinav_vnet/subnets/Backend_subnet"
  }
}
sql_server = {
  server = {
    name                         = "vinavsqlserver"
    resource_group_name          = "rg-vinav30"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = " vinavdb"
    administrator_login_password = "vinav@1234"
  }
}
sql_database = {
  database = {
    name        = "vinavdb"
    server_id   = "/subscriptions/ba19e6e0-e664-445e-b566-2a35e4ae7046/resourceGroups/rg-vinav30/providers/Microsoft.Sql/servers/vinavsqlserver"
    collation   = "SQL_Latin1_General_CP1_CI_AS"
    max_size_gb = 2
    sku_name    = "S0"
  }
}
nic_vm = {
  nic = {
    name                 = "vinav-nic-1"
    subnet_id            = "/subscriptions/ba19e6e0-e664-445e-b566-2a35e4ae7046/resourceGroups/rg-vinav30/providers/Microsoft.Network/virtualNetworks/vnet1/subnet/subnet1"
    private_ip           = "10.0.0.4"
    public_ip_address_id = "/subscriptions/ba19e6e0-e664-445e-b566-2a35e4ae7046/resourceGroups/rg-vinav30/providers/Microsoft.Network/publicIPAddresses/vinav-pip"
    resource_group_name  = "rg-vinav30"
    location             = "centralindia"
  }

}
pip = {
  public_ip = {
    name                = "vinav_pip"
    resource_group_name = "rg-vinav30"
    location            = "centralindia"
    sku                 = "Basic"


  }
}