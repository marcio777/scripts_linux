#!/bin/bash

# Atualizar repositórios
sudo apt update

# Instalar pacotes necessários
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Adicionar chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adicionar repositório do Docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualizar repositórios novamente
sudo apt update

# Instalar Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Adicionar usuário ao grupo Docker (opcional, para evitar usar sudo comandos Docker)
sudo usermod -aG docker $USER

# Iniciar e habilitar o serviço Docker
sudo systemctl start docker
sudo systemctl enable docker
