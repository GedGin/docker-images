FROM webdevops/apache:alpine

LABEL maintainer="gin8 <gin8@gin8.de>"

ENV WEB_PHP_SOCKET=php:9000
ENV WEB_DOCUMENT_ROOT=/var/www/localhost/htdocs

WORKDIR /var/www/localhost/htdocs

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories \
    && apk --no-cache add apache2-http2 \
    && apk --no-cache add shadow

RUN usermod -o -u 1000 apache \
    && groupmod -o -g 1000 apache

COPY httpd.conf /etc/apache2/httpd.conf

EXPOSE 80 443
