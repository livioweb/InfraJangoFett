#!/bin/bash
FOLDER="app"
#PROJETO="grafanax"

cd /vagrant/$FOLDER/
docker build -t my-hello-world .
docker run -d -p 8080:8080 my-hello-world

cd /vagrant/$FOLDER/Devops/
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
#RUN IN VM's Vagrant
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
#RUN IN UBUNTU 18:04
#deb https://repos.influxdata.com/ubuntu bionic stable

sudo apt-get update && sudo apt-get install telegraf
sleep 13
sudo rm /etc/telegraf/telegraf.conf
sudo cp /vagrant/app/Devops/telegraf.conf /etc/telegraf/telegraf.conf
sudo systemctl start telegraf
sudo usermod -aG docker telegraf

# Install NETDATA via docker-composer
docker-compose up -d
sleep 13
curl -i -XPOST http://172.17.177.50:8086/query --data-urlencode "q=CREATE DATABASE app_telegraf"
curl -i -XPOST http://172.17.177.50:8086/query --data-urlencode "q=CREATE DATABASE app_netdata"



