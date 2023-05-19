#!/bin/bash

# Atualiza a lista de pacotes disponíveis
sudo apt-get update

# Instala atualizações de segurança e pacotes recomendados
sudo apt-get upgrade -y

# Remove pacotes não utilizados ou obsoletos
sudo apt-get autoremove -y

# Limpa a cache do gerenciador de pacotes
sudo apt-get clean

# Notifica o usuário que a atualização foi concluída
echo "Atualização concluída"