variable "resource_group_location" {
  description = "Location of the resource group."
}

variable "resource_group_name" {
  description = "Name of the resource group."
}

variable "prefix" {
  type        = string
  default     = "win"
  description = "Prefix of the vm resource name"
}

variable "azure_vault_name" {
  type = string
  description = "name of Azure vault hosting the secrets"
}

variable "azure_secret_name" {
  type = string
  description = "name of Azure secret to use for new VM"
}