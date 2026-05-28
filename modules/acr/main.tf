resource "azurerm_container_registry" "acr" {
  name                = "${var.environment}acr123"
  resource_group_name = "${var.environment}-rg"
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}