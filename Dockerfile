FROM php:7.2-apache

RUN apt-get update && apt-get install -y --no-install-recommends libfreetype6-dev \
libjpeg62-turbo-dev \
libmcrypt-dev libpng-dev \
libzip-dev \
libzip4 \
git \
zip \
wget \
&& apt-get autoremove \
&& apt-get clean \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install gd \
&& docker-php-ext-configure zip --with-libzip=/usr/include/ \
&& docker-php-ext-install zip 

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo pdo_mysql


