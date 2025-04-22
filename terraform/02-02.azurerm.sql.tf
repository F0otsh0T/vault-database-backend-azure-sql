# 02-02.azurerm.sql.tf


################################################
# AzureRM MS SQL Server

resource "azurerm_mssql_server" "server" {
  # name                         = random_pet.azurerm_mssql_server_name.id
  name                         = "${random_pet.example.id}-sql"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  administrator_login          = var.admin_username
  administrator_login_password = local.admin_password
  version                      = "12.0"
}

resource "azurerm_mssql_database" "db" {
  name      = "${random_pet.example.id}-db"
  server_id = azurerm_mssql_server.server.id
}

resource "azurerm_mssql_firewall_rule" "db_fw_rule_00" {
  name             = "FirewallRule00"
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "db_fw_rule_01" {
  name             = "FirewallRule01"
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = "1.1.1.1"
  end_ip_address   = "9.255.255.255"
}

resource "azurerm_mssql_firewall_rule" "db_fw_rule_02" {
  name             = "FirewallRule02"
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = "11.0.0.0"
  end_ip_address   = "172.15.255.255"
}

resource "azurerm_mssql_firewall_rule" "db_fw_rule_03" {
  name             = "FirewallRule03"
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = "11.0.0.0"
  end_ip_address   = "172.15.255.255"
}

resource "azurerm_mssql_firewall_rule" "db_fw_rule_04" {
  name             = "FirewallRule04"
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = "172.32.0.0"
  end_ip_address   = "233.255.255.255"
}
