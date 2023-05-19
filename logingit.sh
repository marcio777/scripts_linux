#!/bin/bash

read -p "Username: " username
read -sp "Password: " password

response=$(curl -s -X POST -H "Accept: application/json" -d "{\"login\":\"$username\",\"password\":\"$password\"}" https://api.github.com/session)

if [[ $response =~ "error" ]]; then
  echo "Failed to login. Please check your credentials and try again."
else
  echo "Login successful."
fi