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
  size                = "Standard_B1s"
  admin_username      = "${var.vm_admin_username}"
  network_interface_ids = [azurerm_network_interface.test.id]

  admin_ssh_key {
    username = "odl_user_235647@udacityhol.onmicrosoft.com"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDK3D72ZBmW7/cG79BV6d64+/Nn6CCiLlbHcIwSvCDh3Cggl8JhnR1fVTMxXYOQN0eRM29RyzKFS/F91diQqu4nSypKhT4Qx0ReZvOaQen7xMtqOnNOU85OG7SVul3FiMvXLlmsJLruIrCaVGAllEmDdfD6XqqBJvLlkig9UkHlaHlPuaUlpB0puVGZh1UKemjtRdQFc9lhYH4tvKkj7n5tOXfED454qmgLV2sC4MeHv2/OFrFW7Slnp16pxKBzxMQ98vCF0nrd2XUCBKHtzRp+QD5WvOV2NrW3TP55D1DNl3Rozwr2Mm9nBx9i0gnlISDdfi6kM/x56/hnHvTEE2ipi6cg24hYblZburatIzlfIJxJY6XU5prPxCyImphZ8rmBz9KPiVsKtrR8YkJj1l8zFezizrJOJplC+ZK67BnCE34nhApp1EpsiFsUmkSsrN5ebXPgNFdsGrEjTJKfpMEBgiQqyLE++7nWkC06QhgM9014p1ZIpfIqVIF2re1JV4M= odl_user@cc-ae968735-848d54bc4c-fqjks"
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
