#!/bin/bash

# upgrade the platform
sudo apt-get update ; sudo apt-get upgrade -y ;

# start installing php7;
cd /vagrant/php7/php-src ;
git pull ;
./buildconf ;
./configure \
    --prefix=/vagrant/php7/usr \
    --with-config-file-path=/vagrant/php7/usr/etc \
    --enable-mbstring \
    --enable-zip \
    --enable-bcmath \
    --enable-pcntl \
    --enable-ftp \
    --enable-exif \
    --enable-calendar \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-wddx \
    --with-curl \
    --with-mcrypt \
    --with-iconv \
    --with-gmp \
    --with-pspell \
    --with-gd \
    --with-jpeg-dir=/usr \
    --with-png-dir=/usr \
    --with-zlib-dir=/usr \
    --with-xpm-dir=/usr \
    --with-freetype-dir=/usr \
    --with-t1lib=/usr \
    --enable-gd-native-ttf \
    --enable-gd-jis-conv \
    --with-openssl \
    --with-mysql=/usr \
    --with-pdo-mysql=/usr \
    --with-gettext=/usr \
    --with-zlib=/usr \
    --with-bz2=/usr \
    --with-recode=/usr \
    --with-mysqli=/usr/bin/mysql_config ;

make ;
make install ;

# copy ini file
sudo cp /vagrant/php7/php-src/php.ini-development /usr/local/php.ini
