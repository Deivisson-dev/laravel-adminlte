# Usa a imagem oficial do PHP 8.3 com FPM
FROM php:8.3-fpm

# Define o diretório de trabalho
WORKDIR /var/www

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    libpq-dev \
    unzip \
    curl \
    git \
    nano \
    supervisor \
    nginx \
    && docker-php-ext-install pdo pdo_pgsql

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copiar arquivos do Laravel
COPY . .

# Criar os diretórios necessários antes de definir permissões
RUN mkdir -p storage bootstrap/cache \
    && chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Expor portas do Laravel e Nginx
EXPOSE 8000 9000

# Comando para iniciar o Laravel automaticamente
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
