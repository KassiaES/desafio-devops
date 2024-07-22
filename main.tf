terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.112.0"
    }
  }
}

# Configuração do provedor da Azure
provider "azurerm" {
  features {}
}

# Criação do grupo de recursos
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name  # Nome do grupo de recursos
  location = var.location       # Localização do grupo de recursos
}

# Criação da rede virtual e sub-rede usando o módulo network
module "network" {
  source              = "./network"                      # Fonte do módulo de rede
  resource_group_name = azurerm_resource_group.rg.name   # Nome do grupo de recursos
  location            = azurerm_resource_group.rg.location # Localização do grupo de recursos
  subnet_prefix = var.subnet_prefix                       # Prefixo de endereço da sub-rede
  address_space = var.address_space                       # Espaço de endereço da VNet
}

# Criação da máquina virtual usando o módulo vm
module "vm" {
  source              = "./vm"                           # Fonte do módulo de VM
  resource_group_name = azurerm_resource_group.rg.name   # Nome do grupo de recursos
  location            = azurerm_resource_group.rg.location # Localização do grupo de recursos
  subnet_id           = module.network.subnet_id         # ID da sub-rede
  admin_username = var.admin_username
  admin_password = var.admin_password
}
