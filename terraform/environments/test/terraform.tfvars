# Azure subscription vars
subscription_id = "46f0b4f7-e5d8-488c-b438-00f74a74c84a"
client_id = "6f99eb0f-ce98-4131-87bd-7d8a7a65991e"
client_secret = "GTm8Q~rLvALs8rSy7sWLR4mA~dMA.9la.wLDsbIb"
tenant_id = "f958e84a-92b8-439f-a62d-4f45996b6d07"

# Resource Group/Location
location = "East US"
resource_group_name = "AzureDevops"
application_type = "myApplication"

# Network
virtual_network_name = "vnetproject"
address_space = ["10.5.0.0/16"]
address_prefix_test = "10.5.1.0/24"

variable "AzureDevops" {
  type = string
}
