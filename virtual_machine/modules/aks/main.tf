resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.aks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

# Outputs per AKS cluster key
output "client_certificate" {
  value = { for k, v in azurerm_kubernetes_cluster.aks : k => v.kube_config[0].client_certificate }
  sensitive = true
}

output "kube_config" {
  value = { for k, v in azurerm_kubernetes_cluster.aks : k => v.kube_config_raw }
  sensitive = true
}
