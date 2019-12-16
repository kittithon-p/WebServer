#!/bin/bash
while true;
do
echo "|                  MENU                |"
echo "[1] Update"
echo "[2] Install Apache"
echo "[3] Install MySQL"
echo "[4] EXIT"
echo "......................................."
read -p "Please enter the number : " input
case $input in
			1)sudo apt update && sudo apt upgrade -y;;
			
			2)sudo apt-get install apache2;; 
			
			3)sudo apt-get install mysql-server mysql-client -y
				sudo apt-get install php libapache2-mod-php
				sudo apt-cache search php-
                sudo apt-get install phpmyadmin
                sudo ln -s /usr/share/phpmyadmin /var/www/html
                sudo service apache2 restart;;
				
			4)echo "END" ;exit;;;;
        *);;
        esac
done
