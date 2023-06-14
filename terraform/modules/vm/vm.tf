resource "azurerm_network_interface" "test" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = "${var.location}"
  resource_group_name = "azurerm_resource_group.test" #${var.resource_group}"


  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip_address_id}"
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_B1s"
  admin_username      = "${var.vm_admin_username}"
  network_interface_ids = [azurerm_network_interface.test.id]

  admin_ssh_key {
    username = "odl_user_235734@udacityhol.onmicrosoft.com"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1X2jIbClkntYDtbcjXGBrEP4HneVk3PIPwV8CrYVKTsCRLYj0Yzjw1EnTppJEEojJlH1n/gPHiVnWDA3D2H8HPEjNpBgWgwLXGZ8fFrNLTFgdMpuSjtBBvpDjsVWv7bh4JEsnM+XvMurOwoO1ro3q6PYt8tHgIkCCt6VfPHAIgID1FU099RI/YO0P5H4hm3V6MvuQgZhp38vP4ArbI+nCIVwjsFDBeMRMceSUj6bgSTZ+4bTG32BK2udVhXM2UWOUmjkD3x4lDepv0FuY87wZdQXLs+ft7dMm0kG/DEmaO6ONhOhGA7TMacgEfpAsdNPH8n0E7gnknKBy1unhjK2NmF5cW3JRrS2BLdkUFQLGSMRrgMiRZbSXfO7nS8TQWWckAcBllu8QwqmnJrmydqm2/S/sijPzM7HJyhNgZ5Na5pBqWoT+vt9z8llsrdL+VOBBKdVIsVYBn64sEBnxj0lgFaLuICSu6xMvo614+PrkBfGcheyTWN0ljPO/qZ/zX+s= odl_user@cc-1ede84d0-66b67b4656-fzhz7"
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
