# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.box = "os-oneiric"
    config.vm.forward_port 80, 8081
    config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "cookbooks"
        chef.add_recipe "wheel::stack"
        chef.log_level = :debug
	 chef.roles_path = "roles"
    chef.add_role("n-api")
    chef.add_role("n-sh")
    end 
end

