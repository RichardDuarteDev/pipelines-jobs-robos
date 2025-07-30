
# Robô de Monitoramento de Serviço / Processos / Conexões

Este projeto apresenta uma solução adaptativa e automatizada para monitoramento de serviços em servidores Linux, utilizando Shell Script com execução agendada via `cron`. Seu foco é o serviço `NGINX`, mas pode ser adaptado para qualquer outro processo.

---
Diagrama, fluxo de eventos do projeto

<p align="center">
  <img 
    src="https://github.com/user-attachments/assets/70b9c226-58ab-4169-addf-c693294240b0" 
    alt="CORRETO" 
    style="max-width: 100%; height: auto;" />
</p>
 
Assista no YouTube  a explicação e o fucnionamento pratico!
Click na imagem
[![Assista no YouTube  a explicação e o fucnionamento pratico!](https://img.youtube.com/vi/lseSDTf1V50/0.jpg)](https://youtu.be/lseSDTf1V50)


## 📌 Conceitos Aplicados

- **Shell Script** (tecnologia leve e eficaz para automação em servidores)
- **Reatividade a eventos**: ação automática diante de falhas
- **Monitoramento adaptativo**: verifica, tenta restaurar e notifica
- **Fallback com disparo de alertas críticos**
- **Logs detalhados para auditoria**

---

## 🔧 Tecnologias Utilizadas

- `cron` (agendador de tarefas do Linux)
- `Shell Script (.sh)`
- `systemctl` ou `service` (para controle do serviço NGINX)
- Alertas via **e-mail, SMS, WhatsApp ou Telegram**

---

## 🔁 Fluxo Lógico do Monitor

### 1. **Agendamento via `cron`**
- Um job é agendado para execução periódica.
- Executa o script `monitor-processos.sh`.

### 2. **Job 1 – Verificação de Serviço**
- Lista os processos ativos e valida se o serviço `NGINX` está em execução.
- Se o serviço **não estiver rodando**, registra no `jobs.log` e tenta iniciá-lo.

### 3. **Job 2 – Tentativa de Start**
- Tenta iniciar o serviço e valida se foi iniciado com sucesso.
- Se for bem-sucedido, registra no log e finaliza.

### 4. **Job 3 – Alerta Crítico**
- Se a tentativa de iniciar o serviço **falhar**, registra fallback no log.
- Dispara alerta de **INCIDENTE CRÍTICO** com opções de notificação:
  - **E-mail**
  - **SMS**
  - **WhatsApp**
  - **Telegram**

---

## 📂 Estrutura de Arquivos

```
.
├── monitor-processos.sh        # Script principal de verificação
├── start-nginx.sh              # Script de fallback para reinício
├── alerta-incidente.sh         # Script de envio de alerta crítico
└── logs/
    └── jobs.log                # Registro de execuções e falhas
```

---

## 📒 Exemplo de Agendamento no `crontab`

```bash
*/5 * * * * /caminho/para/monitor-processos.sh
```

> Executa o monitoramento a cada 5 minutos.

---

## 📎 Considerações Finais

Essa abordagem oferece uma solução simples, leve e altamente eficaz para garantir a alta disponibilidade de serviços essenciais nos servidores. Combinando automação de shell scripts e reações inteligentes, reduz significativamente o tempo de indisponibilidade dos serviços e melhora a resiliência da infraestrutura.

---

## 💬 Sugestões

- Pode ser expandido para múltiplos serviços (Apache, MySQL, etc.).
- Pode ser integrado a sistemas como Prometheus + Grafana.
- Ideal para servidores legados ou ambientes com poucos recursos.

