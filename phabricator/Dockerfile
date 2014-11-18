FROM ubuntu:14.04

RUN \
  apt-get -qq update && \
  apt-get -y install git apache2 dpkg-dev php5 php5-mysql php5-gd \
  php5-dev php5-curl php-apc php5-cli php5-json

RUN \
  mkdir /usr/local/phabricator && \
  cd /usr/local/phabricator && \
  git clone https://github.com/phacility/libphutil.git && \
  git clone https://github.com/phacility/arcanist.git && \
  git clone https://github.com/phacility/phabricator.git

RUN a2enmod rewrite && a2dissite 000-default
ADD apache.conf /etc/apache2/sites-enabled/000-phabricator.conf
ADD start /usr/local/phabricator/start

VOLUME /var/repo
VOLUME /usr/local/phabricator/phabricator/conf/local

CMD ["/usr/local/phabricator/start"]
EXPOSE 80
