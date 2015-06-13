#!/bin/bash

# upgrade the platform
sudo apt-get update ; sudo apt-get upgrade -y ;

# install prerequisities
sudo apt-get install librecode-dev autoconf re2c bison libxml2-dev libcurl4-openssl-dev libzip-dev libjpeg-dev libpng++-dev libxpm-dev libfreetype6-dev libgmp-dev libmcrypt-dev libpspell-dev libt1-dev libbz2-dev -y ;
sudo ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h ;

# install apache2
sudo apt-get install apache2 -y ;

# install mysql-server
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root' ;
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root' ;
sudo apt-get install mysql-server -y ;
sudo apt-get install mysql-client libmysqlclient-dev -y ;


cd /vagrant/php-src ;
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

# enable php7 with apache
# cp /vagrant/php-src/libphp7.so /usr/lib/apache2/modules/ ;
# cp /vagrant/php-src/php7.load /etc/apache2/mods-available/ ;

# echo "<FilesMatch \.php$>\n
# SetHandler application/x-httpd-php\n
# </FilesMatch>" >> /etc/apache2/apache2.conf ;

# switch to mpm_prefork and enable the PHP mpm module
# sudo a2dismod mpm_event ;
# sudo a2enmod mpm_prefork ;
# sudo a2enmod php7 ;