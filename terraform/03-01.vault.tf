# 03-01.vault.terraform

resource "vault_database_secrets_mount" "db" {
  depends_on = [ 
    azurerm_mssql_server.server,
    azurerm_mssql_database.db,
    azurerm_mssql_firewall_rule.db_fw_rule_00,
    azurerm_mssql_firewall_rule.db_fw_rule_01,
    azurerm_mssql_firewall_rule.db_fw_rule_02,
    azurerm_mssql_firewall_rule.db_fw_rule_03,
    azurerm_mssql_firewall_rule.db_fw_rule_04,
  ]
  path = "db"
  mssql {
    # plugin_name    = mssql-database-plugin"
    plugin_name       = "mssql-database-plugin"
    name              = azurerm_mssql_server.server.name
    username          = var.admin_username
    password          = local.admin_password
    contained_db      = true
    rotation_schedule = "0 * * * SAT"
    rotation_window   = 3600
    # connection_url    = "sqlserver://${var.admin_username}:${local.admin_password}@${azurerm_mssql_server.server.fully_qualified_domain_name}:1433" # This seems to "work"
    connection_url    = "server=${azurerm_mssql_server.server.fully_qualified_domain_name};port=1433;database=${azurerm_mssql_database.db.name};user id=${var.admin_username};password=${local.admin_password};app name=vault;"
    # connection_url    = "sqlserver://${azurerm_mssql_server.server.fully_qualified_domain_name}:1433;database=${azurerm_mssql_database.db.name};user id=${var.admin_username};password=${local.admin_password};app name=vault;" # Does not work
    allowed_roles = [
      "test",
    ]
  }
}

resource "vault_database_secret_backend_role" "test" {
  name        = "test"
  default_ttl = 3600  # 1 hour in seconds
  max_ttl     = 86400 # 24 hours in seconds
  backend     = vault_database_secrets_mount.db.path
  db_name     = vault_database_secrets_mount.db.mssql[0].name
  creation_statements = [
    "CREATE USER [{{name}}] WITH PASSWORD = '{{password}}';",
  ]
  revocation_statements = [
    "DROP USER IF EXISTS [{{name}}];",
  ]
}





