#!/bin/bash
FOLDER="gitlab"
#PROJETO="gitlabx"

cd /vagrant/$FOLDER
docker-compose up -d

#mkdir $PROJETO
#cd $PROJETO
#cp /vagrant/$FOLDER/docker-compose.yml /home/vagrant/$PROJETO/
#chown -Rv vagrant: /home/vagrant/$PROJETO/

