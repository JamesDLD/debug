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

variable "network_ddos_protection_plan" {
  description = "Network network ddos protection plan parameters."
  type = object({
    id                  = string
    name                = string
    resource_group_name = string
  })
  default = {
    id                  = "/subscriptions/43c91cd1-0bbf-40c0-9c3a-401b8dfd2dd3/resourceGroups/caas-infra1-svcd-gal-qual-rg1/providers/Microsoft.Network/ddosProtectionPlans/westeurope-protection-plan1"
    name                = "westeurope-protection-plan1"
    resource_group_name = "caas-infra1-svcd-gal-qual-rg1"
    #Data source feature request in progress : https://github.com/terraform-providers/terraform-provider-azurerm/issues/3851
  }
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
    bastion       = bool
  }))
}

# -
# - Network Security Group
# -
variable "network_security_groups" {
  description = "The network security groups with their properties."
  type = list(object({
    id             = string
    security_rules = any
  }))
}

