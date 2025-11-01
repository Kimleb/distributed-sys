# Use official PHP + Apache image
FROM php:8.2-apache

# Install dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    default-mysql-client \
    && docker-php-ext-install mysqli pdo pdo_mysql

# Copy your project into the Apache web root
COPY . /var/www/html/

# Set correct permissions (optional but good practice)
RUN chown -R www-data:www-data /var/www/html

# Enable Apache rewrite (optional)
RUN a2enmod rewrite

# Expose the default web port
EXPOSE 80
