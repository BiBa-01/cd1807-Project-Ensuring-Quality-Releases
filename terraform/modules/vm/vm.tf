resource "azurerm_network_interface" "test1" {
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

resource "azurerm_linux_virtual_machine" "test1" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_B1s"
  admin_username      = "${var.vm_admin_username}"
  network_interface_ids = [azurerm_network_interface.test1.id]

  admin_ssh_key {
    username = "birtebalzer@gmail.com"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYJsolRl6rLWr4XedS/lAGYG3sKwo5lQbZ3emd1xJFRIy7GVDBV5tohVTufPyBlZOYWRnktuTUblghlpheakaiN+aCDen+z5Jfo+xzVcCfxgXw7boC3tvpayiXeeotu3M8qaqoUN6BtzHFOiv4DPb2UqpDS3TrNNSJm6VIeJP0Z9bLy6Fb2S5UXHGsTQMlvZTWyOuL5XabW/CwxKi17/Rhbui+DLoTH+7d+HQz05wLwKKAm5h0NP8Jt2b7TqiAjKyqXh7eeQN1lNTqbLr0eQabsyhGsb/Z5PLZSYDwxwRmyNSsuuj/sNsYD6T+pBYb4TobWm8As9sSN3zhZ3ZRYXHPRWiqIWoqjlZQuQUg2X2ioIwGOMi3ieSjAbwrk6+2fNcjFF6Z2267BgIlK6otQrztT0Tf79NBDe841vanxxm1vqal1zZrE1jc9Qmg/NVbwn+OnI0HUkkM7paz5qRPAk79HrhlOtmep4Y5CNzL5tqtFZkTnLXRcU95PGUFWceGeqE= birte@cc-7646c6f4-77f999f845-jjm27"
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
