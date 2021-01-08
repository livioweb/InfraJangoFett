#!/bin/bash
FOLDER="grafana"
#PROJETO="grafanax"

cd /vagrant/$FOLDER
docker-compose up -d

wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
#deb https://repos.influxdata.com/ubuntu bionic stable

sudo apt-get update && sudo apt-get install telegraf
sudo systemctl start telegraf
sudo usermod -aG docker telegraf

#mkdir $PROJETO
#cd $PROJETO
#cp /vagrant/$FOLDER/docker-compose.yml /home/vagrant/$PROJETO/
#chown -Rv vagrant: /home/vagrant/$PROJETO/

