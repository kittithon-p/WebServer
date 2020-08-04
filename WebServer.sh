#!/bin/bash
while true;
do
echo "|                  MENU                |"
echo "[1] Update"
echo "[2] Install Apache"
echo "[3] Install MySQL"
echo "[4] Download CodeIgniter"
echo "[5] Installing CodeIgniter"
echo "[6] Getcomposer"
echo "[7] Create-Project Laravel"
echo "[8] Set VirtualHost"
echo "[9] Restart Apache2"
echo "[10] Restart All"
echo "[11] PHP 7.4"
echo "[12] EXIT"
echo "......................................."
read -p "Please enter the number : " input
case $input in
			1)sudo apt update && sudo apt upgrade -y
				sudo apt-get install unp
				sudo apt install unzip;;
			
			2)sudo apt-get install apache2 -y;; 
			
			3)sudo apt-get install mysql-server mysql-client -y
			sudo apt install php7.0-mysql -y
				sudo apt-get install php libapache2-mod-php -y
				sudo apt-cache search php-
                sudo apt-get install phpmyadmin -y
                sudo ln -s /usr/share/phpmyadmin /var/www/html
                sudo service apache2 restart;;
				
			4)cd /var/www/html
			    wget https://github.com/bcit-ci/CodeIgniter/archive/3.1.11.zip
				unzip 3.1.11.zip;;
			
			5)cd /var/www/html
				read -p "CodeIgniter project name is: " project
				sudo mv CodeIgniter-3.1.11 $project;;
				
			6)cd /tmp
				curl -sS https://getcomposer.org/installer | php
				sudo mv composer.phar /usr/local/bin/composer
				sudo composer global require laravel/installer;;

			7)cd /var/www/html
				read -p "laravel project name is: " project
				sudo sudo composer create-project laravel/laravel $project --prefer-dist
				sudo chgrp -R www-data /var/www/html/$project
				sudo chmod -R 775 /var/www/html/$project/storage;;
				
			8)cd /etc/apache2/sites-available
				sudo nano laravel.conf;;
				
			9)sudo service apache2 restart;;
			
			10)sudo a2dissite 000-default.conf
				sudo a2ensite laravel.conf
				sudo a2enmod rewrite
				sudo service apache2 restart;;
			11)sudo apt install software-properties-common
				sudo add-apt-repository ppa:ondrej/php
				sudo apt update
				sudo apt install php7.4 -y
				sudo apt install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl -y;;
			12)echo "END" ;exit;;
			
        *);;
        esac
done
