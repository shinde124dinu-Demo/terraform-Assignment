module "rg" {
  source = "./modules/resourcegroup"

  location    = var.location
  environment = var.environment
}

module "vnet" {
  source = "./modules/vnet"

  location            = var.location
  environment         = var.environment
  resource_group_name = module.rg.rg_name
}

module "acr" {
  source = "./modules/acr"

  location            = var.location
  environment         = var.environment
  resource_group_name = module.rg.rg_name
}

module "aks" {
  source = "./modules/aks"

  location            = var.location
  environment         = var.environment
  resource_group_name = module.rg.rg_name
}

module "vm" {
  source = "./modules/vm"

  location            = var.location
  environment         = var.environment
  resource_group_name = module.rg.rg_name
  subnet_id           = module.vnet.subnet_id
}