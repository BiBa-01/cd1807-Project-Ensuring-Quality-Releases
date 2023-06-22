variable "location" {
    default = "eastus"
}

variable "resource_group" {
    default = "project"
}

variable "public_ip_address_id" {}
variable "subnet_id" {}


variable "application_type" {
    default = "ProjectApp"
}

variable "resource_type" {
    default = " project"
}

variable "vm_admin_username" {
    default = "Biba"
}

variable "network_interface" {
    description = "The network interface for the virtual machine"
    type        = list(string)
    default = ["network_interface"]
}




