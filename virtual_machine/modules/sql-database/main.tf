resource "azurerm_mssql_database" "sql_database" {
    for_each = var.sql_database
  name         = each.value.name
  server_id    = each.value.server_id
  collation    = each.value.collation
  license_type = "LicenseIncluded"
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
}