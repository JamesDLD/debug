#Variables declaration
terraform {
  backend "azurerm" {
  }
  required_version = "0.12.3"
}

# -
# - Providers azurerm & Authentication
# -

variable "client_id" {
  description = "The Client Id of the Service Principal."
  type        = string
}

variable "client_secret" {
  description = "The Client Secret of the Service Principal."
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID in which the Subscription exists."
  type        = string
}

variable "subscription_id" {
  description = "The Subscription ID in which the resources will be managed."
  type        = string
}

variable "network_resource_group_name" {
  description = "The resource group name of the network resources."
  type        = string
}

# -
# - Core object
# -
variable "product" {
  description = "The product properties."
  type = object({
    product_name  = string
    entity_suffix = string
    env           = string
  })
}

# -
# - Network object
# -
variable "virtual_networks" {
  description = "The virtal networks with their properties."
  type = list(object({
    id            = string
    address_space = list(string)
    subnets       = any
  }))
}