# Dockerfile for ThoughtWorks Go Server (http://www.go.cd)
#
# Inspired by:
# http://github.com/patforna/docker/go-server
# http://www.go.cd/2014/05/18/manage-agents-with-docker.html
FROM gocd/gocd-agent:14.4.0


#Install docker, so we can build images on agents
RUN echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list &&\
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 && \
	apt-get install -y apt-transport-https && \ 
	apt-get update && \
	apt-get install -y lxc-docker-1.4.1

# This file has my authorization string so that I don't have to approve new agents. 
#ADD autoregister.properties /var/lib/go-agent/config/autoregister.properties

# Specifies that the name of the server is go-server
# linked container needs to have this name.
ADD go-agent /etc/default/go-agent
RUN chmod 400 /root/.ssh/id_rsa &&\
 	eval "$(ssh-agent -s)"

# This should probably be something like supervisord to keep the container running
CMD ["/sbin/my_init"]
