#!/bin/bash -xe

# System Updates
yum -y update
yum -y upgrade
yum -y install httpd wget
systemctl enable httpd
systemctl start httpd

# Install Wordpress
wget https://cl-sharedmedia.s3.amazonaws.com/genericcatpicwebsite/index.html -P /var/www/html
wget https://cl-sharedmedia.s3.amazonaws.com/genericcatpicwebsite/milky.jpeg -P /var/www/html
wget https://cl-sharedmedia.s3.amazonaws.com/genericcatpicwebsite/nori.jpeg -P /var/www/html
wget https://cl-sharedmedia.s3.amazonaws.com/genericcatpicwebsite/sushi.jpeg -P /var/www/html
cd /var/www/html

# permissions 
usermod -a -G apache ec2-user   
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;