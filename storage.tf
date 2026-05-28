resource "azurerm_storage_account" "store" {
  name                = "devstorage3104"
  resource_group_name = "dev-rg"
  location            = "Central India"

  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
    owner       = "dinesh"
  }
}
