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
  network_interface_ids = [azurerm_network_interface.test.id]

   admin_ssh_key {
    username = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub") #  "AAAAB3NzaC1yc2EAAAADAQABAAABgQC7V+IwEuZBg/p8gDBkb38npNBFgSDWQZANnlzyhvAWs92gJfJp7cty2mqblCGltEmKzfZXglcZJ3pzU+7iV8DVFU1zqUhSLLycWStBTusHKwjx/0FYCcwjmKJd3fGeDntApiZ+w97XOCIcBre7VCArMmR5du51yT2KH4HT4xsyjVQWNk6v+hfKQWlcAx24bxL6R9Dev1YXNEdJT9RWCdf85fflOR+eyiFAMDvnrpRDi/JiYdc8o8jcTaLb6PXd4Gntzfr8sWx56JtK/KWOvEF+1XbYEHUcRhF9FEutOwggPOFSv7WBA4Cbu+JN+O5x7Iy7atU8PacFviW8b1ja3hOWnIj4L7FIEjFPVEa636+6pGanMCBpa0oi/dWCkd9pKf78/rQdWv+W6c8mzUxrbxXGH5BGAIEYY2S+p6ASv5dbOlUtZDnNb9BXaz5xNzwpTjTDSTMy2azjp3Y2S8jSSl955B18EtRjBDA8/930A+u3Qu8oBA5wYeVnGJlMU7AboCc= birte@cc-914822a8-999f76d76-hrb82"
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

