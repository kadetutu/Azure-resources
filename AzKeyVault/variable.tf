variable "resource_group_name" {
    type = string
  description = "Name of the resource group."
}

variable "resource_group_location" {
    type = string
    description = "Location of the resource group."
}

variable "vault_prefix" {
    type = string
    description = "prefix for Azure Key Vault name"
    default = "azurevt"
}

variable "secret_prefix" {
    type = list(string)
    description = "prefix for Azure vault key name"
    
}

variable "env" {
  description = "enviroment name"
  type = string
  default = "dev"
}

variable "kv_sku" {
  type = string
  default = "standard"
}

variable "secret_permissions" {
  type        = list(string)
  description = "List of secret permissions."
  default     = ["Set","Get","List","Delete"]
}

variable "key_permissions" {
  type        = list(string)
  description = "List of secret permissions."
  default     = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy"]
}

variable "key_type" {
  description = "The JsonWebKeyType of the key to be created."
  default     = "RSA"
  type        = string
  validation {
    condition     = contains(["EC", "EC-HSM", "RSA", "RSA-HSM"], var.key_type)
    error_message = "The key_type must be one of the following: EC, EC-HSM, RSA, RSA-HSM."
  }
}

variable "key_ops" {
  type        = list(string)
  description = "The permitted JSON web key operations of the key to be created."
  default     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
}

variable "key_size" {
  type        = number
  description = "The size in bits of the key to be created."
  default     = 2048
}