# Use the official PHP 8.2 CLI image as the base
FROM php:8.2-cli

# Set environment variables
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV XDEBUG_MODE=coverage

# Install system dependencies and PHP extensions required by Composer
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    # Dependencies for various PHP extensions
    libzip-dev \
    libicu-dev \
    libmagickwand-dev \
    libldap2-dev \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    # Install the required PHP extensions
    && docker-php-ext-install \
    zip \
    intl \
    pdo_mysql \
    ldap \
    # Install imagick via pecl
    && pecl install imagick \
    && docker-php-ext-enable imagick

# Install the Xdebug extension (kept separate for clarity)
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /app

# Copy composer files and install dependencies.
# This step will now succeed because the required extensions are installed.
COPY composer.json composer.lock ./
RUN composer install --no-interaction --no-plugins --no-scripts

# Copy the rest of your application's code
COPY . .

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
# The default command to run when the container starts (optional)
CMD ["php", "-v"]
