terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.6.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.22.0"
    }
  }
  required_version = ">= 1.1.9"

  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
}
provider "azuread" {
}


locals {
  app_name = var.app_name
  env      = terraform.workspace
}


resource "azurerm_resource_group" "rg" {
  name     = "${local.app_name}-${local.env}"
  location = "West Europe"
  tags = {
    deployed_by = "Terraform"
    environment = local.env
    app_name    = local.app_name
  }
}
