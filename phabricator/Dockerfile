FROM ubuntu:14.04

RUN \
  apt-get -qq update && \
  apt-get -y install \
    apache2 \
    dpkg-dev \
    git \
    graphviz \
    php5 \
    php5-cli \
    php5-curl \
    php5-dev \
    php5-gd \
    php5-json \
    php5-ldap \
    php5-mysql \
    php-apc \
    python-pygments \
    && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  mkdir /usr/local/phabricator && \
  cd /usr/local/phabricator && \
  git clone https://github.com/phacility/libphutil.git && \
  (cd libphutil && git checkout 74c9cb3a266e7d6353c043dd744a97376fe62571) &&\
  git clone https://github.com/phacility/arcanist.git && \
  (cd arcanist && git checkout b697a3b80bdcc0dbb2d2c2ca4774227c83ea22a1) &&\
  git clone https://github.com/phacility/phabricator.git && \
  (cd phabricator && git checkout c1dca8238f7d89e4ed5ee4b70547d418aee3baf8)

ADD apache.conf /etc/apache2/sites-available/phabricator.conf

RUN \
  a2enmod rewrite && \
  a2ensite phabricator && \
  a2dissite 000-default

ADD start /usr/local/phabricator/start

VOLUME /var/repo
VOLUME /usr/local/phabricator/phabricator/conf/local

CMD ["/usr/local/phabricator/start"]
EXPOSE 80
