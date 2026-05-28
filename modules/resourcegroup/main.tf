resource "azurerm_resource_group" "rg" {
  name     = "${var.environment}-rg"
  location = var.location
}