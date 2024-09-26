resource "random_id" "id" {
    keepers = {
      resource_group_name = var.resource_group_name
    }
    byte_length = 4
}

resource "random_string" "azure_kv_key_name" {
  length = 12
  lower = true
  upper = false
  numeric = false
  special = false
}

resource "random_password" "azure_kv_secret" {
  length = 16
  special = true
  override_special = "!#$&%.,"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "az_kv" {
  name = "${var.vault_prefix}-${random_id.id.hex}"
  resource_group_name = var.resource_group_name
  location = var.resource_group_location
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = var.kv_sku
  access_policy = {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    secret_permissions = var.secret_permissions

  }
}

resource "azurerm_key_vault_secret" "vm_secret" {
  name = "${var.key_prefix}-${random_string.azure_kv_key_name.result}"
  key_vault_id = azurerm_key_vault.az_kv.id
  value = random_password.azure_kv_secret.result
}