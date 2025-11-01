FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libxml2-dev \
    zip unzip git curl mariadb-client \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-enable mysqli pdo_mysql

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite

EXPOSE 80

CMD ["apache2-foreground"]
