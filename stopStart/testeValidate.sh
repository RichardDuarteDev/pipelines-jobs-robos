#!/bin/bash

# Teste de validação do processo
nginx="nginx"

if ps aux | grep -i "$nginx" | grep -v "grep" > /dev/null; then
    echo "Nginx está em execução"
else
    echo "Não encontrou processo em execução"
fi
