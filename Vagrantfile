# -*- coding: utf-8 -*-
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
# Felsökning med:
# vagrant global-status | grep docker
# vagrant ssh a+????
# docker ps -a
# docker run -v /var/lib/docker/docker_1411497627_69050:/etc/go/changed -it d1fa8897ed51 /bin/bash

# vagrant reload för att bygga om och ladda om vid behov (utan att destroya)

  config.vm.define "go" do |config|
    config.vm.synced_folder "go/etc/", "/etc/go/changed" 
#    config.vm.network "forwarded_port", guest: 8153, host: 28153
    config.vm.provider "docker" do |d|
      d.vagrant_vagrantfile = "docker/Vagrantfile"
      d.build_dir = "go" 
      d.expose = [ 8154 ]
      d.ports = [ "28153:8153" ]
      d.name = "go-server"
    end
  end

  config.vm.define "go-agent" do |config|
#    config.vm.synced_folder "go-agent/etc/", "/etc/go-agent/changed" 
    config.vm.provider "docker" do |d|
      d.vagrant_vagrantfile = "docker/Vagrantfile"
      d.build_dir = "go-agent" 
#      d.ports = [ "28153:8153" ]
      d.name = "go-agent"
      d.link("go-server:go-server")
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
