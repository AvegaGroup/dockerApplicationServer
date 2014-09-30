# Dockerfile for a git server
#
FROM ubuntu:14.04
MAINTAINER Mikael Sennerholm <mikael@sennerholm.net>

# To build we need to have some tools installed, mvn etc
# update packages and install maven
RUN  \
  export DEBIAN_FRONTEND=noninteractive && \
  sed -i 's/\(archive.ubuntu.com\)/se.\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y git

VOLUME /git

# Start git
CMD ls -la /git/ && git daemon --reuseaddr --export-all --verbose --base-path=/git /git 
EXPOSE 9418