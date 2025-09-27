terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "testrg6519"
    storage_account_name  = "testsg6519"
    container_name        = "tfstate"
    key                   = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
