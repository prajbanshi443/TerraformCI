terraform {
  required_version = "~>1.6.6"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.43.0"
    }
  }
  cloud {
    organization = "prabinrajbanshi"

    workspaces {
      name = "TerraformAzureCI"
    }
  }
}

provider "azurerm" {
  features {}
    skip_provider_registration = true
}

resource "random_string" "uniquestring" {
  length = 20
  special = false
  upper = false
}

resource "azurerm_resource_group" "rg" {
  name = "newrg7821323"
  location = "southcentralus"
}

resource "azurerm_storage_account" "storageaccount" {
  name = "stg${random_string.uniquestring.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}