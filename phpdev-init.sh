#!/bin/bash

sudo apt install -y gcc make curl zsh git mysql-server php-fpm 


debconf-set-selections <<< "phpmyadmin phpmyadmin/internal/skip-preseed boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect"
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"  
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-user string phpmyadmin"  
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password phpmyadmin"  

sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install phpmyadmin


sudo apt update
sudo apt install -y software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
sudo apt install -y code

#  В файле mysql.txt находится sql-код
sudo mysql < mysql.txt
