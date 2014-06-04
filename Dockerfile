FROM ubuntu:14.04
MAINTAINER mikael@sennerholm.net
RUN apt-get update
RUN apt-get -y install openjdk-7-jre-headless
ADD bin/doodleshop.war /doodleshop.war
EXPOSE 8080
CMD java -jar /doodleshop.war
