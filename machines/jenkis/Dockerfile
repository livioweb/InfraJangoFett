FROM jenkins/jenkins:lts
USER root
RUN apt update
RUN apt install -y sudo ansible vim curl sudo maven
RUN /bin/bash -c "apt-get install maven"
RUN curl -fsSL get.docker.com | bash

VOLUME /var/run/docker.sock
RUN adduser jenkins sudo
#RUN usermod -u 1004 jenkins
#RUN groupmod -g 999 docker
RUN usermod -aG docker jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN usermod -aG docker jenkins

#RUN chmod 777 /var/run/docker.sock
#RUN chown root:jenkins /var/run/docker.sock

USER jenkins

#WORKDIR /var/jenkins_home
