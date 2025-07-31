#Use official PHP 8.2 image as a base
FROM php:8.2-apache as base

#Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install pdo_mysql zip gd exif pctl
#Install Composer
COPY --from=Composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy existing application directory contents
COPY . .

# Copy apache virtual host config file
COPY ./.docker/vhost.conf /etc/apache2/sites-available/000-default.conf

#Install composer dependencies
RUN composer install --no-interaction --optimize-autoloader --no-dev

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN a2enmod rewrite

# Expose port 80 and start apache
EXPOSE 80
CMD ["apache2-foreground"]

