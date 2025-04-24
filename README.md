---
title: HashiCorp Vault Dynamic Database Backend - AzureSQL
description: Integrate HashiCorp Vault Dynamic Database Backend and AzureSQL Database for vending dynamic credentials
---

# HashiCorp Vault Dynamic Database Backend - AzureSQL



---

Vars:
- `ARM_SUBSCRIPTION_ID`
- `ARM_TENANT_ID`
- `ARM_CLIENT_ID`
- `ARM_CLIENT_SECRET`
- `VAULT_ADDR`
- `VAULT_NAMESPACE`
- `VAULT_TOKEN`

Run Terraform
```shell
❯ terraform -chdir=./terraform init
❯ terraform -chdir=./terraform plan
❯ terraform -chdir=./terraform apply --auto-approve
```
```shell
Apply complete! Resources: 14 added, 0 changed, 0 destroyed.

Outputs:

resource_group_name = "relative-wombat-rg"
sql_database_name = "relative-wombat-db"
sql_server_admin_password = <sensitive>
sql_server_admin_username = "sqladmin"
sql_server_fqdn = "relative-wombat-sql.database.windows.net"
sql_server_name = "relative-wombat-sql"
sql_server_name = "relative-wombat-db"
```

Get Database Credentials:
- `db/creds/test` (./terraform/03-01.vault.tf)
    ```shell
    ❯ vault read db/creds/test
    Key                Value
    ---                -----
    lease_id           db/creds/test/PO25r8Wc6z8yzfrb2gz5W0ul.Rbvq6
    lease_duration     1h
    lease_renewable    true
    password           2jG...NN1t
    username           v-token-hcp-root-test-z6c...-174...
    ```
- `mssql/creds/test2` (./terraform/03-02.vault.tf)
```shell
❯ vault read mssql/creds/test2
Key                Value
---                -----
lease_id           mssql/creds/test2/Hiu9ubCselJU5r0Ko2g0WyJL.Rbvq6
lease_duration     1h
lease_renewable    true
password           ena...Q7E0
username           v-token-hcp-root-test2-1Oq...-174...
```



## APPENDIX:
#### REFERNCE LINKS:
- https://developer.hashicorp.com/vault/tutorials/db-credentials/database-root-rotation#rotate-the-root-credentials
- 