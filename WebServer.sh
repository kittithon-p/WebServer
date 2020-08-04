#!/bin/bash
while true;
do
echo "|                  MENU                |"
echo "[1] Update"
echo "[2] Install Apache"
echo "[3] Exit"
echo "......................................."
read -p "Please enter the number : " input
case $input in
			1)sudo apt update && sudo apt upgrade -y
				sudo apt-get install unp
				sudo apt install unzip;;
			2)sudo apt install software-properties-common
				sudo add-apt-repository ppa:ondrej/php
				sudo apt update
				sudo apt install php7.4 -y
				sudo apt-get install mysql-server mysql-client -y
				sudo apt install php7.4-mysql -y
				sudo apt install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl -y
				sudo apt-get install phpmyadmin -y
                sudo ln -s /usr/share/phpmyadmin /var/www/html
				sudo a2dissite 000-default.conf
				sudo a2ensite laravel.conf
				sudo a2enmod rewrite
				sudo service apache2 restart;;
			3)echo "END" ;exit;;
			
        *);;
        esac
done