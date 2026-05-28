resource "azurerm_network_interface" "nic" {
  count = 2

  name = "${var.environment}-nic-${count.index}"
  location = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name = "internal"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  count = 2

  name = "${var.environment}-vm-${count.index}"
  resource_group_name = var.resource_group_name
  location = var.location
  size = "Standard_B1s"

  admin_username = "azureuser"
  admin_password = "Password@12345"

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
}