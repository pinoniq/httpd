FROM httpd:2.4-alpine

MAINTAINER Jeroen "pinoniq" Meeus

RUN mkdir -p /var/www

COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./conf/extra/httpd-default.conf /usr/local/apache2/conf/extra/httpd-default.conf
COPY ./conf/extra/httpd-mpm.conf /usr/local/apache2/conf/extra/httpd-mpm.conf
COPY ./conf/extra/httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf

WORKDIR /var/www
