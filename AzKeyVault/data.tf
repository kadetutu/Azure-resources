/*
data "azurerm_key_vault" "example" {
  name                = "azurevt-f0d3b5ba"
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "test" {
  name      = "azurekey-amernubmoorf"
  key_vault_id = data.azurerm_key_vault.example.id

  # vault_uri is deprecated in latest azurerm, use key_vault_id instead.
  # vault_uri = "https://mykeyvault.vault.azure.net/"
}

output "secret_value" {
  value = "${data.azurerm_key_vault_secret.test.value}"
  sensitive = true
}
*/
