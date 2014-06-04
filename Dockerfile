FROM ubuntu:14.04
MAINTAINER mikael@sennerholm.net
RUN apt-get update
RUN apt-get -y install tomcat7
EXPOSE 8080
#CMD /usr/share/tomcat7/bin/catalina.sh run

