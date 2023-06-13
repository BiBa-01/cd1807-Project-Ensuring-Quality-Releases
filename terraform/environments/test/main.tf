provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {
    resource_group{
     prevent_deletion_if_contains_resources = false
    }
   }
 }
terraform {
  backend "azurerm" {
    storage_account_name = "tfstatebb6"
    container_name       = "tfstatebb6"
    key                  = "test.terraform.tfstate"
    #account_key         = "FmwJoPIyWHslhogAQ5vUS4PRrd7utlRkkLlYI0v4oKIujxIcFn97lUukwFTOcZBSUSLh7b1GksqQ+AStikKfqw=="
    access_key           = "FmwJoPIyWHslhogAQ5vUS4PRrd7utlRkkLlYI0v4oKIujxIcFn97lUukwFTOcZBSUSLh7b1GksqQ+AStikKfqw=="
   }
 }

resource "azurerm_resource_group" "test" {
  name     = "Azuredevops"
  location = "eastus"
}

module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}
module "network" {
  source               = "../../modules/network"
  address_space        = "${var.address_space}"
  location             = "${var.location}"
  virtual_network_name = "${var.virtual_network_name}"
  application_type     = "${var.application_type}"
  resource_type        = "NET"
  resource_group       = "${module.resource_group.resource_group_name}"
  address_prefix_test  = "${var.address_prefix_test}"
}

module "nsg-test" {
  source           = "../../modules/networksecuritygroup"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "NSG"
  resource_group   = "${module.resource_group.resource_group_name}"
  subnet_id        = "${module.network.subnet_id_test}"
  address_prefix_test = "${var.address_prefix_test}"
}
module "appservice" {
  source           = "../../modules/appservice"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "AppService"
  resource_group   = "${module.resource_group.resource_group_name}"
}
module "publicip" {
  source           = "../../modules/publicip"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "publicip"
  resource_group   = "${module.resource_group.resource_group_name}"
}
module "vm" {
  source           = "../../modules/vm"
  location         = "${var.location}"
  resource_group   = "${module.resource_group.resource_group_name}"
  application_type = "${var.application_type}"
  #network_interface_ids = "${var.network_interface.test.id}"
  #network_interface_ids = [azurerm_network_interface.test.id]
  resource_type    = "vm"
  subnet_id        = "${module.network.subnet_id_test}"
  public_ip_address_id = "${module.publicip.public_ip_address_id}"
  vm_admin_username  = var.vm_admin_username 
}



