data "azurerm_resource_group" "test" {
  name = "existing"
}

output "id" {
  value = data.azurerm_resource_group.test.id
}