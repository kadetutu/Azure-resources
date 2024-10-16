# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = var.resource_group_name
  }

  byte_length = 8
}

resource "random_password" "password" {
  length      = 20
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true
}

resource "random_pet" "prefix" {
  prefix = var.prefix
  length = 1
}

data "azurerm_key_vault" "example" {
  name                = var.azure_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "test" {
  name         = var.azure_secret_name
  key_vault_id = data.azurerm_key_vault.example.id

  # vault_uri is deprecated in latest azurerm, use key_vault_id instead.
  # vault_uri = "https://mykeyvault.vault.azure.net/"
}

output "secret_value" {
  value = "${data.azurerm_key_vault_secret.test.value}"
  sensitive = true
}