#!/bin/sh

#copy inti script to syttem server
echo "Initialization..."
cp ./php-fpm /etc/init.d/
chmod +x /etc/init.d/php-fpm

#Installation dependent libraries
echo "Depends..."
apt-get install -y libpcre3-dev zlib1g-dev libxml2-dev libssl-dev libbz2-dev libmcrypt-dev libpng-dev libjpeg-dev libfreetype6-dev libc-client-dev libtidy-dev libsnmp-dev

#Set Environment Variables
echo "Set Environment Variables..."
cat pathinfo >> /etc/profile
source /etc/profile

#Set Startup Items
echo "StartUp..."
update-rc.d -f php-fpm defaults

#make run directory
mkdir var/run

#Display PHP Version
echo "The current version is:"
php -v
