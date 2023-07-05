#resource "azurerm_service_plan" "test" {
 # name                = "${var.application_type}-${var.resource_type}"
#  location            = "${var.location}"
#  resource_group_name = "${var.resource_group}"
#  os_type             = "Linux"
#  sku_name            = "F1"
#}

#resource "azurerm_linux_web_app" "test" {
 # name                = "${var.application_type}-${var.resource_type}"
#  location            = "${var.location}"
#  resource_group_name = "${var.resource_group}"
#  service_plan_id     = azurerm_service_plan.test.id

 # app_settings = {
    
   # "WEBSITE_RUN_FROM_PACKAGE" = 0
 # }
  #site_config {
  #  always_on = false
  #}
#}

resource "azurerm_service_plan" "test1" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  os_type             = "Windows"
  sku_name            = "F1"
}

resource "azurerm_app_service" "test1" {
  name                = "${var.application_type}-${var.resource_type}"
  app_service_plan_id = azurerm_service_plan.test1.id
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  app_settings = {
     "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"
     "WEBSITE_RUN_FROM_PACKAGE" = 0
  }
  site_config {
    #windows_fx_version = "DOCKER|<Windows_Docker_Image>"
    always_on = false
  }
}

