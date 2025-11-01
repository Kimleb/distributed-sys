# Use official PHP image with Apache
FROM php:8.2-apache

# Install mysqli and pdo_mysql extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy project files into the web root
COPY . /var/www/html/

# Enable Apache rewrite (optional)
RUN a2enmod rewrite

EXPOSE 80
