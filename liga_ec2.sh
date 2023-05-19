#!/bin/bash

# ID da instância que deseja iniciar
instance_id="i-0f6f49ac164fda1a7"
region="us-east-2"


# Verifica se a AWS CLI está instalada
if ! command -v aws &> /dev/null
then
    echo "A AWS CLI não está instalada. Instale-a antes de executar este script."
    exit 1
fi

# Verifica se a instância está em estado "stopped"
status=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[].Instances[].State.Name' --output text --region "$region")
if [ "$status" != "stopped" ]
then
    echo "A instância não está em estado 'stopped'."
    exit 1
fi


# Inicia a instância
aws ec2 start-instances --instance-ids "$instance_id"

# Aguarda até que a instância esteja em estado "running"
while [ "$status" != "running" ]
do
    sleep 5
    status=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[].Instances[].State.Name' --output text)
done

# Exibe mensagem informando que a instância foi iniciada com sucesso
echo "A instância foi iniciada com sucesso."