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
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_DS2_v2"
  admin_username      = "${var.vm_admin_username}"
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username = "odl_user_235500@udacityhol.onmicrosoft.com"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCt++BsIN98uBl5NPtR6cMP+1LzjlRFS3REOk4MUpB/UWTfaycVTjwAqYU68+/z1kBOROG6VPeWF46GGazMdTE/QLU1r6nxUjW0yi/jr2kETGpUUIL5cEcCyHvXbAaiwvgC6aHesHr0F0JGR4Dk0WqtWiyln+Rw+chfnlvgLJt1RJd6SyPC0pYnNWHr+5+iBdFSMZohcvp9oOEdPT4V646s/dB9rAKk8Sc7Po5yyp5eZfcq8E7yydoSKM1Jd5w0S/kFkefY56sGsW6XSY8GsyfT4ipnOubqUaiYYAGwlN2WAvV+c8IfKbWFnGUHBszcKZ3pYNRMyNfdQoqt7TGJPwd8qyPmutlhE3PnmU9rbz2aTWndsYJ4dK0oEP+ObTZIZg54GvEsi+VNbiHITxLewQIaLr5oT1SqglphHfzQh3tAsqYhLtHbcsgyTE41cA6nNY/JNu5dFagx59f+jJkz9GFqjU8pQCbk8Cjxgl6YOrm+oHH3ebmnuSLVaeYuP0qqaX0= odl_user@cc-8563cb8f-5688dc5c88-ggngt"
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
