docker-phabricator
==================

Phabricator container with Vagrant development environment

instructions
------------
  1. install [Vagrant][1]
  2. install [Docker][2]
  3. `vagrant plugin install docker`
  4. `vagrant up`
  5. see http://127.0.0.1/
  
If you frob the `Dockerfile` or other stuff, `vagrant reload` will re-build everything.
  
why is this cool?
-----------------
Docker provides isolated, reproducable, fast environments for services. Vagrant makes
it trivial to run several containers on the local host for development.

One might envision a platform to deploy Docker containers at a larger scale...

  [1]: http://vagrantup.com/
  [2]: http://docker.io/
