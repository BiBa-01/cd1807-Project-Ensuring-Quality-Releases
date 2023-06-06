resource "azurerm_network_interface" "" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = "var.location"
  resource_group_name = "var.resource_group"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "var.subnet_id"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "var.public_ip_address_id"
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "var.location"
  resource_group_name = "var.resource_group"
  size                = "Standard_DS2_v2"
  admin_username      = "var.vm_admin_username"
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = "var.vm_admin_username"
    public_key = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDP/fVdWF+vqF34dI3Bjs6QE6AyA46oD3Mhfx2vGxh2cwuv/qS/kVMcmoAPlaT04cfIu2dmP8CBIMOtOUVc/GKcD8Lw8YjoHTqKmREdeDGDt0cFZSpNvVrfgTIGqnQ56+e+6XEIlY/rzPWZu7x54K7W1G8VsDRMXqALyiDJtdgP/pujvMmjHe2Sk02KdiCeSZExG+7NMXU2rrNPeKvnSYUjq5+DChYw8MAE5hcD8kw4cL9v/CuV/bpoIEt+HHPzf3UUFaGZabqxY2WsH8QnkSrZxl2koj3Ddwoto85tB0eVQiRKYNZchkSQCGPFlMkFR3QymwhiPfutM7dCa7aBkt+2b8Lc+17TM7aExi6yaZkZ+M0VJOmpgmItr1dZ2xR56yUOYeoho6v12IM1hXSi84I53Bwumpfb6RdnWGdWia2+l98L6vkK8GQljmwzNCyMpaSLIGe12ZB7G/3/AEnoK6jaaVoRtghuWWd9F1Hqs1ZORz8BOvQ60jROM6Xzt1coBhE= birte_balzer@cc-10959323-9c5ddd49f-f7wjg #"file("~/.ssh/id_rsa.pub")"
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
