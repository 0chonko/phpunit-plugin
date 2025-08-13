FROM php:8.2-cli

RUN apt-get update && apt-get install -y git unzip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install PHPUnit and its dependencies
WORKDIR /plugin_deps
COPY composer.json composer.lock ./
RUN composer install --no-interaction --no-progress --ignore-platform-reqs
RUN rm -rf /root/.composer/cache/*

# Make the phpunit executable available system-wide.
RUN ln -s /plugin_deps/vendor/bin/phpunit /usr/local/bin/phpunit

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]