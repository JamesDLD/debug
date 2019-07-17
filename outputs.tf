# -
# - Network
# -
output "vnets_ids" {
  value = azurerm_virtual_network.vnets.*.id
}
