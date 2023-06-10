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
    username = "odl_user_235472@udacityhol.onmicrosoft.com"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDxv5dqUNKdx3MkUUxWQz1YCxUHZU+pKZve1OA2eLsrm++B6MFoZV9GBKEi8RFIWA5uoHIGE7aox6LMYOImQFVKXy0zT/7PPv6xhm9I0A/nvz43zdfCvMYaMuxJ8t6ZrD3vlxHdq3Uei+tgVyyy7HQcw8J0jy8S/G1chgzmgxLC+WGCSTqwWtrPWCnbgmo2o46dRbSB6AHomNXX7IIf39pKJ4vZabcGuGWbCl7X8B9HvlbC0XkA9QhHtJcP3Aj6rpOhLD6fMU7FDp456IajLSCGIPo5/SYzSq3HI7S5V3sDtp1VrSzVlObkaYOh7RG7c20C2wNwH5BDXBFNYgUOHoCujqVAiRumIJMpzH4+2J8N7CKGkUdwbVP0HiVrpAVx72bJD1KQsFOud8hOlF5vZ7AuRh0ra5AhS4vZ+Wq57sTrB0PdHmt+7cJlawMiKjvShInEYbVRM8k0KluT4DHgSq2W4DpK9XmeT2e9ZTekMGy078JaXwwcH5OsN7y6wJO6Gc= odl_user@cc-7c05eda8-6d7464d4b4-lwlkl"
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
