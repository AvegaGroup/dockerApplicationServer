# Dockerfile for ThoughtWorks Go Server Agent (http://www.go.cd)
#
# Inspired by:
# http://github.com/patforna/docker/go-server
# http://www.go.cd/2014/05/18/manage-agents-with-docker.html

FROM maven:3-jdk-8
MAINTAINER Mikael Sennerholm <mikael@sennerholm.net>

# Download and install Go-agent 15.1.0, curl/git and docker 
# http://download.go.cd/gocd-deb/go-agent-15.1.0-1863.deb
RUN wget -O /tmp/go-agent.deb http://download.go.cd/gocd-deb/go-agent-15.1.0-1863.deb && \
	dpkg -i /tmp/go-agent.deb && \
	rm -f /tmp/go-agent.deb && \ 
  	apt-get install -y curl git && \ 
  	curl -sSL https://get.docker.io/ubuntu/ | sh && \
  	apt-get clean # Clean up


# Add maven settings
COPY maven-settings.xml /root/.m2/settings.xml
COPY autoregister.properties /var/lib/go-agent/config/autoregister.properties
COPY go-agent /etc/default/go-agent

# This should probably be something like supervisord to keep the container running
CMD /usr/share/go-agent/agent.sh && tail -F /var/log/go-agent/go-agent.log
