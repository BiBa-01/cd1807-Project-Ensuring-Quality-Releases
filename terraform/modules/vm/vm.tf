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
  network_interface_ids = [azurerm_network_interface.azuredevops_interface.id]
  admin_ssh_key {
    username = "odl_user_235440@udacityhol.onmicrosoft.com"
    public_key = "AAAAB3NzaC1yc2EAAAADAQABAAABgQDh/v2+VUOdqd2NvqAU/VYrw1ZSs9iZ5iE6oHyE5JaOpAlT+KRyfHNAlcOELl3ow7sj68ILFuF4yD31tXqxPr4mkv8TDbVpNEsMJYbxZfZG6kWf3re9boOSadHJRS4jqFRCf8YJm2DBeBSKQkFq4AD67B/J2wWl/2q/svL1qc8jX2knYHye/BiTOH8VLeEP1Nnkl5VZrSyTMuY5hZ/hXSB1u03sbTq60EFLmrDmkcOrrhqBIR2V2t5rC2krVGNZeTGtGZk/qz1zfP5Z2q/5DgylsFUUznXy8eg+ugsSMFGeakjWzxsz9nR01e/1zFM9MYnkr65Pl44U+HT0b6+RLyauwr49zHGvhetKQheho64Ute4hN4t5E0DtBAH1arnjLylR4GdB7XmIavJIkVj8zrDP7bJhfNx18Mth/Gyfz6H8S6YzaFG4HahPa3ZcdOMbg9L5ZoxQBtlKiKkWiM0qk/zf5B5DKk+wAdSXwRgjwV89/IXkNfBcK0fonrgWsn5g2Is= odl_user@cc-1f4a9e36-65cc7d7c7d-gs8mh" 
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
