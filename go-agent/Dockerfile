# Dockerfile for ThoughtWorks Go Server (http://www.go.cd)
#
# Inspired by:
# http://github.com/patforna/docker/go-server
# http://www.go.cd/2014/05/18/manage-agents-with-docker.html

FROM dockerfile/java:oracle-java8
MAINTAINER Mikael Sennerholm <mikael@sennerholm.net>

# Download 14.2.0 
RUN wget -O /tmp/go-agent.deb http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb
RUN dpkg -i /tmp/go-agent.deb
RUN rm -f /tmp/go-agent.deb

# To build we need to have some tools installed, mvn etc
# update packages and install maven
RUN  \
  export DEBIAN_FRONTEND=noninteractive && \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  sed -i 's/\(archive.ubuntu.com\)/se.\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y vim wget curl git maven

#Install docker
RUN curl -sSL https://get.docker.io/ubuntu/ | sudo sh

# Config files, latest so all downloads is cached

# Go-agent needs to run sudo to do docker commands
#Provably not needed because it's running as root
#ADD sudoers /etc/sudoers.d/go-agent
#RUN chmod 0440 /etc/sudoers.d/go-agent

# Add maven settings
ADD maven-settings.xml /root/.m2/settings.xml
#RUN chown -R go:go /var/go/.m2

# This file has my authorization string so that I don't have to approve new agents. 
ADD autoregister.properties /var/lib/go-agent/config/autoregister.properties

# This file is also very specific to my installation. It tells the Go agent where the Go server
# is on my internal network. 
# Try if it can handle without beacuse the server name is go-server...
ADD go-agent /etc/default/go-agent


# This should probably be something like supervisord to keep the container running
CMD /usr/share/go-agent/agent.sh && tail -F /var/log/go-agent/go-agent.log