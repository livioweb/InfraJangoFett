#!/bin/bash
FOLDER="gitlab"
#PROJETO="gitlabx"


cd /vagrant/$FOLDER

wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
#RUN IN VM's Vagrant
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
#RUN IN UBUNTU 18:04
#deb https://repos.influxdata.com/ubuntu bionic stable

sudo apt-get update && sudo apt-get install telegraf && apt-get -y install ansible
sleep 13
sudo rm /etc/telegraf/telegraf.conf
sudo cp /vagrant/$FOLDER/telegraf.conf /etc/telegraf/telegraf.conf
sudo systemctl start telegraf
sudo usermod -aG docker telegraf

# Install NETDATA via docker-composer
docker-compose up -d
sleep 13
curl -i -XPOST http://172.17.177.50:8086/query --data-urlencode "q=CREATE DATABASE gitlab_telegraf"
curl -i -XPOST http://172.17.177.50:8086/query --data-urlencode "q=CREATE DATABASE gitlab_netdata"



#mkdir $PROJETO
#cd $PROJETO
#cp /vagrant/$FOLDER/docker-compose.yml /home/vagrant/$PROJETO/
#chown -Rv vagrant: /home/vagrant/$PROJETO/

