FROM philippeassis/apache2
MAINTAINER philippeassis/php5 PhilippeAssis <assis@philippeassis.com>

RUN add-apt-repository ppa:ondrej/php5-5.6 -y && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && apt-get update
RUN apt-get install -y php5 php5-mysql php5-dev php5-gd php5-memcache php5-pspell php5-snmp snmp php5-xmlrpc libapache2-mod-php5 php5-cli

RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php &&\
   php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '7228c001f88bee97506740ef0888240bd8a760b046ee16db8f4095c0d8d525f2367663f22a46b48d072c816e7fe19959') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" &&\
   php composer-setup.php --install-dir=bin --filename=composer &&\
   php -r "unlink('composer-setup.php');"

RUN bash &&\
   echo "alias www='cd /var/www/html'" >> ~/.bash_aliases &&\
   echo "alias gitall='git add --all && git commit -m \"commit\" && git push origin master'" >> ~/.bash_aliases &&\
   chmod -R 777 /var/www/html
