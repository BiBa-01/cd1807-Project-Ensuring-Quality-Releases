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
  network_interface_id = []
  admin_ssh_key {
    username = "odl_user_235335@udacityhol.onmicrosoft.com"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJ4y77ET9reHxEEDHmJCNZ4t+SgcVkoq2RxDmVxxKhyr4uv/vo/uVh7fMczTu6oo0VsuBbE+xoPNjkWnEOVwiPlNN7O1axhScXSue8LY4ZeEisDB9cJ9CUdh8pt4cM/6Uodag3TVIEJVF5ZkH0EHqzH79UCA/FKjJzXUz8EkMfyuXWoa21lvXQssry5p0f0Sux0xXxutEiNMqdw4eiTjbpYTwaayTe3lGodO1RX6+WXLkv0PEfpyklTE/rC8gqYjBgBkg9GzRfRIDZ/Wq56F2V8Y7qMwcuInw8MxBwTfxZIWMLx1/s2t1OH7U3Qk6/vtZrqyW10IxTK9FaPV8c6lu2B2Rop3AROFU46kv3WflY5wu0TEjg47prQa0mk2hZ3Kp8+KuWxErZxuTHs+nNmcFhhRhOVa7R7A27zD6z5dUs2yEcg52tbba2PvksX61MXK+R+j9t/LxEg6nMvH9tae8A5bJrHIZ6/Ou+95lNZHY1tB/jiObEzIFsvF0ATPn8dzs= odl_user@cc-23754026-7d9fcc7cd9-hbrqh" 
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
