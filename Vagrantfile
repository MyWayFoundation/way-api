# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. 
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provision :shell, :path => "vagrant/bootstrap.sh"

  # forward port 3000 for the server
  config.vm.network :forwarded_port, host: 3000, guest: 3000

  # forward port 8080 for node-inspector based debugging
  config.vm.network :forwarded_port, host: 8080, guest: 8080
end
