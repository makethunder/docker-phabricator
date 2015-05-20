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
  (cd libphutil && git checkout 72ea80ff1468f2dee030ff9edcfc504a5ea79c02) &&\
  git clone https://github.com/phacility/arcanist.git && \
  (cd arcanist && git checkout e3311f08328fda758c4d5e270abf763a15f7dc0a) &&\
  git clone https://github.com/phacility/phabricator.git && \
  (cd phabricator && git checkout cbc5ad1604d02c805c899faefe75794add8bfa6b)

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
