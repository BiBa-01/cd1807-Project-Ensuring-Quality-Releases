resource "azurerm_resource_group" "test1" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}