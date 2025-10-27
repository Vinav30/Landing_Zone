terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-vinav"
    storage_account_name = "tfstatesvinav"
    container_name       = "tfstates"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

  subscription_id = "328861c5-c270-40df-86f9-628accce0c5d"
}
