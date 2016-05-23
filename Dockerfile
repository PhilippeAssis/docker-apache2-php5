FROM philippeassis/apache2:latest
MAINTAINER philippeassis/php5 PhilippeAssis <assis@philippeassis.com>

RUN add-apt-repository ppa:ondrej/php5-5.6 -y && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && apt-get update
RUN apt-get install -y php5 php5-mysql php5-dev php5-gd php5-memcache php5-pspell php5-snmp snmp php5-xmlrpc libapache2-mod-php5 php5-cli
