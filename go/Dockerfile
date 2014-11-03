# Dockerfile for ThoughtWorks Go Server (http://www.go.cd)
#
# Based on: 
# http://github.com/patforna/docker/go-server

FROM dockerfile/java
MAINTAINER Mikael Sennerholm <mikael@sennerholm.net>

#Om den är dynamisk så kan den inte cacha information
#ENV GO_DOWNLOAD_URL http://download01.thoughtworks.com/go/14.1.0/ga/go-server-14.1.0-18882.deb

#RUN wget -O /tmp/go-server.deb ${GO_DOWNLOAD_URL}
#RUN wget -O /tmp/go-server.deb http://download01.thoughtworks.com/go/14.1.0/ga/go-server-14.1.0-18882.deb
RUN wget -O /tmp/go-server.deb http://download.go.cd/gocd-deb/go-server-14.2.0-377.deb
RUN dpkg -i /tmp/go-server.deb
RUN rm -f /tmp/go-server.deb

ADD etc/cruise-config.xml /etc/go/cruise-config.xml
# Verkar inte bita av någon anledning
RUN chown -R go:go /etc/go 

#CMD chown -R go:go /etc/go && ls -l /etc/go && /etc/init.d/go-server start && tail -F /var/log/go-server/go-server.log 
CMD ls -l /etc/go && /etc/init.d/go-server start && tail -F /var/log/go-server/go-server.log 

EXPOSE 8153
EXPOSE 8154
