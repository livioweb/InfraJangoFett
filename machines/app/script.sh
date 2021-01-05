#!/bin/bash
FOLDER="app"
#PROJETO="grafanax"

cd /vagrant/$FOLDER
docker build -t my-hello-world .
docker run -d -p 8080:8080 my-hello-world

docker-compose up -d

curl -G http://172.17.177.48:8086/query --data-urlencode "q=CREATE DATABASE app"

#docker run hello-world
