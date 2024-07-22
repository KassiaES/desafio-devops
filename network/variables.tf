# Variável para definir a localização dos recursos na Azure
variable "location" {
  description = "Localização onde os recursos serão criados." # Descrição da variável
  type        = string                                          # Tipo da variável
#   default     = "East US"                                       # Valor padrão da variável
}

# Variável para definir o nome do grupo de recursos
variable "resource_group_name" {
  description = "Nome do grupo de recursos onde os recursos serão criados." # Descrição da variável
  type        = string                                                      # Tipo da variável
#   default     = "wordpress-rg"                                              # Nome do grupo de recursos
}
