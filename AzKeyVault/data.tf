/*
data "azurerm_key_vault" "example" {
  name                = "mytestvault146"
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "test" {
  name      = "newkey14"
  key_vault_id = data.azurerm_key_vault.example.id

  # vault_uri is deprecated in latest azurerm, use key_vault_id instead.
  # vault_uri = "https://mykeyvault.vault.azure.net/"
}

output "secret_value" {
  value = "${data.azurerm_key_vault_secret.test.value}"
}

*/