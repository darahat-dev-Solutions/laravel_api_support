# Use official PHP 8.2 image with Apache as base
FROM php:8.2-apache AS base

# Build-time debug toggle (set via --build-arg ENABLE_BUILD_DEBUG=1)
ARG ENABLE_BUILD_DEBUG=0
ENV ENABLE_BUILD_DEBUG=${ENABLE_BUILD_DEBUG}

# Install system dependencies (add bash & nano for optional debugging)
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    bash \
    nano \
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

# Optional early debug dump BEFORE any build steps that depend on app code
RUN if [ "$ENABLE_BUILD_DEBUG" = "1" ]; then \
            echo "[DEBUG] Base image:" && cat /etc/os-release && \
            echo "[DEBUG] PHP version:" && php -v && \
            echo "[DEBUG] Composer version:" && composer --version && \
            echo "[DEBUG] Listing project root (top level):" && ls -al . | head -n 50 && \
            echo "[DEBUG] Checking presence of .env.example:" && ls -al .env* || true; \
        fi
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

# Permission verification script (fails fast if critical dirs missing or not writable)
RUN printf '#!/bin/sh\nset -e\nfor d in storage storage/framework storage/logs bootstrap/cache; do\n  if [ ! -d "$d" ]; then echo "[VERIFY] MISSING_DIR:$d"; exit 1; fi;\n  if [ ! -w "$d" ]; then echo "[VERIFY] NOT_WRITABLE:$d"; ls -ld "$d"; exit 1; fi;\n  echo "[VERIFY] OK:$d";\ndone\necho "[VERIFY] Permissions look good."\n' > /usr/local/bin/verify-perms && chmod +x /usr/local/bin/verify-perms
RUN /usr/local/bin/verify-perms

# Ensure modules directories exist and have proper permissions
RUN mkdir -p Modules/{AiModule,Auth,CoffeeShop,FormSubmission} \
    && chown -R www-data:www-data Modules/

# Create .env (use example if present) and inject a random APP_KEY (build-time only; runtime .env will override)
RUN set -e; \
    if [ -f .env.example ]; then \
        cp .env.example .env; \
    else \
        printf "APP_NAME=Laravel\nAPP_ENV=production\nAPP_KEY=\nAPP_DEBUG=false\nAPP_URL=http://localhost\nLOG_CHANNEL=stack\nLOG_LEVEL=info\n" > .env; \
    fi; \
    php -r '$key="base64:".base64_encode(random_bytes(32)); $env=file_get_contents(".env"); if(preg_match("/^APP_KEY=/m", $env)) { $env=preg_replace("/^APP_KEY=.*/m", "APP_KEY=".$key, $env); } else { $env.="APP_KEY=".$key.PHP_EOL; } file_put_contents(".env", $env);'; \
    grep -q 'APP_KEY=base64:' .env
RUN if [ "$ENABLE_BUILD_DEBUG" = "1" ]; then echo "[DEBUG] Show first 15 lines of generated .env"; head -n 15 .env; fi

# Install composer dependencies (no dev dependencies for production)
# Skip scripts to avoid package discovery issues during build
RUN if [ "$ENABLE_BUILD_DEBUG" = "1" ]; then echo "[DEBUG] Running composer validate"; composer validate --no-check-lock || true; fi \
    && composer install --no-interaction --optimize-autoloader --no-dev --ignore-platform-reqs --no-scripts
RUN if [ "$ENABLE_BUILD_DEBUG" = "1" ]; then echo "[DEBUG] Installed vendor count:"; ls -1 vendor | wc -l; fi

# Run package discovery manually after all directories are ready
RUN php artisan package:discover --ansi || { echo "[ERROR] package:discover failed"; exit 1; }
RUN if [ "$ENABLE_BUILD_DEBUG" = "1" ]; then echo "[DEBUG] Artisan about output:"; php artisan about || true; fi

# Clear and rebuild Laravel caches for modules (avoid DB-dependent caches)
RUN php artisan config:clear || true \
    && php artisan route:clear || true \
    && php artisan view:clear || true \
    && if [ "$ENABLE_BUILD_DEBUG" = "1" ]; then echo "[DEBUG] PHP modules:"; php -m | sort | head -n 40; fi

# Enable Apache modules
RUN a2enmod rewrite headers && if [ "$ENABLE_BUILD_DEBUG" = "1" ]; then apachectl -M | sort | head -n 30; fi

# Expose port 80 and start Apache
EXPOSE 80
CMD ["apache2-foreground"]
