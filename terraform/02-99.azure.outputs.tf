# 02-99.azure.outputs.tf

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "sql_server_name" {
  value = azurerm_mssql_server.server.name
}

output "sql_server_admin_username" {
  value = azurerm_mssql_server.server.administrator_login
}

output "sql_server_admin_password" {
  sensitive = true
  value     = local.admin_password
}

output "sql_server_fqdn" {
  value = azurerm_mssql_server.server.fully_qualified_domain_name
}
