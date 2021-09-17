output "id" {
  description = "The ids of subnets created inside the new vNet"
  value       = "${azurerm_virtual_machine.az_virtual_machine.id}"
}