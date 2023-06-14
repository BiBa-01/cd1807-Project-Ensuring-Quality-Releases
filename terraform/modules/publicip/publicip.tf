resource "azurerm_public_ip" "test" {
  name                = "${var.application_type}-${var.resource_type}-pubip"
  location            = "${var.location}"
  resource_group_name = "azurerm_resource_group.test"#"${var.resource_group}"
  allocation_method   = "Dynamic"

}