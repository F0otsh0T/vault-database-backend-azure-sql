# 00.variables.tf

# variable "" {
#     type = string
#     description = ""
#     sensitive = false
#     default = ""
# }

################################################
# DEMO VARIABLES

variable "user" {
  type        = string
  description = "Demo User"
  sensitive   = false
  default     = "demouser"
}

################################################
# RANDOM VARIABLES

variable "resource_group_name_prefix" {
  type        = string
  description = "Resource Group Name Prefix"
  sensitive   = false
  default     = "rg"
}

variable "azurerm_mssql_server_name_prefix" {
  type        = string
  description = "Azure SQL Server Name Prefix"
  sensitive   = false
  default     = "sql"
}

variable "admin_password" {
  type        = string
  description = "Admin Password"
  sensitive   = true
  default     = "ABC123_changeme"
}

################################################
# AZURE VARIABLES

variable "client_id" {
  type        = string
  description = "Azure Client ID"
  sensitive   = false
  default     = ""
}

variable "client_secret" {
  type        = string
  description = "Azure Client Secret"
  sensitive   = true
  default     = ""
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  sensitive   = false
  default     = ""
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  sensitive   = false
  default     = ""
}

variable "ARM_SUBSCRIPTION_ID" {
  type        = string
  description = "Azure Subscription ID"
  sensitive   = false
  default     = ""
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
  sensitive   = false
  default     = ""
}

variable "azure_tenant_id" {
  type        = string
  description = "Azure Tenant ID"
  sensitive   = false
  default     = ""
}

variable "ARM_TENANT_ID" {
  type        = string
  description = "Azure Tenant ID"
  sensitive   = false
  default     = ""
}

variable "azure_user_object_id" {
  type        = string
  description = "Azure User Object ID"
  sensitive   = false
  default     = ""
}

variable "azure_environment" {
  type        = string
  description = "Azure Environment"
  sensitive   = false
  default     = "AzurePublicCloud"
}

variable "azure_region" {
  type        = string
  description = "Azure Region"
  sensitive   = false
  default     = "westus2"
}

variable "AZURE_RESOURCE_GROUP_NAME" {
  type        = string
  description = "Azure Resource Group Name"
  sensitive   = false
  default     = "azuresql-rg"
}

variable "AZURE_STORAGE_ACCOUNT_NAME" {
  type        = string
  description = "Azure Storage Account Name"
  sensitive   = false
  default     = "azuresql-sa"
}

variable "AZURE_STORAGE_ACCOUNT_CONTAINER_NAME" {
  type        = string
  description = "Azure Storage Account Container Name"
  sensitive   = false
  default     = "azuresql-sa-container"
}

variable "AZURE_STORAGE_ACCOUNT_BLOB_NAME" {
  type        = string
  description = "Azure Storage Account Blob Name"
  sensitive   = false
  default     = "azuresql-sa-blob"
}

variable "ARM_CLIENT_ID" {
  type        = string
  description = "Azure Client ID"
  sensitive   = false
  default     = ""
}

variable "ARM_CLIENT_SECRET" {
  type        = string
  description = "Azure Client Secret"
  sensitive   = true
  default     = ""
}

##################################################
# MS SQL VARIABLES
variable "admin_username" {
  type        = string
  description = "MS SQL Admin Username"
  sensitive   = false
  default     = "sqladmin"
}

################################################
# GITHUB VARIABLES

variable "github_pat_token" {
  type        = string
  description = "GitHub Personal Access Token"
  sensitive   = true
  default     = ""
}

# variable "GITHUB_TOKEN" {
#   type        = string
#   description = "GitHub Token"
#   sensitive   = true
#   default     = ""
# }

variable "github_bound_audience" {
  type        = string
  description = "GitHub Bound Audience"
  sensitive   = false
  default     = "https://github.com/"
}


################################################
# VAULT VARIABLES

# variable "vault_root_token" {
#   type        = string
#   description = "Vault Root Token"
#   sensitive   = false
#   default     = ""
# }

variable "vault_namespace" {
  type        = string
  description = "Vault Namespace"
  sensitive   = false
  default     = "admin"
}

variable "vault_url" {
  type        = string
  description = "Vault URL"
  sensitive   = false
  default     = "http://localhost:8200"
}


