provider "azurerm" {
  tenant_id       = "f958e84a-92b8-439f-a62d-4f45996b6d07" #"${var.tenant_id}"
  subscription_id = "0ee6d06f-69ab-4b3b-9f35-003e1b6eb227"#"${var.subscription_id}"
  client_id       = "730bbe39-60ae-4848-89f4-d2c2a2be403" #"${var.client_id}"
  client_secret   = "afwg73HKG*Mf" #"${var.client_secret}"
  features {}
   }
 
terraform {
  backend "azurerm" {
    storage_account_name = "tfstatebb01"
    container_name       = "tfstatebb01c"
    key                  = "test.terraform.tfstatebb01c"
    account_key         = "3bmpVZCX1+twXV8zYy1LnisUkT8WIpxUdjEFk8yLgBsyVsFXEEvpy5AZXOs2G8QcSDL9cOznQuBi+AStAC3rFA=="
    access_key           = "3bmpVZCX1+twXV8zYy1LnisUkT8WIpxUdjEFk8yLgBsyVsFXEEvpy5AZXOs2G8QcSDL9cOznQuBi+AStAC3rFA=="
   }
 }

#resource "azurerm_resource_group" "test" {
  #name     = "project"
  #location = "eastus"
 # source               = "../../modules/resource_group"
 # resource_group       = "${var.resource_group}"
 # location             = "${var.location}"
#}

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
  resource_type    = "vm"
  subnet_id        = "${module.network.subnet_id_test}"
  public_ip_address_id = "${module.publicip.public_ip_address_id}"
  vm_admin_username  = var.vm_admin_username 
}



