FROM ubuntu:14.04

RUN \
  apt-get -qq update && apt-get -y install shelltestrunner curl

ADD . /usr/local/test

WORKDIR /usr/local/test

CMD ["shelltest", "/usr/local/test"]
