#resource "azurerm_resource_group" "test" {
  #name     = "${var.resource_group}"
 # location = "${var.location}"
#}
data "azurerm_resource_group" "test" {
  name = "existing"
}

output "id" {
  value = data.azurerm_resource_group.test.id

}
