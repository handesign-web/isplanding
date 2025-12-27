# Gunakan base image PHP dengan Apache yang resmi
# Karena Anda pakai M4, Docker akan otomatis pilih varian ARM64
FROM php:8.2-apache

# Install ekstensi PHP yang dibutuhkan (MySQLi & PDO untuk database)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Aktifkan mod_rewrite apache (penting untuk framework modern)
RUN a2enmod rewrite

# Copy semua file codingan dari laptop ke dalam folder web container
COPY . /var/www/html/

# Atur permission agar Apache bisa baca/tulis
RUN chown -R www-data:www-data /var/www/html

# Buka port 80 agar bisa diakses
EXPOSE 80