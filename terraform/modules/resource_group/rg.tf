resource "azurerm_resource_group" "test" {
  name     = Azuredevops # "${var.resource_group}"
  location = "${var.location}"
}

