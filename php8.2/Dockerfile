FROM php:8.2-fpm

LABEL maintainer="gin8 <gediminas.gineitis@gmail.com>"

WORKDIR /var/www/localhost/htdocs

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        exim4 \
        libfreetype6-dev \
        libjpeg-dev \
        libmagickwand-dev \
        libmariadb-dev \
        libmemcached-dev \
        libpng-dev \
        libssl-dev \
        libxml2-dev \
        libzip-dev \
        tdsodbc \
        unixodbc \
        unixodbc-dev \
        zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN yes "" | pecl install imagick \
    && docker-php-ext-enable imagick \
    && yes "" | pecl install memcached \
    && docker-php-ext-enable memcached \
    && docker-php-ext-configure gd \
        --with-freetype=/usr \
        --with-jpeg=/usr \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure pdo_odbc \
        --with-pdo-odbc=unixODBC,/usr \
    && docker-php-ext-install exif gd intl mysqli opcache pdo_mysql pdo_odbc soap zip

# Configure Exim
COPY update-exim4.conf.conf /etc/exim4/
RUN /usr/sbin/update-exim4.conf
RUN echo "for-sale-digital.de" > /etc/mailname

RUN usermod -o -u 1000 www-data \
    && groupmod -o -g 1000 www-data

CMD ["php-fpm"]

EXPOSE 9000
