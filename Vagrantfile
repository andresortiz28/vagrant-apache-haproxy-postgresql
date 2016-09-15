# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  config.vm.define :centos_web_server do |server|   
     server.vm.box = "centos64_update"
     server.vm.network :private_network, ip: "192.168.56.101"
     server.vm.network "public_network", :bridge => "eth3", ip:"192.168.130.91", :auto_config => "false", :netmask => "255.255.255.0"
     server.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "1", "--name", "centos_web_server" ]
     end
     config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "haproxy"
     end  
  end

  config.vm.define :centos_web_node1 do |node1|   
     node1.vm.box = "centos64_update"
     node1.vm.network :private_network, ip: "192.168.56.102"
     node1.vm.network "public_network", :bridge => "eth3", ip:"192.168.130.92", :auto_config => "false", :netmask => "255.255.255.0"
     node1.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "1", "--name", "centos_web_node1" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "apache"
    end 
  end

  config.vm.define :centos_web_node2 do |node2|   
     node2.vm.box = "centos64_update"
     node2.vm.network :private_network, ip: "192.168.56.103"
     node2.vm.network "public_network", :bridge => "eth3", ip:"192.168.130.93", :auto_config => "false", :netmask => "255.255.255.0"
     node2.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "1", "--name", "centos_web_node2" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "apache"
    end 
  end

  config.vm.define :centos_database do |db|
     db.vm.box = "centos64_update"
     db.vm.network :private_network, ip: "192.168.56.104"
     db.vm.network "public_network", :bridge => "eth3", ip:"192.168.130.94", :auto_config => "false", :netmask => "255.255.255.0"
     db.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "1", "--name", "centos_database" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "postgres"
    end 
  end

end