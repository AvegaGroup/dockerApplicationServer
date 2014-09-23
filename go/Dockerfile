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

VOLUME /etc/go/changed
RUN rm -f /etc/go/cruise-config.xml
RUN ln -s /etc/go/changed/cruise-config.xml /etc/go/cruise-config.xml

#CMD /etc/init.d/go-server start && tail -F /var/log/go-server/go-server.log
CMD chown -R go:go /etc/go/changed && ls -l /etc/go && ls /etc/go/changed && /etc/init.d/go-server start && tail -F /var/log/go-server/go-server.log 

EXPOSE 8153
EXPOSE 8154
