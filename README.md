docker-phabricator
==================

Phabricator container with Vagrant development environment

Instructions
------------
  1. install [Vagrant][1]
  2. install [Docker][2]
  3. `vagrant plugin install docker`
  4. `vagrant up`
  5. see http://127.0.0.1/ (if you get a connection reset, wait about 30
  seconds for everything to finish starting. The first run must initialize the
  database schema.)

If you change the `Dockerfile` or other stuff, `vagrant reload` will re-build
everything.

There are some very rudimentary integration tests. Run them with `test.sh`
after bringing up the vagrant environment. This will build a test container and
make some quick checks about how the phabricator and mysql containers respond
to their network interfaces.

Why is this cool?
-----------------
Docker provides isolated, reproducable, fast environments for services. Vagrant
makes it trivial to run several containers on the local host for development.

One might envision a platform to deploy Docker containers at a larger scale...

  [1]: http://vagrantup.com/
  [2]: http://docker.io/
