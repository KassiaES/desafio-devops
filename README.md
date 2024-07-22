## Implantando WordPress na Azure com Terraform

Este guia detalhado explica como implantar um site WordPress completo na Azure utilizando o Terraform. A automação completa provisiona uma VM, instala o Docker, configura e executa containers separados para o WordPress e o banco de dados MySQL, e garante a retenção de dados durante upgrades do WordPress.

**Pré-requisitos:**

* **Conta Azure com acesso ao CLI da Azure:**
    * Certifique-se de ter uma conta Azure ativa com privilégios administrativos para provisionar recursos na nuvem.
    * Instale e configure a CLI do Azure em sua máquina local para interagir com os serviços da Azure.
    * Siga as instruções em [https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli-windows](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli-windows) para instalar e configurar a CLI do Azure no Windows.

* **Conta GitHub:**
    * Crie uma conta GitHub para armazenar o código Terraform e colaborar com outros desenvolvedores, se necessário.
    * Familiarize-se com as ferramentas básicas do GitHub para clonar, gerenciar e versionar repositórios.

* **Terraform instalado localmente:**
    * Baixe e instale o Terraform em sua máquina local.
    * Siga as instruções em [https://www.terraform.io/downloads](https://www.terraform.io/downloads) para obter a versão adequada para o seu sistema operacional.
    * Familiarize-se com os comandos básicos do Terraform para definir, provisionar e gerenciar recursos na infraestrutura.

* **Conhecimento básico de Terraform, Docker e WordPress:**
    * Tenha um conhecimento básico dos conceitos e práticas do Terraform, como arquivos de configuração, módulos e comandos.
    * Compreenda os fundamentos do Docker, incluindo containers, imagens e orquestração.
    * Esteja familiarizado com a instalação e configuração do WordPress em um ambiente local ou em um servidor.

**Instruções:**

1. **Clone o Repositório:**
    * Acesse o repositório GitHub do projeto: [Insira o link do repositório aqui]
    * Clone o repositório para sua máquina local usando o comando `git clone` ou através da interface do GitHub.

2. **Configure as Variáveis:**
    * No diretório raiz do projeto clonado, localize o arquivo `variables.tf`.
    * Edite este arquivo e defina as variáveis de acordo com seu ambiente Azure:
        * `resource_group_name`: Nome do grupo de recursos da Azure que conterá os recursos provisionados.
        * `location`: Localização geográfica da instância da VM da Azure (por exemplo, "brazilcentral").
        * `admin_username`: Nome de usuário do administrador para a VM da Azure.
        * `admin_password`: Senha forte para o administrador da VM.
        * `network_security_group_name`: Nome do grupo de segurança da rede que controlará o acesso à VM.

3. **Faça login na sua conta Azure:**
    * Abra um terminal ou prompt de comando em sua máquina local.
    * Execute o seguinte comando para fazer login na sua conta Azure:
        ```bash
        az login
        ```
        * Siga as instruções na tela para autenticar-se com suas credenciais da conta Azure.

4. **Inicialize o Terraform:**
    * No diretório raiz do projeto, execute os seguintes comandos no terminal:
        ```bash
        terraform init
        ```
        * Este comando inicializa o Terraform, baixa os provedores necessários e instala os plugins relevantes.

        ```bash
        terraform plan
        ```
        * Este comando gera um plano de execução detalhando as alterações que o Terraform fará na sua infraestrutura Azure.
        * Revise cuidadosamente o plano para garantir que ele corresponde às suas expectativas.

5. **Aplique o plano:**
    * Se você estiver satisfeito com o plano, execute o seguinte comando para aplicar as alterações e provisionar os recursos na Azure:
        ```bash
        terraform apply
        ```
        * Este comando pode levar alguns minutos para ser concluído, pois provisiona a VM, instala o Docker e configura os containers do WordPress e MySQL.

6. **Acesse o WordPress:**
    * Após a conclusão da aplicação do Terraform, o endereço IP da VM contendo o WordPress será exibido na saída do comando `terraform apply`.
    * Copie este endereço IP e acesse-o em um navegador web.
    * Você deverá ver o site WordPress instalado e pronto para ser configurado.

7. **Destruição da Infraestrutura**:
   * Se você não precisar mais da infraestrutura provisionada, você pode destruí-la usando o comando:
     ```bash
        terraform destroy
        ```
        * Destrói todos os recursos criados pelo Terraform.

**Observações:**

* Este script Terraform usa uma imagem Docker pública para o WordPress. Você pode personalizar a imagem se necessário.
* O script cria um volume separado para armazenar os dados do WordPress. Isso garante que os dados sejam preservados durante upgrades do WordPress.
* Para mais informações sobre o Terraform, Docker e WordPress, consulte a documentação oficial de cada ferramenta.

**Suporte:**

Se você tiver dúvidas ou problemas, sinta-se à vontade para abrir um problema neste repositório GitHub.
