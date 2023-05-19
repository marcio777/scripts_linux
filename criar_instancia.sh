#!/bin/bash

# Define as variáveis de configuração
region="us-east-2"
ami_id="ami-0cc87e5027adcdca8"
instance_type="t2.micro"
key_name="marcioap"
security_group="sg-0c545683639c6ec96"
subnet_id="subnet-015e6afa67744ced0"

# Cria a instância
instance_id=$(aws ec2 run-instances --image-id $ami_id --count 1 --instance-type $instance_type --key-name $key_name --security-group-ids $security_group --subnet-id $subnet_id --region $region --output text --query 'Instances[0].InstanceId')

echo "Criando instância EC2 com ID: $instance_id"