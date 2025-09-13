terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "testrg"
    storage_account_name  = "testsg"
    container_name        = "tfstate"
    key                   = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
