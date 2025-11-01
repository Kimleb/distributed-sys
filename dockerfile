FROM php:8.2-apache

# Copy project files into the web root
COPY . /var/www/html/

# Enable Apache mod_rewrite (for clean URLs if needed)
RUN a2enmod rewrite

# Expose port 80 (Render uses this to serve your site)
EXPOSE 80