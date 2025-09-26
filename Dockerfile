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

# Ensure modules directories exist and have proper permissions
RUN mkdir -p Modules/{AiModule,Auth,CoffeeShop,FormSubmission} \
    && chown -R www-data:www-data Modules/


# Install composer dependencies (no dev dependencies for production)
RUN composer install --no-interaction --optimize-autoloader --no-dev --ignore-platform-reqs

# Generate application key if not exists (for package discovery)
RUN php -r "file_exists('.env') || copy('.env.example', '.env');" \
    && php artisan key:generate --ansi || true

# Clear and rebuild Laravel caches for modules
RUN php artisan config:clear || true \
    && php artisan cache:clear || true \
    && php artisan route:clear || true \
    && php artisan view:clear || true

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
