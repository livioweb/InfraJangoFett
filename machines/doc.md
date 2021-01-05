ssh-keygen -t rsa
ssh-copy-id -i vagrant_id_rsa.pub vagrant@172.17.177.40
A senha = vagrant


ansible-playbook provisioning.yml -u vagrant -i hosts --private-key ssh-keys/vagrant_id_rsa     

* $ 
ansible gitlab -u vagrant --private-key  ssh-keys/vagrant_id_rsa -i hosts -m shell -a 'echo Hello, World'



ansible gitlab -u vagrant --private-key .vagrant/machines/gitlab/virtualbox/private_key  -i hosts -m shell -a 'echo Hello, World'
ssh-copy-id -i ssh-keys/vagrant_id_rsa.pub vagrant@172.17.177.40
