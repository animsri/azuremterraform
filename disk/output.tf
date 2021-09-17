output "id" {
  description = "The ids of subnets created inside the new vNet"
  value       = "${azurerm_managed_disk.disk.id}"
}