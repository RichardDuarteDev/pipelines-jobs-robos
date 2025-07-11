#Monitor de processos Shell Script 

#Lista processos, e valida se o processo está em execução 
#Neste Script iremos utilizar o processo NGINX

# Teste de validação do processo
nginx="nginx"

if ps aux | grep -i "$nginx" | grep -v "grep" > /dev/null; then
    echo "Nginx está em execução"
    sudo systemctl status nginx
else
    echo "Processo não está  inicializado"
    echo "$(date) - Não encontrou processo em execução" | sudo tee -a /Jobs/log/jobs.log > /dev/null
    echo "$(date) - Iniciando  Fall back restart forcando inicialização de serviço NGINX" | sudo tee -a /Jobs/log/jobs.log > /dev/null
    sleep 2

    #Executa o Force Start do serviço NGINX 
    bash /Jobs/Monitor_de_Processos/start-force-nginx.sh
fi
