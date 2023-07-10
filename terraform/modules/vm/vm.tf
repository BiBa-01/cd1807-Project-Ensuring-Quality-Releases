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

  admin_ssh_key = {
  username = "adminuser"
  public_key = "AAAAB3NzaC1yc2EAAAADAQABAAABgQDfJRlaoTLF6zA7MEwhM72RwNjCw9B+ZaQTkDItOPabdE+dyy9Qp88tHu/A1PZwxcZejr814k0Aey8EE8PnvUc6CtvE99hUpk54Jqk7/y0FMVh9oSoQfKxl4t2YZuUhhMB1x9fAWzxunCUQzkCfTM9H7H0WiZF9Jj+bF1Y83oRFMIDaV4avdNH3giyYGbzWiGZwnFrbrVOdhQXRDKQh2QIdSr5j3VtZ2INSv2ytjLFw22rjqPh7MoEYkn6Ald6IxZqi0aCKRf/kZL4oIW9GWxVThk/9e+iqbTbZ4mNu6WVieyfhJ/SJFBWC4m7pHBAb9BHxDDZ0bpSAZK+rrOpLf8z99FE9R9WEvfJTJw982omAutLfO6JY9kwXeZ5Fg58oa2brv07zfIrZjWNbTl233b0b7utAHUDnh0oMOc6k1JgZwVjvtdULjxbhFNf6AVdSFezrcvBOyBposjYpXFouflxngNjSFwqQoyJCUPqEeqJg8EIWeu37Iw9jLqvD70y13fk= odl_user@cc-920f4460-565598d485-khldw" #file("~/.ssh/id_rsa.pub")
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

