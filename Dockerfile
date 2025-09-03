# Use official PHP 8.2 image with Apache as base
FROM php:8.2-apache as base

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure and install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
    pdo_mysql \
    zip \
    gd \
    exif \
    pcntl \
    mbstring \
    xml \
    opcache

# Install Composer from official image
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy Apache virtual host config
COPY ./.docker/vhost.conf /etc/apache2/sites-available/000-default.conf

# Copy application files (excluding what's in .dockerignore)
COPY . .

# Install composer dependencies (no dev dependencies for production)
RUN composer install --no-interaction --optimize-autoloader

# Create necessary Laravel directories and set permissions
RUN mkdir -p /var/www/html/storage/framework/{cache,sessions,testing,views} \
    && mkdir -p /var/www/html/storage/logs \
    && chown -R www-data:www-data /var/www/html/storage \
    && chown -R www-data:www-data /var/www/html/bootstrap/cache

# Enable Apache modules
RUN a2enmod rewrite headers

# Expose port 80 and start Apache
EXPOSE 80
CMD ["apache2-foreground"]
