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
                        1)sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
                                sudo apt-get install unp
                                sudo apt install unzip;;
                        2)sudo apt update
				sudo apt install apache2
				sudo ufw app list
				sudo ufw allow in "Apache"
				sudo ufw status
				sudo apt-get install mysql-server mysql-client -y
				sudo apt install php libapache2-mod-php php-mysql
				php -v
				sudo apt install php7.4-mysql -y
				sudo apt install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opca
                                sudo apt-get install phpmyadmin -y
				sudo ln -s /usr/share/phpmyadmin /var/www/html
				sudo apt update
				sudo apt install php-cli unzip
				cd ~
				curl -sS https://getcomposer.org/installer -o composer-setup.php
				HASH=`curl -sS https://composer.github.io/installer.sig`
				php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
				sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
				composer
                                sudo a2dissite 000-default.conf
                                sudo a2ensite laravel.conf
                                sudo a2enmod rewrite
                                sudo service apache2 restart;;
3)echo "END" ;exit;;

        *);;
        esac
done

