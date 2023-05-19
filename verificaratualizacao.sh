#!/bin/bash

# Executa o comando de atualização de pacotes e redireciona a saída para um arquivo de log
sudo apt update > /var/log/atualizacao.log

# Verifica se houve atualizações disponíveis
if [[ $(sudo apt list --upgradable 2>/dev/null | wc -l) -gt 1 ]]
then
    # Se houver atualizações disponíveis, exibe uma mensagem e pergunta se o usuário deseja instalá-las
    echo "Existem atualizações disponíveis para o sistema. Deseja instalá-las? (S/N)"
    read resposta

    if [ "$resposta" == "S" ] || [ "$resposta" == "s" ]
    then
        # Se o usuário desejar instalar as atualizações, executa o comando de atualização de pacotes e redireciona a saída para um arquivo de log
        sudo apt upgrade -y >> /var/log/atualizacao.log
        echo "As atualizações foram instaladas."
    else
        # Se o usuário não desejar instalar as atualizações, exibe uma mensagem e sai
        echo "As atualizações não foram instaladas."
    fi
else
    # Se não houver atualizações disponíveis, exibe uma mensagem e sai
    echo "Não há atualizações disponíveis para o sistema."
fi