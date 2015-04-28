dockerApplicationServer
=======================

dockerApplicationServer

Starta med:
  vagrant up --no-parallel --provider docker

Förutsättningar:
 VirtualBox
 Vagrant från vagrantup.com (1.6.5 eller nyare). Om man har 1.6.5 så
 behöver patch enligt beskrivning längst ner läggas in.

Surfa därefter till:
  http://127.0.0.1:28153/go för go:

och:
 http://127.0.0.1:58080 för doodleshop i produktion

Övriga portmappings:
 28080 autosmall
 38080 autolarge
 48080 man
 58080 prod

Så får du upp en pipeline


## Patch för Vagrant 1.6.5

Ändringen från:

https://github.com/mitchellh/vagrant/commit/57a1269e353c7858d6989dd42e5e96c416344755#diff-c96c34335d9512cac6d05cc227bd8189

behöver läggas in för att man inte ska få problem när man laddar hem färdiga docker images.

### Exempel på Mac OS med Vagrant installaerat från vagrantup 

(till Applications/Vagrant/embedded/gems/gems/vagrant-1.6.5)
Ändra filen /plugins/providers/docker/driver.rb, leta reda på rad 56:

execute(*run_cmd.flatten, **opts, &block).chomp

och lägg in

.lines.last 

på slutet


# Med Docker-compose (fd fig)

installera boot2docker

boot2docker öka minnet i virtualbox till 4GB från 2GB, t ex genom:
  $ boot2docker delete
  $ boot2docker init -m 5555
... lots of output ...
 $ boot2docker info

Starta boot2docker:
 boot2docker up

installera Docker compose enligt http://docs.docker.com/compose/install/

För att starta din miljö:
 docker-compose up

Surfa därefter in på (Linux: Localhost, Mac boot2docker ip):28153/go

För att starta en till agent och skala upp miljön:
  docker-compose scale goagent=2
