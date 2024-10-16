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