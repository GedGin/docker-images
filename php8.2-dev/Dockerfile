FROM ghcr.io/gedgin/php:8.2

LABEL maintainer="gin8 <gediminas.gineitis@gmail.com>"

WORKDIR /var/www/localhost/htdocs

# Install xdebug extension
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

CMD ["php-fpm"]

EXPOSE 9000
