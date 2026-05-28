resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.environment}-aks"
  location            = var.location
  resource_group_name = "${var.environment}-rg"
  dns_prefix          = "${var.environment}-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}