.PHONY: dep all name run

dep:
	sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
	sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
	sudo yum -y install yum-utils
	sudo yum-config-manager --enable remi-php74
	sudo yum update
	sudo yum install php php-cli
	sudo yum install php  php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json

all: dep run

name:
	read -p "Enter username: " name; echo name

run:
	read -p "Enter username: " name; read -p "Enter user server: " server; cd ..; ln -s "$$(pwd)" "/var/www/html/$$name";	echo "/var/www/html/$$name"; sed -i "s,\"root\";s:1:\"/\",\"root\";s:$${#name}:\"/$$name\",gi" $$(pwd)/web-ide/data/config-admin-$$server.php
	sudo chmod -R 777 ../*
	sudo chown -R www-data.www-data ../*
	echo "Open http://<user_server>/<user_name>/ in your browser"
