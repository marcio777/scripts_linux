#!/bin/bash

# Verifica se a pasta /tmp existe
if [ -d "/tmp" ]; then
    echo "A pasta /tmp existe. Iniciando a limpeza..."

    # Remove todos os arquivos e diretórios dentro de /tmp
    rm -rf /tmp/*

    echo "Limpeza da pasta /tmp concluída."
else
    echo "A pasta /tmp não existe."
fi