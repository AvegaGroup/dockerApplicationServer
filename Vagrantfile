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

  # # Not used at the moment
  # config.vm.define "git" do |config|
  #   config.vm.synced_folder "data/git", "/git" 
  #   config.vm.provider "docker" do |d|
  #     force_host_vm = true
  #     d.vagrant_vagrantfile = "docker/Vagrantfile"
  #     d.build_dir = "git" 
  #     d.ports = [ "19418:9418" ]
  #     d.name = "git"
  #   end
  # end

 config.vm.define "repository" do |config|
   config.vm.provider "docker" do |d|
      d.force_host_vm = true
      d.vagrant_vagrantfile = "docker/Vagrantfile"
      d.image = "mattgruter/artifactory"
      d.volumes = [ "/vagrant/artifactory/logs:/artifactory/logs" ]
      d.name = "repository"
      d.ports = [ "19090:8080" ]
      d.remains_running = false
    end
  end

 config.vm.define "haproxy" do |config|
   config.vm.provider "docker" do |d|
      d.force_host_vm = true
      d.vagrant_vagrantfile = "docker/Vagrantfile"
      d.image = "haproxy"
      d.volumes = [ "/vagrant/haproxy:/haproxy-override" ]
      d.name = "haproxy"
      d.ports = [ "18080:8080" ]
      d.remains_running = false
    end
  end

  #Not used ast the moment
  # config.vm.define "registry" do |config|
  #   config.vm.synced_folder "data/registry/storage", "/storage" 
  #   config.vm.provider "docker" do |d|
 #     d.vagrant_vagrantfile = "docker/Vagrantfile"
#       d.force_host_vm = true
  #     d.image = "registry"
  #     d.name = "registry"
  #     d.env = {"STORAGE_PATH"   => "/storage", 
  #     	       "SETTINGS_FLAVOR"=> "local"}
  #     d.ports = [ "5000:5000" ]
  #     d.remains_running = false
  #   end
  # end

  config.vm.define "go" do |config|
#    config.vm.synced_folder "go/etc/", "/etc/go/changed" 
#    config.vm.network "forwarded_port", guest: 8153, host: 28153
    config.vm.provider "docker" do |d|
      d.vagrant_vagrantfile = "docker/Vagrantfile"
      d.force_host_vm = true
      d.build_dir = "go" 
      d.expose = [ 8154 ]
      d.ports = [ "28153:8153" ]
      d.name = "go-server"
#      d.link("git:git")
# For nginx proxy to find it.
#      d.env = {"VIRTUAL_HOST"   => "go.lab.sennerholm.net",
#       	       "VIRTUAL_PORT"   => "28153"}

    end
  end


  config.vm.define "go-agent" do |config|
    config.vm.provider "docker" do |d|
      d.force_host_vm = true
      d.vagrant_vagrantfile = "docker/Vagrantfile"
      d.build_dir = "go-agent" 
      d.name = "go-agent"
      d.volumes = [ "/var/run/docker.sock:/var/run/docker.sock" ]
      d.link("go-server:go-server")
      d.link("repository:repository")
#      d.link("git:git")
    end
  end

  # config.vm.define "nginx-proxy" do |config|
  #   config.vm.provider "docker" do |d|
  #     d.vagrant_vagrantfile = "docker/Vagrantfile"
  #     d.image = "jwilder/nginx-proxy"
  #     d.name = "proxy"
  #     d.ports = [ "80:80" ]
  #     d.volumes = [ "/var/run/docker.sock:/tmp/docker.sock" ]
  #   end
  # end


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
