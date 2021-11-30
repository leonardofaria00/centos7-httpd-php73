####################################################################################
# VERSION v0.0.2
# AUTHOR:         Leonardo Santos <leonardofaria00@gmail.com>
# DESCRIPTION:    Image CentOS7 with PHP 7.3 and httpd 2.4
#
# TO_BUILD:       docker build --pull --rm -f "Dockerfile" -t centos7-httpd-php73:latest "."
# TO_RUN:         docker run --rm -it  -p 80:80/tcp centos7-httpd-php73:latest
#
# Dockerfile de construção do container WebApp utilizado pelo MD
#
# Container preparado e configurado para uso em desenvolvimento e testes
####################################################################################

FROM centos:centos7

# Instalando repositório PHP
RUN yum -y --setopt=tsflags=nodocs update
RUN yum -y install \
    epel-release yum-utils \
    http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum-config-manager --enable remi-php73

# Instalando HTTPD e PHP
RUN yum -y --setopt=tsflags=nodocs install \
    httpd composer git \
    php php-fpm php-cli php-mysqlnd php-zip php-devel \
    php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-json \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/yum/* \
    && rm -rf /run/httpd/* /tmp/httpd* \
    && yum clean all

# Copiando arquivos do projeto para o document root
COPY app/ /var/www/html

# Copiando arquivos de configuração do PHP
COPY config/php.ini /etc/php.d/custom.ini

# Adicionando aplicação
WORKDIR /var/www/html

# Expondo a porta web
EXPOSE 80

# Iniciando projeto
CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
