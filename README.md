# Devops_Pulse
* https://netdata.cloud
* https://learn.netdata.cloud/docs/
* https://learn.netdata.cloud/docs/agent/health/notifications/telegram
* https://www.vagrantup.com/docs/cli/snapshot
* https://grafana.com/grafana/dashboards/10922

#### [gitlab]
172.17.177.40:9081 
* https://github.com/sameersbn/docker-gitlab
* 
###### netdata 
172.17.177.40:19999

#### [jenkis]
172.17.177.42:9080 

 * ansible jenkis -u vagrant --private-key  ssh-keys/vagrant_id_rsa -i hosts -m shell -a 'echo Hello, World'
 * ansible jenkis -u vagrant --private-key .vagrant/machines/jenkis/virtualbox/private_key  -i hosts -m shell -a 'echo Hello, World'
 * ssh-keygen -f "/home/anakin/.ssh/known_hosts" -R "172.17.177.42"
 * ssh-copy-id -i ssh-keys/vagrant_id_rsa.pub vagrant@172.17.177.42 -f 
 * echo "" > ~/.ssh/known_hosts
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
