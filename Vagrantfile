# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "web", "/var/www/html"
  config.vm.network :private_network, ip: "192.168.11.11"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.customize ["modifyvm", :id, "--name", "vagrant-php7"]
  end
  
  config.vm.provision "shell", path: "install.sh"
end
