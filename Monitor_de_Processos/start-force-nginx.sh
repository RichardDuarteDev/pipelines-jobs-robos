#!/bin/bash

# START FORCE NGINX
echo "Analisando processo..."
sleep 2

echo "Validando pela 2° vez se o processo realmente esta fora de serviço"

sleep 2

# VALIDA SE O PROCESSO ESTA EM EXECUÇÃO
if pgrep -x "nginx" > /dev/null; then
    echo " Nginx está em execução"
else
    
    echo "Processo Nginx não iniciado"
    echo "Forçando inicialização do Nginx..."
    sudo systemctl start nginx
    echo "$(date) - Forçando inicialização do Nginx" | sudo tee -a /Jobs/log/jobs.log > /dev/null

    sleep 10

    # FALLBACK DE INICIALIZAÇÃO - VALIDAÇÃO SE O PROCESSO REINICIOU CORRETAMENTE
    if pgrep -x "nginx" > /dev/null; then
        echo " Nginx iniciado com sucesso após tentativa"
        echo "$(date) - Inicializalção forçada iniciada com scuesso NGINX" | sudo tee -a /Jobs/log/jobs.log > /dev/null
    else
        echo "Force de inicialização NGINX falhou!"
        echo "$(date) - Falha! Start Force Nginx - Disparo de e-mail INC-CRITICO!  alert! processo nginx parado" | sudo tee -a /Jobs/log/jobs.log > /dev/null
        # Disparo de e-mail de Alerta Critico 
	echo "Disparando e-mail de Alerta INC Critico"
	sleep 5

	bash /Jobs/Monitor_de_Processos/alarte-email-inc-critico.sh
    fi
fi
