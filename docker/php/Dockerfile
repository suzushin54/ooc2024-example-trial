FROM php:8.2-fpm

# OS dependencies
RUN apt-get update && \
    apt-get install -y zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev zip unzip vim git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# PHP extensions
RUN docker-php-ext-install pdo_mysql && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set the Composer environment variables
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

# Set the working directory to /var/www
WORKDIR /var/www

# Copy the existing application directory contents to the working directory
COPY ./src /var/www

# Use the default development configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
