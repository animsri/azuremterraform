resource "azurerm_network_interface" "az_network_interface" {
  name                = "${var.server_name}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  tags                = "${var.tags}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "az_nic_sg_association" {
  network_interface_id      = azurerm_network_interface.az_network_interface.id
  network_security_group_id = "${var.network_security_group_id}"
}

resource "azurerm_virtual_machine" "az_virtual_machine" {
  name                  = "${var.server_name}"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  network_interface_ids = [azurerm_network_interface.az_network_interface.id]
  vm_size               = "${var.vm_size}"
  tags                  = "${var.tags}"

  storage_image_reference {
    publisher = "center-for-internet-security-inc"
    offer     = "cis-rhel-8-l1"
    sku       = "cis-rhel8-l1"
    version   = "1.0.19"
  }

  storage_os_disk {
    name              = "${var.server_name}-OSdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.server_name}"
    admin_username = "install"
    admin_password = ""
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}


resource "azurerm_virtual_machine_data_disk_attachment" "az_attach_disk_to_vm" {
  managed_disk_id    = "${var.managed_disk_id}"
  virtual_machine_id = azurerm_virtual_machine.az_virtual_machine.id
  lun                = "10"
  caching            = "ReadWrite"
}