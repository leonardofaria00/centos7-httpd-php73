# Base image for development applications
# Docker PHP-FPM 7.3 & Httpd 2.4 on CentOS 7.7.1809
Example PHP-FPM 7.3 & Httpd 2.4 setup for Docker, build on [CentOS Linux](https://www.centos.org/).
The image is only +/- 35MB large.

Repository: https://github.com/leonardofaria00/httpd-base


* Built on the lightweight and secure CentOS Linux distribution
* Very small Docker image size (+/-35MB)
* Uses PHP 7.3 for better performance, lower cpu usage & memory footprint
* Optimized for 100 concurrent users
* Optimized to only use resources when there's traffic (by using PHP-FPM's ondemand PM)
* The servers Httpd, PHP-FPM run under a non-privileged user (apache) to make it more secure
* The logs of all the services are redirected to the output of the Docker container (visible with `docker logs -f <container name>`)
* Follows the KISS principle (Keep It Simple, Stupid) to make it easy to understand and adjust the image to your needs


[![Docker Pulls](https://img.shields.io/docker/pulls/trafex/alpine-nginx-php7.svg)](https://hub.docker.com/repository/docker/leonardofaria00/httpd-base_webapp/)
[![Httpd 2.4.6](https://img.shields.io/badge/nginx-1.16-brightgreen.svg)]
(https://httpd.apache.org/docs/2.4/programs/httpd.html)
[![php 7.3](https://img.shields.io/badge/php-7.3-brightgreen.svg)]
(https://www.php.net/releases/7_3_0.php)
[![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)]
(https://opensource.org/licenses/MIT)

### Breaking changes (07/05/20120)

Please note that the new builds since 26/01/2019 are exposing a different port to access Httpd.
To be able to run Httpd as a non-privileged user, the port it's running on needed
to change to a non-privileged port (above 1024).

The last build of the old version that exposed port 80 was `trafex/alpine-nginx-php7:ba1dd422`

## Usage

Start the Docker container:

    docker run -p 80:8080 leonardofaria00/httpd-base_webapp

See the static html info on http://localhost, or the PHP page on http://localhost/info.php

Or mount your own code to be served by PHP-FPM & Httpd

    docker run -p 80:8080 -v ~/my-codebase:/var/www/html leonardofaria00/httpd-base_webapp

## Configuration
In [config/](config/) you'll find the default configuration files for Httpd, PHP and PHP-FPM.
If you want to extend or customize that you can do so by mounting a configuration file in the correct folder;

PHP configuration:

    docker run -v "`pwd`/config/php.ini:/etc/php.d/custom.ini" leonardofaria00/httpd-base_webapp

_Note; Because `-v` requires an absolute path I've added `pwd` in the example to return the absolute path to the current directory_ 


## Adding composer

If you need composer in your project, here's an easy way to add it;

```dockerfile
FROM leonardofaria00/httpd-base_webapp:latest

# Install composer from the official image
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Run composer install to install the dependencies
RUN composer install --optimize-autoloader --no-interaction --no-progress
```
