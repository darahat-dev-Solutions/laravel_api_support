# Use official PHP 8.2 image with Apache as base
FROM php:8.2-apache AS base

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
# Explicitly copy Laravel's .htaccess into public folder
COPY ./public/.htaccess /var/www/html/public/.htaccess

# Create necessary Laravel directories BEFORE composer install
RUN mkdir -p storage/framework/{cache,sessions,testing,views} \
    && mkdir -p storage/logs \
    && mkdir -p bootstrap/cache \
    && touch storage/logs/laravel.log \
    && chown -R www-data:www-data storage \
    && chown -R www-data:www-data bootstrap/cache \
    && chmod -R 775 storage \
    && chmod -R 775 bootstrap/cache

# Ensure modules directories exist and have proper permissions
RUN mkdir -p Modules/{AiModule,Auth,CoffeeShop,FormSubmission} \
    && chown -R www-data:www-data Modules/

# Copy .env.example to .env and generate a basic app key manually
RUN cp .env.example .env \
    && php -r "file_put_contents('.env', str_replace('APP_KEY=', 'APP_KEY=base64:'.base64_encode(random_bytes(32)), file_get_contents('.env')));"

# Install composer dependencies (no dev dependencies for production)
# Skip scripts to avoid package discovery issues during build
RUN composer install --no-interaction --optimize-autoloader --no-dev --ignore-platform-reqs --no-scripts

# Run package discovery manually after all directories are ready
RUN php artisan package:discover --ansi

# Clear and rebuild Laravel caches for modules (avoid DB-dependent caches)
RUN php artisan config:clear || true \
    && php artisan route:clear || true \
    && php artisan view:clear || true

# Enable Apache modules
RUN a2enmod rewrite headers

# Expose port 80 and start Apache
EXPOSE 80
CMD ["apache2-foreground"]
