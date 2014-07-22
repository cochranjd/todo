# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian-x64"
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.ssh.forward_agent = true

  config.vm.provision "chef_solo" do |chef|
    chef.custom_config_path = "Vagrantfile.chef"

  chef.add_recipe "hostname"
    chef.add_recipe "tz"
    chef.add_recipe "apt"
    chef.add_recipe "ruby"
    chef.add_recipe "nginx"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "myiptables"
    chef.add_recipe "fail2ban"
    chef.add_recipe "setupdeployer"
    chef.add_recipe "sudo"

    chef.json = {
      postgresql: {
        password: {
          postgres: 'Password12345!'
        }
      },
      authorization: {
        sudo: {
          users: [ 'deployer' ]
        }
      },
      set_fqdn: "mytestbox"
    }
  end
end
