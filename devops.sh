#!/bin/bash

# Instala as ferramentas de automação do sistema
sudo apt-get update
sudo apt-get install -y unattended-upgrades

# Instala o gerenciador de pacotes Pip
sudo apt-get install -y python3-pip

# Instala o Git, gerenciador de código-fonte distribuído
sudo apt-get install -y git

# Instala o Docker, plataforma de gerenciamento de containers
sudo apt-get install -y docker.io

# Instala o Docker Compose, ferramenta para definir e gerenciar aplicações Docker de vários serviços
sudo pip3 install docker-compose

# Instala o Ansible, automação de provisionamento e configuração de software
sudo apt-get install -y ansible

# Instala o Terraform, ferramenta de automação de infraestrutura
sudo apt-get install -y terraform


# Instala o cURL, ferramenta de transferência de dados em comandos
sudo apt-get install -y curl

echo "Todas as ferramentas foram instaladas com sucesso."