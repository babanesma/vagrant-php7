# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "web", "/var/www/html"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.ssh.forward_agent = true
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.customize ["modifyvm", :id, "--name", "vagrant-php7"]
  end
  
  config.vm.provision "shell", path: "install.sh"
end
