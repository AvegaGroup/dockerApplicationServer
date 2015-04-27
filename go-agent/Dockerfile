# Dockerfile for ThoughtWorks Go Server (http://www.go.cd)
#
# Inspired by:
# http://github.com/patforna/docker/go-server
# http://www.go.cd/2014/05/18/manage-agents-with-docker.html

FROM java:8-jdk
MAINTAINER Mikael Sennerholm <mikael@sennerholm.net>

# Download 14.2.0 
RUN wget -O /tmp/go-agent.deb http://download.go.cd/gocd-deb/go-agent-14.4.0-1356.deb && \
	dpkg -i /tmp/go-agent.deb && \
	rm -f /tmp/go-agent.deb && \
  	export DEBIAN_FRONTEND=noninteractive && \
  	sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  	sed -i 's/\(archive.ubuntu.com\)/se.\1/g' /etc/apt/sources.list && \
  	apt-get update && \
  	apt-get -y upgrade && \
  	apt-get install -y vim wget curl git maven && \
  	curl -sSL https://get.docker.io/ubuntu/ | sh && \
  	apt-get clean


# Add maven settings
COPY maven-settings.xml /root/.m2/settings.xml
COPY autoregister.properties /var/lib/go-agent/config/autoregister.properties
COPY go-agent /etc/default/go-agent

# This should probably be something like supervisord to keep the container running
CMD /usr/share/go-agent/agent.sh && tail -F /var/log/go-agent/go-agent.log
