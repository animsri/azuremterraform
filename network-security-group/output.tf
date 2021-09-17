output "id" {
  description = "The ids of subnets created inside the new vNet"
  value       = "${azurerm_network_security_group.network_security_group.id}"
}