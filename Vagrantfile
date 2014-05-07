# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "precise32"
	config.vm.box_url = "http://files.vagrantup.com/precise32.box"

	config.vm.network "forwarded_port", guest: 80, host: 80
	config.vm.network "forwarded_port", guest: 80, host: 8080
	config.vm.network "forwarded_port", guest: 443, host: 8085
	config.vm.network "private_network", ip: "10.0.0.10"
	config.ssh.forward_agent = true

	config.vm.synced_folder "../publish", "/var/www"

	config.vm.provision "puppet" do |puppet|
		puppet.manifests_path = "puppet/manifests"
		puppet.manifest_file  = "puppet.pp"
		puppet.module_path = "puppet/modules"
		#puppet.options = "--verbose --debug"	  
	end
end
