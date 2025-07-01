#!/bin/bash

#Start NGINX

echo "Startando processo NGINX..."

sudo systemctl start nginx

# Registrar no log que o NGINX foi habilitado, incluindo data e hora
echo "$(date) - Nginx Iniciado" | sudo tee -a /Jobs/log/jobs.log > /dev/null

sleep 5 

sudo systemctl status nginx

sleep 2 

ps aux | grep nginx -i


