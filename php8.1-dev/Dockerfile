FROM git.fsd.li:4567/fsd-dev/docker/php:8.1

LABEL maintainer="gin8 <gin8@gin8.de>"

WORKDIR /var/www/localhost/htdocs

# Install xdebug extension
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

CMD ["php-fpm"]

EXPOSE 9000
