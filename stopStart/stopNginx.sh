#!/bin/bash 

#Stopando serviço NGNX

echo "Parando processo NGINX..."

sudo systemctl stop nginx

# Registrar no log que o NGINX foi habilitado, incluindo data e hora
echo "$(date) - Nginx Stopado" | sudo tee -a /Jobs/log/jobs.log > /dev/null

sleep 5 

sudo systemctl status nginx

sleep 2

ps aux | grep nginx -i 

