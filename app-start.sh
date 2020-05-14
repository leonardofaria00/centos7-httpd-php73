#!/bin/bash

echo "Rodando app-start.sh"

echo "Fim da Instalação"

# Lancement du service apache au premier plan
exec /usr/sbin/httpd -D FOREGROUND