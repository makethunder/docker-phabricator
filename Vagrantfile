# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'mysql' do |mysql|
    mysql.vm.provider 'docker' do |d|
      d.image = 'mysql'
      d.name = 'mysql'
      d.env = { 'MYSQL_ROOT_PASSWORD' => 'mysqlroot' }
    end
  end

  config.vm.define 'phabricator' do |phabricator|
    phabricator.vm.network "forwarded_port", guest: 80, host: 80
    phabricator.vm.provider 'docker' do |d|
      d.build_dir = 'phabricator'
      d.name = 'phabricator'
      d.link('mysql:mysql')
    end
  end
end
