# 00.versions.tf

terraform {
  required_version = ">= 0.13"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.6.0"
    }
    doormat = {
      source  = "doormat.hashicorp.services/hashicorp-security/doormat"
      version = "~> 0.0.2"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 3.1.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.17.0"
    }
    github = {
      source  = "integrations/github"
      version = ">=6.5.0"
    }
  }
  # backend "azurerm" {
  #   # backend configuration
  #   resource_group_name  = "${data.gha_tf_azure.base.AZURE_RESOURCE_GROUP_NAME}"
  #   storage_account_name = "${data.gha_tf_azure.base.AZURE_STORAGE_ACCOUNT_NAME}"
  #   container_name       = "${data.gha_tf_azure.base.AZURE_STORAGE_ACCOUNT_CONTAINER_NAME}"
  #   key                  = "${data.gha_tf_azure.base.AZURE_STORAGE_ACCOUNT_BLOB_NAME}"
  #   use_msi              = false
  #   client_id            = "${data.gha_tf_azure.base.AZURE_CLIENT_ID}"
  #   client_secret        = "${data.gha_tf_azure.base.AZURE_CLIENT_SECRET}"
  #   tenant_id            = "${data.gha_tf_azure.base.AZURE_TENANT_ID}"
  #   subscription_id      = "${data.gha_tf_azure.base.AZURE_SUBSCRIPTION_ID}"
  # }
  # backend "azurerm" {
  #   # backend configuration
  #   # https://developer.hashicorp.com/terraform/language/backend#partial-configuration
  #   use_oidc             = true
  #   use_azuread_auth     = true
  #   use_msi              = false
  #   tenant_id            = ""
  #   client_id            = ""
  #   storage_account_name = ""
  #   container_name       = ""
  #   key                  = ""
  #   # resource_group_name  = "${data.gha_tf_azure.base.AZURE_RESOURCE_GROUP_NAME}"
  #   # subscription_id      = "${data.gha_tf_azure.base.AZURE_SUBSCRIPTION_ID}"
  # }
}

provider "azurerm" {
  #
  features {}
  # subscription_id = var.azure_subscription_id
  subscription_id = var.ARM_SUBSCRIPTION_ID
}

provider "azuread" {
  #

}

# Configure the GitHub Provider
provider "github" {
  token = var.github_pat_token # or `GITHUB_TOKEN`
}

provider "vault" {
  address = var.vault_url
  #  address = "${var.vault_url}:${var.vault_port}"
  #  token   = var.vault_root_token
  #  skip_child_token = true
}