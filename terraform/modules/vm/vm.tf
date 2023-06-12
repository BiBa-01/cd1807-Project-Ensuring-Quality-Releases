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
    username = "odl_user_235618@udacityhol.onmicrosoft.com"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgJzOveqJjcrv/36Nd8jClN7g+h8BT/tPKVLjSapMgaAnrKjqU+jqJPpbiXgo/uwUjlCBJNNlpJx8bu22587krX6zqTfNsXEE+488auqwTHXiYb4438XyBqGszbLz4kexNUa6VqbTF0kX6tQ6sObyXEhQOeqUsQeCNwPG/Q3LxTD6LSDoCZD1Msp0PD1EGvHPud36ot6mERGz0M5p8ee/ObtJfvG5iZe5EDoFvATvkIBrg/V1Nn2+iYr5tGS6SHoqz+zCScwER4JI35tQArJhLAGJJPN2Z/lSN+pA6PMaCcUqlmOJ/arGyJdBk7HgOvq/OK/IyRxXiWDNL1q4i7o5WR+T6azx2o/T4o0BzJXGgW3dRMFW98PidTtXRZYy2PSiZO+S2ufCLfP0SguODr0JuNUew1jl3lufT1icm5m7s8L80NbXGozqZP7InWcCJv9nTCNDjKCQkeNrDntQBE5X7IwVIUY4q0ZEfInwiqJ2YqABwG6RI6IhhJx30jqxIxgc= odl_user@cc-995681bc-8f88588bb-9kd2k"
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
