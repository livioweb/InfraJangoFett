# Devops 
## Bem vindo ao InfraJangoFett

Um pequeno projeto de infra utilizando maquinas virtuais, gerenciadas com o Vagrant.
Esta infra conta com uma VM com o jenkis, Gitlab. Sonakube e a do App, este ultimo sera onde a aplicação rodara. 

##### Links Uteis
* https://netdata.cloud
* https://learn.netdata.cloud/docs/
* https://learn.netdata.cloud/docs/agent/health/notifications/telegram

* https://www.vagrantup.com/docs/cli/snapshot

* https://grafana.com/grafana/dashboards/10922 netdata
* https://grafana.com/grafana/dashboards/10585 telegraf/docker


* https://github.com/influxdata/telegraf/tree/master/plugins/inputs/docker
* dobitaobyte.com.br/configurar-o-telegraf-para-enviar-dados-ao-influxdb/
* https://www.dobitaobyte.com.br/configurar-o-telegraf-para-enviar-dados-ao-influxdb/
````
telegraf --config /etc/telegraf/telegraf.conf&
````
````
sudo systemctl restart telegraf && sudo journalctl -f -u telegraf.service
````
Stressa maquina a 85%
````
$ stress-ng -c 0 -l 85
````
````
$ dd if=/dev/zero of=image.img bs=1M count=3000
$ls -lh
````
````
stress-ng --vm-bytes \
  $(awk \
    '/MemAvailable/{printf "%d\n", $2 * 0.9;}' \
    < /proc/meminfo\
  )k \
  --vm-keep -m 1
````

#### [gitlab]
172.17.177.40:9081 
* https://github.com/sameersbn/docker-gitlab
* token gitlab  VL3SM_CSo7xYn6irbQPo
* token  jenkins 11753692ff3ee827392867d9eb5564dd2d

###### netdata 
172.17.177.40:19999

#### [jenkis]
172.17.177.42:9080 

 * ansible jenkis -u vagrant --private-key  ssh-keys/vagrant_id_rsa -i hosts -m shell -a 'echo Hello, World'
 * ansible jenkis -u vagrant --private-key .vagrant/machines/jenkis/virtualbox/private_key  -i hosts -m shell -a 'echo Hello, World'
 * ssh-keygen -f "/home/anakin/.ssh/known_hosts" -R "172.17.177.42"
 * ssh-copy-id -i ssh-keys/vagrant_id_rsa.pub vagrant@172.17.177.42 -f 
 * echo "" > ~/.ssh/known_hosts

 ssh-keygen -t rsa -b 2048 -C "jenkis@pulse.com" 
 cat ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDzgSjwAwOeH00VurYz2aHEb2fw6AhXxzbZy4+EDyRf9S0KCeFD3JB7TwraZAuc6wK78shZHNdGNk8BoMHGLxxx/igA1s6OxP/Z9uTKp4hE7q2VukOBIfvhka0BuHkD6PebT9OCVXhGrkg0vqkrCaf2hyb6w5KmLJOrZgeekK1/UDNwnbht6JBcLA3TDBgRA1CelL8wdHl7AeunoOvw/ko66avT9CF6YzFzGXB164En5YYDjZvoFFsAwrf6fNpH1OAE/063vH7kvxahcDj0R02nBnnCe6xTxfK/Ax8/oQ5VDn/PawIqlBoRt+GU+Uye5Tww1yQE7lCtsQsDWeOdK/or jenkis@pulse.com" >> ~/.ssh/authorized_keys
###### netdata 
172.17.177.42:19999

#### [sonarkube]
172.17.177.44:9082 
###### netdata 
172.17.177.44:19999

#### [app]
172.17.177.48:8080
###### netdata 
172.17.177.48:19999

#### [grafana]
172.17.177.50
* https://github.com/terorie/netdata-influx

###### netdata 
172.17.177.50:19999
