#!/bin/bash

# Instalando dependências do PHP
# yum install # GOTO

# Removendo arquivos do document root
rm -rf /var/www/html/*

# Controle de versão, verifica se é a latest
[[ ! "$VERSION_APP" ]] \
	&& VERSION_APP=$(curl -s https://api.github.com/repos/glpi-project/glpi/releases/latest | grep tag_name | cut -d '"' -f 4)

SRC_APP=$(curl -s https://api.github.com/repos/glpi-project/glpi/releases/tags/${VERSION_APP} | jq .assets[0].browser_download_url | tr -d \")
TAR_APP=$(basename ${SRC_APP})
FOLDER_APP=app/
FOLDER_WEB=/var/www/html/

# Download e extração de fontes da Aplicação
if [ "$(ls ${FOLDER_WEB}${FOLDER_APP})" ];
then
	echo "Aplication is already installed"
else
	wget -P ${FOLDER_WEB} ${SRC_APP}
	tar -xzf ${FOLDER_WEB}${TAR_APP} -C ${FOLDER_WEB}
	rm -Rf ${FOLDER_WEB}${TAR_APP}
	chown -R www-data:www-data ${FOLDER_WEB}${FOLDER_APP}
	rm -rf /var/www/html/github.com
	mv /var/www/html/glpi/* /var/www/html
fi

# Modificando vhost para default
echo -e "<VirtualHost *:80>\n\tDocumentRoot /var/www/html\n\n\t<Directory /var/www/html>\n\t\tAllowOverride All\n\t\tOrder Allow,Deny\n\t\tAllow from all\n\t</Directory>\n\n\tErrorLog /var/log/apache2/error-app.log\n\tLogLevel warn\n\tCustomLog /var/log/apache2/access-app.log combined\n</VirtualHost>" > /etc/apache2/sites-available/000-default.conf

# Incluindo tarefas agendadas pelo cron e ativando
echo "*/2 * * * * www-data /usr/bin/php /var/www/html/front/cron.php &>/dev/null" >> /etc/cron.d/app

# Start cron service
service cron start

# Ativando rewrite no apache2
a2enmod rewrite && service apache2 restart && service apache2 stop

# Lancement du service apache au premier plan
exec /usr/sbin/httpd -D FOREGROUND