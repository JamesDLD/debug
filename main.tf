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
# - Data gathering
# -
data "azurerm_resource_group" "network" {
  name = var.network_resource_group_name
}

# -
# - Network
# -
resource "azurerm_virtual_network" "vnets" {
  count               = length(var.virtual_networks)
  name                = "test${var.product["entity_suffix"]}-${var.product["product_name"]}-${data.azurerm_resource_group.network.location}-${var.product["env"]}-vnet${var.virtual_networks[count.index]["id"]}"
  location            = data.azurerm_resource_group.network.location
  resource_group_name = data.azurerm_resource_group.network.name
  address_space       = var.virtual_networks[count.index]["address_space"]

  dynamic "subnet" {
    for_each = var.virtual_networks[count.index]["subnets"]
    content {
      name           = lookup(subnet.value, "name", null)
      address_prefix = lookup(subnet.value, "address_prefix", null)
    }
  }

  tags = data.azurerm_resource_group.network.tags
}