resource "azurerm_network_interface" "test" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"


  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip_address_id}"
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            =  var.location #"${var.location}"
  resource_group_name =  var.resource_group #"${var.resource_group}"
  size                = "Standard_B1s"
  admin_username      =  var.vm_admin_username #"${var.vm_admin_username}"
 # network_interface_ids = [azurerm_network_interface.test.id]

  admin_ssh_key {
    username = var.vm_admin_username
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3cNDJ7MUZw/iaeXBW2fHRXkqNeqNL+bFTsjjMYH48T2VFpEO6WRajpSE7BbQwMCUIhRb2njuREoj1X7OMvoJlS6VUI6SF7aamPQMi7rbHn69N7PNmcqHKBau4CLIcGcSksNEa2mT6LEYaAZXjSj4whhJKdxvZ0UO/hUScVUU/ji4zd4Nd61f7SadKBRJTIgh79wAE3hvAoY3M4pUAdILbpZeeoup7EVr4h1TMh3dUzHFxvcAPoE8A0NxLtsbKKXlHecMiRSClvdXQ/uI3kINkpZgSD7Z2JGQDNKulFt+VQEwkghLhvO37mSoDZcGdMp7OHPad1NVSGEJhTFLLmkr7EtVzHgulF9YPu5u4EL6zsS02mJcbaIW29AlgrLBoJMCfgxM/PqFETKnt9HWg1Tynd6HjEfg5qvhYVGr+e+Pfk6lHAhRDp1bRbEDtP0B6NmXPKbpERVLq7n8lBKYIPQPXwbxEJBqPzxi4frNhGwQe7N9ZiwnXnE/yMIG7bkmJVEM= birte@cc-20ab936-7c5cfcbf7f-ctwnw"
}

  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

