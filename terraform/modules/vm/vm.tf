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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2cV+EipxVv7wSPsQZQ56DmfCYInlWJO4DtoWrdHQLZh/GkqigS8OWxqjv8PwySv2KjDnFJNd2rJAiArYxlMUa75jtLLVowbwycm4mfuy2rZd2+UOTwCOQl8Q7oQEypVuv69ZS0iIBX3i9qZh4cSXpqMXZVFw0mSbBCWhiZVpK0EvctrEl2501gDA4RMn3gBsbox2zjQn+8nTrOIcs8POu0CN+TqXVuuzwgO2Qi8ZdsqP94cFysTjehC5ejp04z1dmQV06TmT7Ijv7KwOWoQlIy8MA6sx3gyqPKIP0rq42GN1qsh85hRU86A6+B5AVbox51jweShTH/tIWMmcjIsS26brRhgjMR6WxENsoekZLO0MLxEOokJIulrmjYIY7nJ07/0ji2aHImQJByB1nqYiaXcgMGyM/Q26Kc44iyZ3bNGLtHrFmGD6K4jqyYbR6VuHN0BQ1dIsqPT7nOexiWPza8snjjci/oETvkdw04/vExhFMc7GojTdz3qIJxh2qeiM= odl_user@cc-ec83fb63-5494dfcdd9-96wmh"
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
