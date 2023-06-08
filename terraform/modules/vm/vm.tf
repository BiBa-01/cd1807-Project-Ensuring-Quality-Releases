resource "azurerm_network_interface" "azuredevops_interface" {
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
  network_interface_ids = []
  admin_ssh_key {
    username = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDXg4XFyaZElYVo0mljBKi33xS9RPDqYiehibpex6l3kYZlxspVt3eCkucw0lLSOaL2mx37Z3p9n7na+94uev5MwfxqALLTKSRXQQnNgyj4GJGEFisXR3xOElT/TsLQmuEBR7EtN1Y4ho8ODBs2pcH+MLt26DC1+EXC8LtJ6KxgLF//brBOkHhWqJIuuI20Zyo30hnNhLMSqOjOWi2SyuBJyZqaIlStFsld9RmPmvLFzX56yr1JRbvZyBcBTqcdorQcdBCSFtTYavPKBKye3Hi9UAyJYqcZElcsmZqxz3vEPw/jMRBZG4slV7Eu8zW8sN6tpmf0fQFki83ZD5V5A7IV8XFFG+tc+mSb25cWyMwNdMi/mpbENVu3PYumeoCChBedIdF5mFN/TmNb11VO4YLFgsUjLAAROTSiGT//NkBkpIyueX/TFF0= odl_user@cc-f958-ab119495-6448dd6dbb-pcbfh" 
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
