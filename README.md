# Devops_Pulse

#### [gitlab]
172.17.177.40:9081 
* https://github.com/sameersbn/docker-gitlab
#### [jenkis]
172.17.177.42:9080 

 * ansible jenkis -u vagrant --private-key  ssh-keys/vagrant_id_rsa -i hosts -m shell -a 'echo Hello, World'
 * ansible jenkis -u vagrant --private-key .vagrant/machines/jenkis/virtualbox/private_key  -i hosts -m shell -a 'echo Hello, World'
 * ssh-keygen -f "/home/anakin/.ssh/known_hosts" -R "172.17.177.42"
 * ssh-copy-id -i ssh-keys/vagrant_id_rsa.pub vagrant@172.17.177.42 -f 
 * echo "" > ~/.ssh/known_hosts

#### [sonarkube]
172.17.177.44:9082 

#### [app]
172.17.177.48:8080


https://www.vagrantup.com/docs/cli/snapshot
