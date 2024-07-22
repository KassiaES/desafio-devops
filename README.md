---
# Implantando WordPress na Azure com Terraform
---

Este guia detalhado explica como implantar um site WordPress completo na Azure utilizando o Terraform. A automação completa provisiona uma VM, instala o Docker, configura e executa containers separados para o WordPress e o banco de dados MySQL, e garante a retenção de dados durante upgrades do WordPress.

## Pré-requisitos:

1. **Conta Azure com acesso ao CLI da Azure:**
   - Certifique-se de ter uma conta Azure ativa com privilégios administrativos para provisionar recursos na nuvem.
   - Instale e configure a CLI do Azure em sua máquina local para interagir com os serviços da Azure.
   - Siga as instruções em [Documentação da CLI do Azure](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli-windows) para instalar e configurar a CLI do Azure no Windows.

2. **Conta GitHub:**
   - Crie uma conta GitHub para armazenar o código Terraform e colaborar com outros desenvolvedores, se necessário.
   - Familiarize-se com as ferramentas básicas do GitHub para clonar, gerenciar e versionar repositórios.

3. **Terraform instalado localmente:**
   - Baixe e instale o Terraform em sua máquina local.
   - Siga as instruções em [Download do Terraform](https://www.terraform.io/downloads) para obter a versão adequada para o seu sistema operacional.
   - Familiarize-se com os comandos básicos do Terraform para definir, provisionar e gerenciar recursos na infraestrutura.

4. **Configuração das Senhas e Secrets:**
   - Na pasta `secrets`, coloque os arquivos de senha necessários (por exemplo, `mysql_password.txt`, `wordpress_password.txt`).
   - Certifique-se de que a pasta `secrets` está incluída no `.gitignore` para que não seja versionada no Git. O arquivo `.gitignore` deve conter:
     ```gitignore
     /secrets/*
     !/secrets/.gitkeep
     ```
   - Crie um arquivo `.gitkeep` dentro da pasta `secrets` para garantir que a pasta seja incluída no repositório, mas sem os arquivos secretos.

5. **Crie o Arquivo `terraform.tfvars`:**
   - Crie um arquivo chamado `terraform.tfvars` no diretório raiz do projeto e adicione as seguintes variáveis:
     ```hcl
     admin_username = "seu_nome_de_usuario"
     admin_password = "sua_senha_forte"
     ```
   - **Importante:** As variáveis `admin_username` e `admin_password` devem ser definidas neste arquivo para que o Terraform possa usá-las.

6. **Faça Login na Sua Conta Azure:**
   - Abra um terminal ou prompt de comando em sua máquina local.
   - Execute o seguinte comando para fazer login na sua conta Azure:
     ```bash
     az login
     ```
   - Siga as instruções na tela para autenticar-se com suas credenciais da conta Azure.

7. **Inicialize o Terraform:**
   - No diretório raiz do projeto, execute os seguintes comandos no terminal:
     ```bash
     terraform init
     ```
   - Este comando inicializa o Terraform, baixa os provedores necessários e instala os plugins relevantes.

8. **Revise o Plano:**
   - Gere um plano de execução detalhado com o comando:
     ```bash
     terraform plan
     ```
   - Revise cuidadosamente o plano para garantir que ele corresponde às suas expectativas.

9. **Aplique o Plano:**
   - Se você estiver satisfeito com o plano, execute o seguinte comando para aplicar as alterações e provisionar os recursos na Azure:
     ```bash
     terraform apply
     ```
   - Durante a execução, você será solicitado a fornecer os valores de senha do administrador e o nome do usuário administrador da VM.

10. **Acesse o WordPress:**
    - Após a conclusão da aplicação do Terraform, o endereço IP da VM contendo o WordPress será exibido na saída do comando `terraform apply`.
    - Copie este endereço IP e acesse-o em um navegador web.
    - Você deverá ver o site WordPress instalado e pronto para ser configurado.

11. **Destruição da Infraestrutura:**
    - Se você não precisar mais da infraestrutura provisionada, você pode destruí-la usando o comando:
      ```bash
      terraform destroy
      ```
    - Este comando destrói todos os recursos criados pelo Terraform.

## Observações:

- Este script Terraform usa uma imagem Docker pública para o WordPress. Você pode personalizar a imagem se necessário.
- O script cria um volume separado para armazenar os dados do WordPress. Isso garante que os dados sejam preservados durante upgrades do WordPress.
- Para mais informações sobre o Terraform, Docker e WordPress, consulte a documentação oficial de cada ferramenta.

## Suporte:

Se você tiver dúvidas ou problemas, sinta-se à vontade para abrir um problema neste repositório GitHub.

---

Estou à disposição!
