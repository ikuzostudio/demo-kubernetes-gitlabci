# De l'image thecodingmachine/php avec les arguments ci dessous
ARG PHP_EXTENSIONS="pdo_mysql intl zip gd"
FROM thecodingmachine/php:7.3-v2-apache

# Je souhaite passer ces variables à notre container
ENV TEMPLATE_PHP_INI=production
ENV APP_ENV=prod
ENV APACHE_DOCUMENT_ROOT=public/

# Je copier toutes les sources du projets à la racine du vhost de notre container
# (ce chemin dépendra de l'image que vous utilisez comme base de build)
COPY --chown=docker:docker ./ /var/www/html

# Je défini ce repertoire comme répertoire de travail
WORKDIR /var/www/html

# J'installe mes dépendences
RUN composer install



