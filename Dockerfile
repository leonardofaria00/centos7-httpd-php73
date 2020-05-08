FROM centos:7.7.1908

RUN yum -y --setopt=tsflags=nodocs update
RUN yum -y install \
    rpm \
    epel-release yum-utils \
    http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum-config-manager --enable remi-php73

RUN yum -y --setopt=tsflags=nodocs install \
    httpd \
    php php-fpm \
    php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-json \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/yum/* \
    && rm -rf /run/httpd/* /tmp/httpd* \
    && yum clean all

# Configure PHP-FPM
COPY config/php.ini /etc/php.d/custom.ini

WORKDIR /var/www/html

VOLUME /var/www/html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]