# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

#    config.vm.network :forwarded_port, guest: 4243, host: 12345
#    config.vm.forward_port 4243, 14243
# Not working to change the docker port, run 
# sudo launchctl unload /Library/LaunchDaemons/com.crashplan.engine.plist
# to stop Crashplan


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

# config.vm.provider "virtualbox" do |v|
    # On VirtualBox, we don't have guest additions or a functional vboxsf
    # in TinyCore Linux, so tell Vagrant that so it can be smarter.
#    v.check_guest_additions = false
#    v.functional_vboxsf     = false
#    v.customize ["modifyvm", :id, "--memory", "1024"]
#  end

  config.vm.define "go" do |config|
  config.vm.synced_folder "go/etc/", "/etc/go/changed" 
    config.vm.provider "docker" do |d|
      d.vagrant_vagrantfile = "docker/Vagrantfile"
      d.build_dir = "go" 
      d.ports = [ "28153:8153" ]
      d.name = "go-server"
    end
  end

#    # We need to persistent data somewhere
#    config.vm.define "testdb" do |app|
#     app.vm.provider "docker" do |d|
#       d.image = "paintedfox/postgresql"
#       d.name = "testdb"
#       d.env = {"DB"   => "petclinic",
#       	       "PASS" => "mac",
#       	       "USER" => "pc"}
# 	       # Use vagrant docker-logs to se that it works!!!
#     end
#   end
end
