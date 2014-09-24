# Dockerfile for ThoughtWorks Go Server (http://www.go.cd)
#
# Inspired by:
# http://github.com/patforna/docker/go-server
# http://www.go.cd/2014/05/18/manage-agents-with-docker.html

FROM dockerfile/java
MAINTAINER Mikael Sennerholm <mikael@sennerholm.net>

# Download 14.2.0 
RUN wget -O /tmp/go-agent.deb http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb
RUN dpkg -i /tmp/go-agent.deb
RUN rm -f /tmp/go-agent.deb

# This file has my authorization string so that I don't have to approve new agents. 
ADD autoregister.properties /var/lib/go-agent/config/autoregister.properties

# This file is also very specific to my installation. It tells the Go agent where the Go server
# is on my internal network.
ADD go-agent /etc/default/go-agent

# To build we need to have some tools installed, mvn etc
# update packages and install maven
RUN  \
  export DEBIAN_FRONTEND=noninteractive && \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y vim wget curl git maven

# This should probably be something like supervisord to keep the container running
CMD /usr/share/go-agent/agent.sh && tail -F /var/log/go-agent/go-agent.log