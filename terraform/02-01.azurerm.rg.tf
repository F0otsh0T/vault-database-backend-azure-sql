# 02-01.azurerm.rg.tf


################################################
# AzureRM Resource Group

resource "azurerm_resource_group" "rg" {
  # name = "${var.user}-demo-example-rg"
  # name = random_pet.example.id
  name = "${random_pet.example.id}-rg"
  #   location = "East US"
  location = var.azure_region
}

