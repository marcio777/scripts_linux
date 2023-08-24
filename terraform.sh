#!/bin/bash

# Defina a versão do Terraform que deseja instalar
TERRAFORM_VERSION="0.15.4"

# Defina o URL do arquivo compactado do Terraform
TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Defina o diretório de destino
INSTALL_DIR="/usr/local/bin"

# Crie um diretório temporário
TEMP_DIR=$(mktemp -d)

# Baixe o arquivo compactado do Terraform
wget -P "${TEMP_DIR}" "${TERRAFORM_URL}"

# Descompacte o arquivo
unzip "${TEMP_DIR}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -d "${TEMP_DIR}"

# Mova o executável do Terraform para o diretório de instalação
sudo mv "${TEMP_DIR}/terraform" "${INSTALL_DIR}"

# Defina as permissões adequadas para o executável
sudo chmod +x "${INSTALL_DIR}/terraform"

# Limpando arquivos temporários
rm -rf "${TEMP_DIR}"

# Verifique a instalação
terraform --version

echo "Instalação do Terraform concluída!"
