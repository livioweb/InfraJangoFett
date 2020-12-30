#!/bin/bash

cd /vagrant/app
docker build -t my-hello-world .
docker run -d -p 8080:8080 my-hello-world

#docker run hello-world
