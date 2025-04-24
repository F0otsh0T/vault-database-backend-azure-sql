# 03-02.vault.tf
# Method utilizing Terraform Vault Resource "vault_mount"
# Utilizes same "vault_mount" (type = "database" / path = "mssql") while
# allowing for multiple "vault_database_secret_backend_connection" and
# "vault_database_secret_backend_role" pairs.
# https://developer.hashicorp.com/vault/docs/secrets/databases/mssql#example-for-azure-sql-database

resource "vault_mount" "db2" {
  depends_on = [ 
    azurerm_mssql_server.server,
    azurerm_mssql_database.db,
    azurerm_mssql_firewall_rule.db_fw_rule_00,
    azurerm_mssql_firewall_rule.db_fw_rule_01,
    azurerm_mssql_firewall_rule.db_fw_rule_02,
    azurerm_mssql_firewall_rule.db_fw_rule_03,
    azurerm_mssql_firewall_rule.db_fw_rule_04,
  ]
  path = "mssql"
  type = "database"
}

resource "vault_database_secret_backend_connection" "db2" {
  name              = "${random_pet.example.id}-connection"
  backend           = vault_mount.db2.path
  plugin_name       = "mssql-database-plugin"
#   rotation_schedule = "0 * * * SAT"
#   rotation_window   = 3600
  allowed_roles = [
    "test2",
  ]
  mssql {
    username          = var.admin_username
    password          = local.admin_password
    contained_db      = true
    # connection_url    = "sqlserver://${var.admin_username}:${local.admin_password}@${azurerm_mssql_server.server.fully_qualified_domain_name}:1433" # This seems to "work"
    connection_url    = "server=${azurerm_mssql_server.server.fully_qualified_domain_name};port=1433;database=${azurerm_mssql_database.db.name};user id=${var.admin_username};password=${local.admin_password};app name=vault;"
    # connection_url    = "sqlserver://${azurerm_mssql_server.server.fully_qualified_domain_name}:1433;database=${azurerm_mssql_database.db.name};user id=${var.admin_username};password=${local.admin_password};app name=vault;" # Does not work
  }
}

resource "vault_database_secret_backend_role" "test2" {
  name        = "test2"
  default_ttl = 3600  # 1 hour in seconds
  max_ttl     = 86400 # 24 hours in seconds
  backend     = vault_mount.db2.path
  db_name     = vault_database_secret_backend_connection.db2.name
#   db_name     = vault_database_secrets_mount.db.mssql[0].name
#   creation_statements = [
#     "CREATE USER [{{name}}] WITH PASSWORD = '{{password}}';"
#   ]
  creation_statements = [
    "CREATE USER \"{{name}}\" WITH PASSWORD = '{{password}}';",
    # "CREATE USER \"vault\" WITH PASSWORD = 'ABC123_changeme';",
  ]
  revocation_statements = [
    "DROP USER IF EXISTS [{{name}}];",
    # "DROP USER IF EXISTS \"vault\";",
  ]
}






