#!/bin/bash

# Registrar no log a execução do monitor
echo "$(date) - Monitor de processo NGINX em execução" >> /stopStart/nginx.log

# Configurações
EMAIL_DESTINO="cik.c@hotmail.com"
ASSUNTO="Alerta: Processo Nginx parado!"
CORPO_EMAIL="Processo: Nginx Status: parado"

# Verifica se o processo NGINX  está em execução
if pgrep -x "nginx" > /dev/null; then
    echo "$(date) - Processo Nginx  está em execução" >> /Jobs/log/jobs.log > /dev/null
else
    # Envia e-mail de alerta
    (
        echo "To: $EMAIL_DESTINO"
        echo "Subject: $ASSUNTO"
        echo "Content-Type: text/plain; charset=UTF-8"
        echo ""
        echo "$CORPO_EMAIL"
    ) | msmtp --debug "$EMAIL_DESTINO"

    echo "E-mail de alerta enviado para $EMAIL_DESTINO."
    echo "$(date) - Alerta processo Nginx está fora de execução" | sudo tee -a /Jobs/log/jobs.log > /dev/null
    echo "$(date) - Disparo de e-mail INC critico enviado!" | sudo tee -a /Jobs/log/jobs.log > /dev/null

fi
