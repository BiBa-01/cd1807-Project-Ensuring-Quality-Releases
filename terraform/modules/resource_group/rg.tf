terraform import azurerm_resource_group.test /subscriptions/157081ad-2288-4aa4-b6d0-69f2165b7326/resourceGroups/Azuredevops

resource "azurerm_resource_group" "test" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}