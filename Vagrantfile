# -*- mode: ruby -*-
# vi: set ft=ruby : 

Vagrant.configure("2") do |config|
  # Specify the base box
  config.vm.box = "ubuntu/bionic64"

  # Configure forwarded ports for APIs and database
  config.vm.network "forwarded_port", guest: 5000, host: 5000  # API 1
  config.vm.network "forwarded_port", guest: 5001, host: 5001  # API 2
  config.vm.network "forwarded_port", guest: 3306, host: 13306  # MySQL DB
  config.vm.network "forwarded_port", guest: 80, host: 8080    # Nginx

  # Create a private network for direct access
  config.vm.network "private_network", ip: "192.168.33.10"

  # Configure VirtualBox provider
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"  # Memory allocation
    vb.cpus = 2         # Number of CPUs
  end

  # Provisioning via a shell script
  config.vm.provision "shell", path: "setup.sh"
end
