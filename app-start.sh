#!/bin/bash

echo "Rodando app-start.sh"

echo "Fim da Instalação"

# Serviço Apache em primeiro plano
exec /usr/sbin/httpd -D FOREGROUND
