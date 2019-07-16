# -
# - Providers azurerm
# -

provider "azurerm" {
  version         = "1.31.0" #"Terraform provider azuread version, see changelog for info : https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md"
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

# -
# - Call module
# -
module "gtio-network-Demo" {
  source                      = "../../gtio-network/"
  product                     = var.product
  network_resource_group_name = var.network_resource_group_name
  virtual_networks            = var.virtual_networks
  network_security_groups     = var.network_security_groups
}
