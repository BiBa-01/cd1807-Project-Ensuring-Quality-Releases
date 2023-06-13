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
    username = "odl_user_235647@udacityhol.onmicrosoft.com"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDY4azTXB1e4KpBg/8pDjm8qMCu9Ls4TZqh4pku3YQC2qbC9xFU/slERMh3mU5CCueBnEKpFSS/X9nRKue6Bq9uD+hCBIVO0ptxRChglaqJBmXryH2kqFW83mhrLn6wyTlEjWHDP5F7bxgPTDelzYyjIdjBK2MnLkC73nqfMSXT1t0GfaOXniYsHgF0TjEY+Y0FkffY+d5c1x/AnvFHiulx80fGLj+uGBeajFfvmZt4cVn3zHndC17x6IZFD2Yv3MrbFnIgjjW0LTW1JFuQE9Avd2PWq+m1Q/xz8ePF6r21q3LB3SIRgCYB/GTfu1d0p6RfTAhGKJMyIfkwY1tZDowm4mzdKECtnlkD613MjGSmiFzEYz3m2Wai5+Y+R0c3entwhmKAiTqvXXoKN5oFg9o6L8oOrECg0u60dFbw44zFp5TxMSbk32o19WaJojH39lu/hLi8Lr1S8tQQ/BjdJj/9WQFQVnFyOKpa6fv7KIdWf8bGQleyJr55mqw3akVXiCc= odl_user@cc-ba6bf20a-64ddcbcdd8-kphd4"
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
