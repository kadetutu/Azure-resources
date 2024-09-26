variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "rg_sb_eastus_231697_1_172720426184"
  description = "Name of the resource group."
}

variable "prefix" {
  type        = string
  default     = "win-"
  description = "Prefix of the vm resource name"
}