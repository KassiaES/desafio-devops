#!/bin/bash

# Atualizar pacotes e sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instalar Docker
sudo apt-get install docker.io -y
sudo systemctl enable --now docker
sudo systemctl start docker

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Criar diretório para arquivos Docker
mkdir -p ~/docker_wordpress
cd ~/docker_wordpress

# Criar arquivo docker-compose.yml
cat <<EOF > docker-compose.yml
version: '3.8'

services:
  wordpress:
    image: wordpress:latest
    restart: always
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: GAud4mZby8F3SD6P
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - wordpress:/var/www/html

  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: GAud4mZby8F3SD6P
      MYSQL_DATABASE: wordpress
    volumes:
      - db_data:/var/lib/mysql

volumes:
  wordpress:
  db_data:
EOF

# Subir containers com Docker Compose
sudo docker-compose up -d

# Esperar alguns segundos para garantir que os containers estão inicializados
sleep 30

# Verificar o status dos containers
sudo docker-compose ps
