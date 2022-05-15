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



# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 1000
  max = 9999
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "plan" {
  name                = "${local.app_name}-${local.env}-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}
# Create the web app, pass in the App Service Plan ID, and deploy code from a public GitHub repo
resource "azurerm_linux_web_app" "app" {
  name                = "${local.app_name}-${random_integer.ri.result}-${local.env}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    app_command_line = "npm run build"
    application_stack {
      node_version = "16-lts"
    }
    # source_control {
    #   repo_url           = "https://github.com/AnimalMother83/template-svelte-ts"
    #   branch             = "master"
    #   manual_integration = true
    #   use_mercurial      = false
    # }
  }
}


resource "azurerm_app_service_source_control" "src" {
  app_id   = azurerm_linux_web_app.app.id
  repo_url = "https://github.com/AnimalMother83/template-svelte-ts"
  branch   = "master"
}