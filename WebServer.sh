#!/bin/bash
while true; do
    echo "|                  MENU                |"
    echo "[1] Update"
    echo "[2] Install Apache"
    echo "[3] Exit"
    echo "......................................."
    read -p "Please enter the number : " input
    case $input in
    1)
        sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
        sudo apt-get install unp
        sudo apt install unzip
        ;;
    2)
        printf 'Set your Database password: '
        read password
        #service apache2 stop
        #apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
        apt-get remove --purge mysql-server php-mysql -y
        apt-get autoremove --purge -y
        apt-get autoclean
        #rm rm -Rf /etc/apache2 /usr/lib/apache2 /usr/include/apache2
        rm -rf /etc/mysql
        find / -iname 'mysql*' -exec rm -rf {} \;

        timedatectl set-timezone Asia/Bangkok
        apt-get update

        #install apeche2
        sudo apt update
        sudo apt install apache2 -y
        sudo ufw app list
        sudo ufw allow in "Apache"
        sudo ufw status
        #install mysql
        sudo debconf-set-selections <<<'mysql-server mysql-server/root_password password '$password
        sudo debconf-set-selections <<<'mysql-server mysql-server/root_password_again password '$password

        #install php
        sudo apt-get install mysql-server mysql-client -y
        sudo apt install software-properties-common
        sudo add-apt-repository ppa:ondrej/php
        sudo apt update
        sudo apt install -y php8.0 libapache2-mod-php8.0
        sudo systemctl restart apache2
        php -v
        sudo apt install php8.0-common php8.0-mysql -y php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opca

        #install phpmyadmin
        sudo apt-get install phpmyadmin -y
        sudo ln -s /usr/share/phpmyadmin /var/www/html

        #install composer
        sudo apt update
        sudo apt install php-cli unzip
        cd ~
        curl -sS https://getcomposer.org/installer -o composer-setup.php
        HASH=$(curl -sS https://composer.github.io/installer.sig)
        php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
        sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
        composer
        sudo a2dissite 000-default.conf
        sudo a2ensite laravel.conf
        sudo a2enmod rewrite
        sudo service apache2 restart
        MYIP=$(wget -qO- ipv4.icanhazip.com)
        printf '###############################\n'
        printf '# Script by Kittithon #\n'
        printf '#                             #\n'
        printf '###############################\n\n'
        ;;
    3)
        echo "END"
        exit
        ;;

    *) ;;
    esac
done
