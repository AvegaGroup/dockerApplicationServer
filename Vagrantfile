# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

#    config.vm.network :forwarded_port, guest: 4243, host: 12345
# Not working to change the docker port, run 
# sudo launchctl unload /Library/LaunchDaemons/com.crashplan.engine.plist
# to stop Crashplan


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "appServer" do |config|
  config.vm.network :forwarded_port, guest: 8080, host: 8080
    config.vm.provider "docker" do |d|
      d.build_dir = "." 
      d.name = "appServer"
      d.vagrant_vagrantfile = "./docker/Vagrantfile"
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
