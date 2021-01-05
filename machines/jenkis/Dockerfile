FROM jenkins/jenkins:lts
USER root
RUN apt update
RUN apt install -y sudo ansible vim less
#python-pip
#RUN pip install urlparse4
RUN apt-get remove docker docker-engine docker.io containerd runc
RUN curl -fSsL get.docker.com | bash
RUN usermod -aG docker jenkins
RUN cp /etc/sudoers /etc/sudoers-backup
COPY ./testeecho .
RUN mv ./testeecho /etc/sudoers
WORKDIR /var/jenkins_home
