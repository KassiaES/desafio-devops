# Definição da rede virtual (VNet)
resource "azurerm_virtual_network" "vnet" {
  name                = "wordpress-vnet"                # Nome da VNet
  address_space       = ["10.0.0.0/16"]                 # Espaço de endereço da VNet
  location            = var.location                    # Localização da VNet
  resource_group_name = var.resource_group_name         # Nome do grupo de recursos
}

# Definição da sub-rede dentro da VNet
resource "azurerm_subnet" "subnet" {
  name                 = "wordpress-subnet"             # Nome da sub-rede
  resource_group_name  = var.resource_group_name        # Nome do grupo de recursos
  virtual_network_name = azurerm_virtual_network.vnet.name # Nome da VNet criada acima
  address_prefixes     = ["10.0.1.0/24"]                # Prefixo de endereço da sub-rede
}

# Criação da interface de rede (NIC)
resource "azurerm_network_interface" "nic" {
  name                = "wordpress-nic"
  location            = var.location
  resource_group_name = var.resource_group_name  #azurerm_resource_group.rg.name

  # Configuração de IP para a NIC
  ip_configuration {
    name                          = "wordpress-ip-config"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}